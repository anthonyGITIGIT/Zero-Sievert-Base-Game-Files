function item_armor_get_s_run(arg0)
{
    if (!item_fits_category(arg0, "armor"))
        return s_pg1_run;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("armor"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .armor data");
    
    if (is_string(_struct.s_run))
        return variable_struct_get(global.Mods_Sprite_Armor_Data, _struct.s_run);
    else
        return _struct.s_run;
}
