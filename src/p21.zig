const std = @import("std");
const STEPfile = @import("stepcode/cleditor/STEPfile.zig").STEPfile;
const Registry = @import("stepcode/clstepcore/Registry.zig").Registry;

pub fn main() !void {
    // no idea where SchemaInit is
    // var registry = Registry(SchemaInit);
    // no idea where InstMgr is
    // var instance_list: InstMgr = undefined;
    var sfile: STEPfile = undefined;
    // sfile = STEPfile(registry, instance_list, "", false);
    sfile.ReadExchangeFile();
}
