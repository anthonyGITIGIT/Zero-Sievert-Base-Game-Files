function faction_set_rep(arg0, arg1, arg2)
{
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1, arg2);
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0, arg2);
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1, clamp(variable_struct_get(struct_get_from_hash(variable_struct_get(global.struct_faction, arg0), variable_get_hash("relationship")), arg1), 0, 1000));
    variable_struct_set(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0, clamp(variable_struct_get(struct_get_from_hash(variable_struct_get(global.struct_faction, arg1), variable_get_hash("relationship")), arg0), 0, 1000));
}
