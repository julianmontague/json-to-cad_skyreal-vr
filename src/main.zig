const std = @import("std");
const json = std.json;
const json_buffer_length = 512;

pub fn main() !void {
    const input_cur_dir = try std.fs.cwd().openDir("input", .{});
    const input_file = try input_cur_dir.openFile("test.json", .{});
    defer input_file.close();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const json_reader_type = json.Reader(json_buffer_length, std.fs.File.Reader);
    var json_reader = json_reader_type.init(allocator, input_file.reader());
    var parsed = try json.parseFromTokenSource(json.Value, allocator, &json_reader, .{});
    defer parsed.deinit();

    std.log.debug("{any}", .{parsed.value});
}
