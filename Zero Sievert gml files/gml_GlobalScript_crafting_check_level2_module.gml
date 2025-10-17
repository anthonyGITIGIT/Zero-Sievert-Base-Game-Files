function crafting_check_level2_module(arg0)
{
    var _item = arg0.item;
    
    if (!item_fits_category(_item, "upgrade_base_kit"))
        exit;
    
    var _module_id = base_name_to_component(item_base_upgrade_get_id(_item));
    var _module_to_install_lvl = item_base_upgrade_get_lvl_req(_item);
    
    if (base_module_get_installed(_module_id))
    {
        var _base_module_lvl_now = base_module_get_level(_module_id);
        
        if (_base_module_lvl_now == _module_to_install_lvl)
            return false;
    }
    else if (_module_to_install_lvl == 0)
    {
        return false;
    }
    
    return true;
}
