//! json-to-cad parses BackToCAD.json files from SkyReal VR
//! Copyright 2023 ÅKP AS
//! SPDX-License-Identifier: MIT

const std = @import("std");
const BackToCad = @import("BackToCad.zig");
const json = std.json;
const json_buffer_length = 512;

/// Reads ./input/BackToCAD.json, parses the designs in it, and writes them (for
/// debugging purposes) to ./output/designs.json. The input and output
/// directories must exist in the current working directory, otherwise it will
/// return an error.
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
