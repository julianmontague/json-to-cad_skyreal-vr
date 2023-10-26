// auto generated by c2z
const std = @import("std");
//const cpp = @import("cpp");

extern const _1_t_sdaiINTEGER_: *const TypeDescriptor *const;
pub const t_sdaiINTEGER = _1_t_sdaiINTEGER_;

extern const _1_t_sdaiREAL_: *const TypeDescriptor *const;
pub const t_sdaiREAL = _1_t_sdaiREAL_;

extern const _1_t_sdaiNUMBER_: *const TypeDescriptor *const;
pub const t_sdaiNUMBER = _1_t_sdaiNUMBER_;

extern const _1_t_sdaiSTRING_: *const TypeDescriptor *const;
pub const t_sdaiSTRING = _1_t_sdaiSTRING_;

extern const _1_t_sdaiBINARY_: *const TypeDescriptor *const;
pub const t_sdaiBINARY = _1_t_sdaiBINARY_;

extern const _1_t_sdaiBOOLEAN_: *const TypeDescriptor *const;
pub const t_sdaiBOOLEAN = _1_t_sdaiBOOLEAN_;

extern const _1_t_sdaiLOGICAL_: *const TypeDescriptor *const;
pub const t_sdaiLOGICAL = _1_t_sdaiLOGICAL_;

pub const HashTable = [*c]Hash_Table;

pub const CF_init = ?*const fn(*Registry) callconv(.C) void ;

pub const Registry = extern struct {
    primordialSwamp: HashTable,
    active_schemas: HashTable,
    active_types: HashTable,
    col: [*c]ComplexCollect,
    entity_cnt: c_int,
    all_ents_cnt: c_int,
    cur_entity: HashEntry,
    cur_schema: HashEntry,
    cur_type: HashEntry,

extern fn @"_1_Registry_AddClones_"(self: *Registry, __arg0: *const EntityDescriptor) void;
pub const AddClones = @"_1_Registry_AddClones_";

extern fn @"_1_Registry_RemoveClones_"(self: *Registry, __arg0: *const EntityDescriptor) void;
pub const RemoveClones = @"_1_Registry_RemoveClones_";

extern fn @"_1_Registry_init_"(initFunct: CF_init) Registry;
pub const init = @"_1_Registry_init_";

) Registry;
pub const init = @"_1_Registry_init_";

    extern fn @"_1_Registry_deinit_"(self: *Registry) void;
    pub const deinit = @"_1_Registry_deinit_";

extern fn @"_1_Registry_DeleteContents_"(self: *Registry) void;
pub const DeleteContents = @"_1_Registry_DeleteContents_";

extern fn @"_1_Registry_FindEntity_"(self: *const Registry, __arg0: [*c]const u8, __arg1: [*c]const u8, check_case: c_int) [*c]const EntityDescriptor;
pub fn FindEntity(self: *const Registry, __arg0: [*c]const u8, __opt: struct { __arg1: [*c]const u8 = null, check_case: c_int = 0,  },) [*c]const EntityDescriptor {
    return @"_1_Registry_FindEntity_"(self, __arg0, __opt.__arg1, __opt.check_case);
}

extern fn @"_1_Registry_FindSchema_"(self: *const Registry, __arg0: [*c]const u8, check_case: c_int) [*c]const Schema;
pub fn FindSchema(self: *const Registry, __arg0: [*c]const u8, __opt: struct { check_case: c_int = 0,  },) [*c]const Schema {
    return @"_1_Registry_FindSchema_"(self, __arg0, __opt.check_case);
}

extern fn @"_1_Registry_FindType_"(self: *const Registry, __arg0: [*c]const u8, check_case: c_int) [*c]const TypeDescriptor;
pub fn FindType(self: *const Registry, __arg0: [*c]const u8, __opt: struct { check_case: c_int = 0,  },) [*c]const TypeDescriptor {
    return @"_1_Registry_FindType_"(self, __arg0, __opt.check_case);
}

extern fn @"_1_Registry_AddEntity_"(self: *Registry, __arg0: *const EntityDescriptor) void;
pub const AddEntity = @"_1_Registry_AddEntity_";

extern fn @"_1_Registry_AddSchema_"(self: *Registry, __arg0: *const Schema) void;
pub const AddSchema = @"_1_Registry_AddSchema_";

extern fn @"_1_Registry_AddType_"(self: *Registry, __arg0: *const TypeDescriptor) void;
pub const AddType = @"_1_Registry_AddType_";

extern fn @"_1_Registry_RemoveEntity_"(self: *Registry, __arg0: [*c]const u8) void;
pub const RemoveEntity = @"_1_Registry_RemoveEntity_";

extern fn @"_1_Registry_RemoveSchema_"(self: *Registry, __arg0: [*c]const u8) void;
pub const RemoveSchema = @"_1_Registry_RemoveSchema_";

extern fn @"_1_Registry_RemoveType_"(self: *Registry, __arg0: [*c]const u8) void;
pub const RemoveType = @"_1_Registry_RemoveType_";

extern fn @"_1_Registry_GetEntityCnt_"(self: *Registry) c_int;
pub const GetEntityCnt = @"_1_Registry_GetEntityCnt_";

pub fn GetFullEntCnt(self: *Registry) c_int {
    return self.all_ents_cnt;
}
extern fn @"_1_Registry_ResetEntities_"(self: *Registry) void;
pub const ResetEntities = @"_1_Registry_ResetEntities_";

extern fn @"_1_Registry_NextEntity_"(self: *Registry) [*c]const EntityDescriptor;
pub const NextEntity = @"_1_Registry_NextEntity_";

extern fn @"_1_Registry_ResetSchemas_"(self: *Registry) void;
pub const ResetSchemas = @"_1_Registry_ResetSchemas_";

extern fn @"_1_Registry_NextSchema_"(self: *Registry) [*c]const Schema;
pub const NextSchema = @"_1_Registry_NextSchema_";

extern fn @"_1_Registry_ResetTypes_"(self: *Registry) void;
pub const ResetTypes = @"_1_Registry_ResetTypes_";

extern fn @"_1_Registry_NextType_"(self: *Registry) [*c]const TypeDescriptor;
pub const NextType = @"_1_Registry_NextType_";

pub fn CompCol(self: *Registry) [*c]const ComplexCollect {
    return self.col;
}
pub fn SetCompCollect(self: *Registry, c: [*c]ComplexCollect) void {
    self.col = c;
}
extern fn @"_1_Registry_ObjCreate_"(self: *const Registry, nm: [*c]const u8, __arg1: [*c]const u8, check_case: c_int) [*c]SDAI_Application_instance;
pub fn ObjCreate(self: *const Registry, nm: [*c]const u8, __opt: struct { __arg1: [*c]const u8 = null, check_case: c_int = 0,  },) [*c]SDAI_Application_instance {
    return @"_1_Registry_ObjCreate_"(self, nm, __opt.__arg1, __opt.check_case);
}

};
