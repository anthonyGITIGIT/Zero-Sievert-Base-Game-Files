/// Decompiler warnings:
// gml_Script___catspeak_preset_draw: Data left over on VM stack at end of fragment (256 elements).

function __catspeak_preset_get(arg0)
{
    var presetFunc = ds_map_find_value(global.__catspeakPresets, arg0);
    
    if (false && presetFunc == undefined)
        __catspeak_error_bug();
    
    return presetFunc;
}

function __catspeak_preset_gml(arg0)
{
    arg0.renameKeyword("//", "div", "--", "//", "let", "var", "fun", "function", "impl", "constructor");
    arg0.addKeyword("&&", UnknownEnum.Value_36, "||", UnknownEnum.Value_37, "mod", UnknownEnum.Value_17, "not", UnknownEnum.Value_29);
}

function __catspeak_preset_type(arg0)
{
    arg0.addFunction("is_string", is_string, "is_real", is_real, "is_numeric", is_numeric, "is_bool", is_bool, "is_array", is_array, "is_struct", is_struct, "is_method", is_method, "is_ptr", is_ptr, "is_int32", is_int32, "is_int64", is_int64, "is_undefined", is_undefined, "is_nan", is_nan, "is_infinity", is_infinity, "typeof", typeof, "bool", bool, "ptr", ptr, "int64", int64, "string", string, "real", real);
}

function __catspeak_preset_array(arg0)
{
    arg0.addFunction("array_create", array_create, "array_copy", array_copy, "array_equals", array_equals, "array_get", array_get, "array_set", array_set, "array_push", array_push, "array_pop", array_pop, "array_insert", array_insert, "array_delete", array_delete, "array_sort", array_sort, "array_length", array_length, "array_resize", array_resize);
}

function __catspeak_preset_struct(arg0)
{
    arg0.addFunction("struct_exists", variable_struct_exists, "struct_get", variable_struct_get, "struct_set", variable_struct_set, "struct_remove", variable_struct_remove, "struct_get_names", variable_struct_get_names, "struct_names_count", variable_struct_names_count, "instanceof", instanceof);
}

function __catspeak_preset_string(arg0)
{
    arg0.addFunction("ansi_char", ansi_char, "chr", chr, "ord", ord, "string_byte_at", string_byte_at, "string_byte_length", string_byte_length, "string_set_byte_at", string_set_byte_at, "string_char_at", string_char_at, "string_ord_at", string_ord_at, "string_length", string_length, "string_pos", string_pos, "string_pos_ext", string_pos_ext, "string_last_pos", string_last_pos, "string_last_pos_ext", string_last_pos_ext, "string_starts_with", string_starts_with, "string_ends_with", string_ends_with, "string_count", string_count, "string_copy", string_copy, "string_delete", string_delete, "string_digits", string_digits, "string_format", string_format, "string_insert", string_insert, "string_letters", string_letters, "string_lettersdigits", string_lettersdigits, "string_lower", string_lower, "string_repeat", string_repeat, "string_replace", string_replace, "string_replace_all", string_replace_all, "string_upper", string_upper, "string_hash_to_newline", string_hash_to_newline, "string_trim", string_trim, "string_trim_start", string_trim_start, "string_trim_end", string_trim_end, "string_split", string_split, "string_split_ext", string_split_ext, "string_join", string_join, "string_join_ext", string_join_ext, "string_concat", string_concat, "string_concat_ext", string_concat_ext, "string_width", string_width, "string_width_ext", string_width_ext, "string_height", string_height, "string_height_ext", string_height_ext, "string_foreach", string_foreach);
}

function __catspeak_preset_math(arg0)
{
    arg0.addFunction("round", round, "frac", frac, "abs", abs, "sign", sign, "floor", floor, "ceil", ceil, "min", min, "max", max, "mean", mean, "median", median, "lerp", lerp, "clamp", clamp, "exp", exp, "ln", ln, "power", power, "sqr", sqr, "sqrt", sqrt, "log2", log2, "log10", log10, "logn", logn, "arccos", arccos, "arcsin", arcsin, "arctan", arctan, "arctan2", arctan2, "cos", cos, "sin", sin, "tan", tan, "dcos", dcos, "dsin", dsin, "dtan", dtan, "darccos", darccos, "darcsin", darcsin, "darctan", darctan, "darctan2", darctan2, "degtorad", degtorad, "radtodeg", radtodeg, "point_direction", point_direction, "point_distance", point_distance, "distance_to_point", distance_to_point, "dot_product", dot_product, "dot_product_normalised", dot_product_normalised, "angle_difference", angle_difference, "lengthdir_x", lengthdir_x, "lengthdir_y", lengthdir_y);
    arg0.addConstant("pi", pi);
}

