const std = @import("std");
const json = std.json;
const json_buffer_length = 512;

const BackToCad = struct { api_version: u8, design: DesignTypes };

const DesignTypes = struct {
    pipes: ?[]PipeOrCable = null,
    cables: ?[]PipeOrCable = null,
    boxes: ?[]Box = null,
    spheres: ?[]Sphere = null,
};

const PipeOrCable = struct {
    id: []const u8,
    parent: []const u8,
    // instance_name = ""
    display_name: []const u8,
    // original_name = ""
    part_number: []const u8,
    // geometry = true
    skr_world: []const u8,
    absolute_transformation: TransformMatrix,
    color: Color,
    radius: f64,
    local_points: []LocalPointObject,
    radius_of_curvature: f64,
};

const Box = struct {
    id: []const u8,
    parent: []const u8,
    // instance_name = ""
    display_name: []const u8,
    // original_name = ""
    part_number: []const u8,
    // geometry = true
    skr_world: []const u8,
    absolute_transformation: TransformMatrix,
    color: Color,
    local_point: LocalPoint,
};

const Sphere = struct {
    id: []const u8,
    parent: []const u8,
    // instance_name = ""
    display_name: []const u8,
    // original_name = ""
    part_number: []const u8,
    // geometry = true
    skr_world: []const u8,
    absolute_transformation: TransformMatrix,
    color: Color,
    radius: f64,
};

const TransformMatrix = [16]f64;
const Color = struct { r: f64, g: f64, b: f64 };
const LocalPointObject = struct { local_point: LocalPoint };
const LocalPoint = [3]f64;

pub fn main() !void {
    const input_cur_dir = try std.fs.cwd().openDir("input", .{});
    const input_file = try input_cur_dir.openFile("BackToCAD.json", .{});
    defer input_file.close();

    // var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // defer arena.deinit();
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const leaks: std.heap.Check = gpa.deinit();
        switch (leaks) {
            .ok => std.log.debug("GPA detected no leaks!", .{}),
            .leak => std.log.err("This program leaks memory!", .{}),
        }
    }
    const allocator = gpa.allocator();
    const json_reader_type = json.Reader(json_buffer_length, std.fs.File.Reader);
    var json_reader = json_reader_type.init(allocator, input_file.reader());
    defer json_reader.deinit();
    var parsed = try json.parseFromTokenSource(BackToCad, allocator, &json_reader, .{ .ignore_unknown_fields = true });
    defer parsed.deinit();

    const output_dir_name = "output";
    const output_dir = try std.fs.cwd().openDir(output_dir_name, .{});
    const output_file = try output_dir.createFile("designs.json", .{});
    defer output_file.close();
    try json.stringify(parsed.value, .{ .whitespace = .indent_4 }, output_file.writer());
}

/// This function assumes buf doesn't overlap in memory with str1 or str2.
/// Returns the length copied to buf.
fn strConcat(str1: []const u8, str2: []const u8, buf: *const []u8) usize {
    @memcpy(buf.*[0..str1.len], str1);
    @memcpy(buf.*[str1.len .. str1.len + str2.len], str2);
    return str1.len + str2.len;
}

test strConcat {
    const str_array = [_][]const u8{ "square", "circle", "triangle" };
    var buffer1: [100]u8 = undefined;
    var buffer2: [100]u8 = undefined;
    var index: usize = 0;
    const separator = ", ";
    for (str_array) |str| {
        var prev_index = index;
        index += str.len;
        @memcpy(buffer1[prev_index..index], str);
        prev_index = index;
        index += separator.len;
        @memcpy(buffer1[prev_index..index], separator);
    }
    const expected = "square, circle, triangle, ";
    try std.testing.expect(std.mem.eql(u8, expected, buffer1[0..index]));
    index = 0;
    for (str_array) |str| {
        index += strConcat(str, separator, &buffer2[index..]);
    }
    try std.testing.expect(std.mem.eql(u8, expected, buffer2[0..index]));
}
