function faction_get_rep_temp(arg0, arg1)
{
    if (variable_struct_exists(global.struct_faction_temp, arg0))
        return variable_struct_get(struct_get_from_hash(variable_struct_get(global.struct_faction_temp, arg0), variable_get_hash("relationship")), arg1);
    else
        return 0;
}
