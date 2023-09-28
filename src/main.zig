const std = @import("std");
const json = std.json;
const json_buffer_length = 512;

pub fn main() !void {
    const input_cur_dir = try std.fs.cwd().openDir("input", .{});
    const input_file = try input_cur_dir.openFile("BackToCAD.json", .{});
    defer input_file.close();

    // TODO: figure out why b2c.object is corrupted
    // I assume it's something to do with json_buffer_length... maybe I need to stream
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const json_reader_type = json.Reader(json_buffer_length, std.fs.File.Reader);
    var json_reader = json_reader_type.init(allocator, input_file.reader());
    var parsed = try json.parseFromTokenSource(json.Value, allocator, &json_reader, .{});
    defer parsed.deinit();

    const api_ver_key = "api_version";
    const b2c = parsed.value;
    if (b2c == .object) {
        std.log.debug("JSON root element is an object", .{});
        if (b2c.object.get(api_ver_key)) |version| {
            std.log.debug("Read file with API version {s}", .{version.string});
        } else if (b2c.object.contains(api_ver_key)) {
            std.log.warn("object.get() doesn't return {s}, but object.contains() does", .{api_ver_key});
        } else {
            std.log.debug("api_version key doesn't exist", .{});
            std.log.debug("Root object contains {d} KV-pairs", .{b2c.object.count()});
            var buffer: [1024]u8 = undefined;
            var index: usize = 0;
            const left_boundary = "«";
            const right_boundary = "»";
            const separator = ", ";
            for (b2c.object.keys()) |key| {
                index += strConcat(left_boundary, key, &buffer[index..]);
                index += strConcat(right_boundary, separator, &buffer[index..]);
            }
            std.log.debug("{s}", .{buffer[0..index]});
        }
    }
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
