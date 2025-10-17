function player_handle_scope_aiming()
{
    aiming = false;
    
    with (obj_mouse)
        visible = true;
    
    var _scope = player_loadout_get_mod(self, weapon_slot_now, "scope");
    
    if (item_mod_get_scope_optic(_scope) && item_exists(arma_now))
    {
        aiming = mouse_check_button(mb_right) || obj_gamepad.action[UnknownEnum.Value_28].value;
        
        with (obj_mouse)
            visible = !other.aiming;
    }
    
    if (aiming && reloading && !skill_active("reload_artist_scopes"))
    {
        aiming = false;
        
        with (obj_mouse)
            visible = true;
    }
}

enum UnknownEnum
{
    Value_28 = 28
}
