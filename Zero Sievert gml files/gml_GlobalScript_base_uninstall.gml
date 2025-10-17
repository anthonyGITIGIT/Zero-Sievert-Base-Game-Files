function base_uninstall(arg0)
{
    if (!is_in_hub())
        exit;
    
    if (!base_get_occupied(arg0))
    {
        scr_draw_text_with_box("You can only uninstall modules in the bunker");
        return false;
    }
    
    var _module = base_get_module(arg0);
    
    if (_module == UnknownEnum.Value_2)
    {
        scr_draw_text_with_box("Storage module cannot be uninstalled");
        return false;
    }
    
    global.base_lvl[_module] = 0;
    global.sl_free[arg0] = 0;
    global.sl_base_id[arg0] = -1;
    obj_base_parent.alarm[0] = 1;
    return true;
}

enum UnknownEnum
{
    Value_2 = 2
}
