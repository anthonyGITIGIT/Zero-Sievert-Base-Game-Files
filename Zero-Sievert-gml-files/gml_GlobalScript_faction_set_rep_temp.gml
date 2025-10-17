function faction_set_rep_temp(arg0, arg1, arg2)
{
    if (is_undefined(arg0) || is_undefined(arg1))
        exit;
    
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction_temp, arg0), variable_get_hash("relationship")), arg1, arg2);
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction_temp, arg1), variable_get_hash("relationship")), arg0, arg2);
}
