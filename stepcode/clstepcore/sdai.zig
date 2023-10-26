// auto generated by c2z
const std = @import("std");
//const cpp = @import("cpp");

extern const _1_SCLversion_: *const [*c]u8;
pub const SCLversion = _1_SCLversion_;

pub const Express_id = cpp.String;

pub const SDAI_Integer = c_long;

pub const SDAI_Short = c_short;

pub const SDAI_UShort = c_ushort;

pub const SDAI_ULong = c_ulong;

pub const SDAI_Real = f64;

extern const _1_SDAI_INT_NULL_: *const SDAI_Integer;
pub const SDAI_INT_NULL = _1_SDAI_INT_NULL_;

extern const _1_SDAI_REAL_NULL_: *const SDAI_Real;
pub const SDAI_REAL_NULL = _1_SDAI_REAL_NULL_;

extern const _1_SDAI_NUMBER_NULL_: *const SDAI_Real;
pub const SDAI_NUMBER_NULL = _1_SDAI_NUMBER_NULL_;

pub const SDAI_Access_type = extern struct {
    bits: c_int = 0,

    pub const SDAI_sdaiRO: SDAI_Access_type = .{ .bits = 0 };
    pub const SDAI_sdaiRW: SDAI_Access_type = .{ .bits = 1 };
    pub const _unset: SDAI_Access_type = .{ .bits = 2 };

    // pub usingnamespace cpp.FlagsMixin(SDAI_Access_type);
};

pub const SDAI_Commit_mode = extern struct {
    bits: c_int = 0,

    pub const SDAI_sdaiCOMMIT: SDAI_Commit_mode = .{ .bits = 0 };
    pub const SDAI_sdaiABORT: SDAI_Commit_mode = .{ .bits = 1 };

    // pub usingnamespace cpp.FlagsMixin(SDAI_Commit_mode);
};

pub const SDAI_AttrFlag = extern struct {
    bits: c_int = 0,

    pub const SDAI_sdaiSET: SDAI_AttrFlag = .{ .bits = 0 };
    pub const SDAI_sdaiUNSET: SDAI_AttrFlag = .{ .bits = 1 };

    // pub usingnamespace cpp.FlagsMixin(SDAI_AttrFlag);
};

pub const SDAI_ImplementationClass = extern struct {
    bits: c_int = 0,

    pub const SDAI_sdaiCLASS1: SDAI_ImplementationClass = .{ .bits = 0 };
    pub const SDAI_sdaiCLASS2: SDAI_ImplementationClass = .{ .bits = 1 };
    pub const SDAI_sdaiCLASS3: SDAI_ImplementationClass = .{ .bits = 2 };
    pub const SDAI_sdaiCLASS4: SDAI_ImplementationClass = .{ .bits = 3 };
    pub const SDAI_sdaiCLASS5: SDAI_ImplementationClass = .{ .bits = 4 };

    // pub usingnamespace cpp.FlagsMixin(SDAI_ImplementationClass);
};

