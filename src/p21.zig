const std = @import("std");
const STEPfile = @import("stepcode/cleditor/STEPfile.zig").STEPfile;
const Registry = @import("stepcode/clstepcore/Registry.zig").Registry;

pub fn main() !void {
    // hint: it won't work (this file won't compile due to errors in imports)
    try std.io.getStdOut().writer().writeAll("It works!\n");
}