function __catspeak_preset_math_3d(arg0)
{
    arg0.addFunction("point_distance_3d", point_distance_3d, "dot_product_3d", dot_product_3d, "dot_product_3d_normalised", dot_product_3d_normalised, "matrix_build", matrix_build, "matrix_multiply", matrix_multiply, "matrix_build_identity", matrix_build_identity, "matrix_build_lookat", matrix_build_lookat, "matrix_build_projection_ortho", matrix_build_projection_ortho, "matrix_build_projection_perspective", matrix_build_projection_perspective, "matrix_build_projection_perspective_fov", matrix_build_projection_perspective_fov, "matrix_transform_vertex", matrix_transform_vertex);
    arg0.addConstant("pi", pi);
}

function __catspeak_preset_colour(arg0)
{
    arg0.addFunction("colour_get_blue", colour_get_blue, "colour_get_green", colour_get_green, "colour_get_red", colour_get_red, "colour_get_hue", colour_get_hue, "colour_get_saturation", colour_get_saturation, "colour_get_value", colour_get_value, "make_colour_rgb", make_colour_rgb, "make_colour_hsv", make_colour_hsv, "merge_colour", merge_colour);
    arg0.addConstant("c_aqua", 16776960, "c_black", 0, "c_blue", 16711680, "c_dkgray", 4210752, "c_fuchsia", 16711935, "c_grey", 8421504, "c_green", 32768, "c_lime", 65280, "c_ltgrey", 12632256, "c_maroon", 128, "c_navy", 8388608, "c_olive", 32896, "c_orange", 4235519, "c_purple", 8388736, "c_red", 255, "c_silver", 12632256, "c_teal", 8421376, "c_white", 16777215, "c_yellow", 65535);
}

function __catspeak_preset_draw(arg0)
{
    "draw_sprite_part_ext".addFunction("draw_self", draw_self, "draw_sprite", draw_sprite, "draw_sprite_pos", draw_sprite_pos, "draw_sprite_ext", draw_sprite_ext, "draw_sprite_stretched", draw_sprite_stretched, "draw_sprite_stretched_ext", draw_sprite_stretched_ext, "draw_sprite_tiled", draw_sprite_tiled, "draw_sprite_tiled_ext", draw_sprite_tiled_ext, "draw_sprite_part", draw_sprite_part);
    arg0.addConstant("vertex_usage_position", 1, "vertex_usage_colour", 2, "vertex_usage_color", 2, "vertex_usage_normal", 3, "vertex_usage_texcoord", 4, "vertex_usage_textcoord", 4, "vertex_usage_blendweight", 5, "vertex_usage_blendindices", 6, "vertex_usage_psize", 7, "vertex_usage_tangent", 8, "vertex_usage_binormal", 9, "vertex_usage_fog", 12, "vertex_usage_depth", 13, "vertex_usage_sample", 14, "vertex_type_float1", 1, "vertex_type_float2", 2, "vertex_type_float3", 3, "vertex_type_float4", 4, "vertex_type_colour", 5, "vertex_type_color", 5, "vertex_type_ubyte4", 6);
}

function __catspeak_preset_random(arg0)
{
    arg0.addFunction("choose", choose, "random", random, "random_range", random_range, "irandom", irandom, "irandom_range", irandom_range);
}

function __catspeak_preset_unsafe(arg0)
{
    arg0.addFunction("asset_get_index", asset_get_index, "asset_get_type", asset_get_type, "tag_get_asset_ids", tag_get_asset_ids, "tag_get_assets", tag_get_assets, "asset_get_tags", asset_get_tags, "asset_add_tags", asset_add_tags, "asset_remove_tags", asset_remove_tags, "asset_has_tags", asset_has_tags, "asset_has_any_tag", asset_has_any_tag, "asset_clear_tags", asset_clear_tags);
}

function catspeak_preset_add(arg0, arg1)
{
    var presets = global.__catspeakPresets;
    
    if (ds_map_exists(presets, arg0))
        __catspeak_error("a preset with the key '", arg0, "' already exists");
    
    ds_map_set(presets, arg0, arg1);
}

function __catspeak_init_presets()
{
    global.__catspeakPresets = ds_map_create();
    catspeak_preset_add(UnknownEnum.Value_0, __catspeak_preset_gml);
    catspeak_preset_add(UnknownEnum.Value_1, __catspeak_preset_type);
    catspeak_preset_add(UnknownEnum.Value_2, __catspeak_preset_array);
    catspeak_preset_add(UnknownEnum.Value_3, __catspeak_preset_struct);
    catspeak_preset_add(UnknownEnum.Value_4, __catspeak_preset_string);
    catspeak_preset_add(UnknownEnum.Value_5, __catspeak_preset_math);
    catspeak_preset_add(UnknownEnum.Value_6, __catspeak_preset_math_3d);
    catspeak_preset_add(UnknownEnum.Value_7, __catspeak_preset_colour);
    catspeak_preset_add(UnknownEnum.Value_8, __catspeak_preset_draw);
    catspeak_preset_add(UnknownEnum.Value_9, __catspeak_preset_random);
    catspeak_preset_add(UnknownEnum.Value_10, __catspeak_preset_unsafe);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_17 = 17,
    Value_29 = 29,
    Value_36 = 36,
    Value_37
}
