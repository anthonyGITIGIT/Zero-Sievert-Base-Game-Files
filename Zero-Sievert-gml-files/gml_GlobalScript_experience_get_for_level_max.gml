function experience_get_for_level_max()
{
    var _levels = struct_get_from_hash(global.xp_data, variable_get_hash("levels"));
    return struct_get_from_hash(array_get(_levels, array_length(_levels) - 1), variable_get_hash("xp"));
}
