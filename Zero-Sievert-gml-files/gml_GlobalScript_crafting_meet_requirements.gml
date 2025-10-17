function crafting_meet_requirements(arg0, arg1, arg2)
{
    if (arg0 == undefined)
        exit;
    
    var _req_skill_id = struct_get_from_hash(arg0, variable_get_hash("crafting_skill_id")) ?? 0;
    var _req_skill_level = struct_get_from_hash(arg0, variable_get_hash("crafting_skill_level")) ?? -1;
    var _req_module_id = struct_get_from_hash(arg0, variable_get_hash("crafting_module_id")) ?? -1;
    var _req_module_level = struct_get_from_hash(arg0, variable_get_hash("crafting_module_level")) ?? -1;
    var _item_array = struct_get_from_hash(arg0, variable_get_hash("crafting_items_array"));
    var _quantity_array = struct_get_from_hash(arg0, variable_get_hash("crafting_item_quantity_array"));
    
    if (global.general_debug)
        return true;
    
    if (!is_array(_item_array))
    {
        if (arg1)
            return true;
        
        trace_error("Loot doesn't have an array of required items");
        return false;
    }
    
    if (!is_array(_quantity_array))
    {
        if (arg1)
            return true;
        
        trace_error("Loot doesn't have an array of required items quantities");
        return false;
    }
    
    if (_req_module_id != -1)
    {
        if (!base_module_get_installed(_req_module_id) || base_module_get_level(_req_module_id) < _req_module_level)
        {
            if (arg2)
                scr_draw_text_with_box("You don't have the required base module");
            
            return false;
        }
    }
    
    var _i = 0;
    
    repeat (array_length(_item_array))
    {
        var _item = _item_array[_i];
        var _quantity = _quantity_array[_i];
        
        if (is_string(_item) && _quantity > 0)
        {
            if (inventory_and_stash_get_total_of_item(_item) < _quantity)
            {
                if (arg2)
                    scr_draw_text_with_box("You don't have enough raw materials");
                
                return false;
            }
        }
        
        _i++;
    }
    
    return true;
}

function crafting_meet_requirements_only_modules(arg0, arg1)
{
    if (arg0 == undefined)
        exit;
    
    var _req_skill_id = struct_get_from_hash(arg0, variable_get_hash("crafting_skill_id")) ?? 0;
    var _req_skill_level = struct_get_from_hash(arg0, variable_get_hash("crafting_skill_level")) ?? -1;
    var _req_module_id = struct_get_from_hash(arg0, variable_get_hash("crafting_module_id")) ?? -1;
    var _req_module_level = struct_get_from_hash(arg0, variable_get_hash("crafting_module_level")) ?? -1;
    var _item_array = struct_get_from_hash(arg0, variable_get_hash("crafting_items_array"));
    var _quantity_array = struct_get_from_hash(arg0, variable_get_hash("crafting_item_quantity_array"));
    
    if (global.general_debug)
        return true;
    
    if (!is_array(_item_array))
    {
        if (arg1)
            return true;
        
        trace_error("Loot doesn't have an array of required items");
        return false;
    }
    
    if (!is_array(_quantity_array))
    {
        if (arg1)
            return true;
        
        trace_error("Loot doesn't have an array of required items quantities");
        return false;
    }
    
    if (_req_module_id != -1)
    {
        if (!base_module_get_installed(_req_module_id) || base_module_get_level(_req_module_id) < _req_module_level)
            return false;
    }
    
    return true;
}
