function loot_action_unload_now(arg0, arg1 = false)
{
    var _ammo_item = struct_get_from_hash(arg0, variable_get_hash("ammo_id"));
    var _ammo_quantity = struct_get_from_hash(arg0, variable_get_hash("ammo_quantity")) ?? 0;
    
    if (player_state_is(player_get_local(), scr_player_state_inventory))
        inventory_write_to_db();
    
    if (_ammo_item == undefined)
    {
        trace("Warning! Trying to unload an item (", arg0.item, ") not marked as a weapon");
        return true;
    }
    
    if (_ammo_quantity <= 0)
    {
        if (!arg1)
            scr_draw_text_with_box("This weapon has no ammo");
        
        return true;
    }
    
    if (!inventory_check_for_space(_ammo_item, _ammo_quantity))
    {
        scr_draw_text_with_box("Not enough inventory space to unload this weapon");
        return false;
    }
    
    arg0.ammo_quantity = 0;
    inventory_add_item(_ammo_item, _ammo_quantity);
    return true;
}
