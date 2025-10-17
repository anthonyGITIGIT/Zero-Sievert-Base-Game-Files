function modding_utility_changeOrderUp(arg0)
{
    show_debug_message(arg0);
    show_debug_message(global.Mods_Order);
    
    if (!is_array(global.Mods_Order))
        exit;
    
    if (arg0 < 1 || arg0 >= array_length(global.Mods_Order))
        exit;
    
    var _temp = global.Mods_Order[arg0];
    global.Mods_Order[arg0] = global.Mods_Order[arg0 - 1];
    global.Mods_Order[arg0 - 1] = _temp;
    show_debug_message(global.Mods_Order);
    modding_utility_updateMetadata();
}
