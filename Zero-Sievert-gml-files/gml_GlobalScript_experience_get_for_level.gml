function experience_get_for_level(arg0)
{
    var _levels = struct_get_from_hash(global.xp_data, variable_get_hash("levels"));
    
    if (array_length(_levels) > arg0)
        return floor(struct_get_from_hash(array_get(_levels, arg0), variable_get_hash("xp")));
    
    return undefined;
}
