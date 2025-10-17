function crafting_check_already_installed_module(arg0)
{
    var _item = arg0.item;
    
    if (item_get_category(_item) == "upgrade_base_kit")
    {
        var _module_id = base_name_to_component(item_base_upgrade_get_id(_item));
        var _module_to_install_lvl = item_base_upgrade_get_lvl_req(_item);
        
        if (base_module_get_installed(_module_id))
        {
            var _base_module_lvl_now = base_module_get_level(_module_id);
            
            if (_base_module_lvl_now > _module_to_install_lvl)
                return true;
        }
    }
    
    return false;
}