pub const SDAI_Error_id = extern struct {
    bits: c_int = 0,

    pub const SDAI_sdaiNO_ERR: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(0)) };
    pub const SDAI_sdaiSS_OPN: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(10)) };
    pub const SDAI_sdaiSS_NAVL: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(20)) };
    pub const SDAI_sdaiSS_NOPN: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(30)) };
    pub const SDAI_sdaiRP_NEXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(40)) };
    pub const SDAI_sdaiRP_NAVL: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(50)) };
    pub const SDAI_sdaiRP_OPN: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(60)) };
    pub const SDAI_sdaiRP_NOPN: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(70)) };
    pub const SDAI_sdaiTR_EAB: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(80)) };
    pub const SDAI_sdaiTR_EXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(90)) };
    pub const SDAI_sdaiTR_NAVL: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(100)) };
    pub const SDAI_sdaiTR_RW: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(110)) };
    pub const SDAI_sdaiTR_NRW: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(120)) };
    pub const SDAI_sdaiTR_NEXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(130)) };
    pub const SDAI_sdaiMO_NDEQ: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(140)) };
    pub const SDAI_sdaiMO_NEXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(150)) };
    pub const SDAI_sdaiMO_NVLD: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(160)) };
    pub const SDAI_sdaiMO_DUP: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(170)) };
    pub const SDAI_sdaiMX_NRW: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(180)) };
    pub const SDAI_sdaiMX_NDEF: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(190)) };
    pub const SDAI_sdaiMX_RW: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(200)) };
    pub const SDAI_sdaiMX_RO: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(210)) };
    pub const SDAI_sdaiSD_NDEF: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(220)) };
    pub const SDAI_sdaiED_NDEF: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(230)) };
    pub const SDAI_sdaiED_NDEQ: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(240)) };
    pub const SDAI_sdaiED_NVLD: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(250)) };
    pub const SDAI_sdaiRU_NDEF: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(260)) };
    pub const SDAI_sdaiEX_NSUP: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(270)) };
    pub const SDAI_sdaiAT_NVLD: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(280)) };
    pub const SDAI_sdaiAT_NDEF: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(290)) };
    pub const SDAI_sdaiSI_DUP: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(300)) };
    pub const SDAI_sdaiSI_NEXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(310)) };
    pub const SDAI_sdaiEI_NEXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(320)) };
    pub const SDAI_sdaiEI_NAVL: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(330)) };
    pub const SDAI_sdaiEI_NVLD: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(340)) };
    pub const SDAI_sdaiEI_NEXP: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(350)) };
    pub const SDAI_sdaiSC_NEXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(360)) };
    pub const SDAI_sdaiSC_EXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(370)) };
    pub const SDAI_sdaiAI_NEXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(380)) };
    pub const SDAI_sdaiAI_NVLD: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(390)) };
    pub const SDAI_sdaiAI_NSET: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(400)) };
    pub const SDAI_sdaiVA_NVLD: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(410)) };
    pub const SDAI_sdaiVA_NEXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(420)) };
    pub const SDAI_sdaiVA_NSET: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(430)) };
    pub const SDAI_sdaiVT_NVLD: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(440)) };
    pub const SDAI_sdaiIR_NEXS: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(450)) };
    pub const SDAI_sdaiIR_NSET: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(460)) };
    pub const SDAI_sdaiIX_NVLD: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(470)) };
    pub const SDAI_sdaiER_NSET: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(480)) };
    pub const SDAI_sdaiOP_NVLD: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(490)) };
    pub const SDAI_sdaiFN_NAVL: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(500)) };
    pub const SDAI_sdaiSY_ERR: SDAI_Error_id = .{ .bits = @as(c_uint, @intCast(1000)) };

    // pub usingnamespace cpp.FlagsMixin(SDAI_Error_id);
};

pub const SDAI_Time_stamp = [*c]u8;

pub const SDAI_Entity_name = [*c]u8;

pub const SDAI_Schema_name = [*c]u8;

pub const SDAI_Model_contents_ptr = [*c]SDAI_Model_contents;

pub const SDAI_Model_contents_var = SDAI_Model_contents_ptr;

extern var _1_NilSTEPentity_: *SDAI_Application_instance;
pub const NilSTEPentity = _1_NilSTEPentity_;

pub const STEPentity = SDAI_Application_instance;

pub const STEPentity_ptr = [*c]SDAI_Application_instance;

pub const STEPentity_var = STEPentity_ptr;

pub const STEPentityPtr = [*c]SDAI_Application_instance;

pub const STEPentityH = [*c]SDAI_Application_instance;

extern fn _1_ReadEntityRef_(in: *istream, err: [*c]ErrorDescriptor, tokenList: [*c]const u8, instances: [*c]InstMgrBase, addFileId: c_int) [*c]SDAI_Application_instance;
pub const ReadEntityRef = _1_ReadEntityRef_;

extern fn _1_create_BOOLEAN_() [*c]SDAI_BOOLEAN;
///****************************************************************************
///AGGREGATE TYPES
///    Aggregate types are accessed generically.  (There are not separate
///    classes for the different types of aggregates.)  Aggregates are
///    implemented through the STEPaggregate class.
///****************************************************************************
pub const create_BOOLEAN = _1_create_BOOLEAN_;

pub inline fn create_LOGICAL() [*c]SDAI_LOGICAL {
    return;
}
pub const SdaiSelectH = [*c]SDAI_Select;

// opaques

const TypeDescriptor = anyopaque;
const EntityDescriptor = anyopaque;
const SelectTypeDescriptor = anyopaque;
const InstMgrBase = anyopaque;
const STEPattributeList = anyopaque;
const STEPattribute = anyopaque;
const SDAI_Model_contents = anyopaque;
