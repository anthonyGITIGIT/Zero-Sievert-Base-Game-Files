function item_set_tracking_materials(arg0, arg1)
{
    var _tracking_dict = db_read_ext("general", "tracking", "items", {});
    var _old_state = variable_struct_get(_tracking_dict, arg0) ?? false;
    
    if (arg1 == _old_state)
        exit;
    
    if (arg1)
        variable_struct_set(_tracking_dict, arg0, true);
    else
        variable_struct_remove(_tracking_dict, arg0);
    
    db_open("general");
    db_write("tracking", "items", _tracking_dict);
    db_close();
    
    if (is_in_hub())
        db_force_save_soft("general");
    
    item_tracking_reset();
}
