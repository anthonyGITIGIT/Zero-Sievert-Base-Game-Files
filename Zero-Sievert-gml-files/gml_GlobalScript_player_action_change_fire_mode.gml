function player_action_change_fire_mode()
{
    var _t_ammo = language_get_string(item_get_name(player_loadout_get_ammo_item(self, weapon_slot_now)));
    
    if (item_weapon_get_fire_mode(arma_now) == "automatic")
    {
        if (player_loadout_get_fire_mode(self, weapon_slot_now) == "automatic")
        {
            var _t = language_get_string("Fire mode: semi-automatic") + " (" + _t_ammo + ")";
            player_loadout_set_fire_mode(weapon_slot_now, "semi_automatic");
            scr_draw_text_with_box(_t, false);
        }
        else
        {
            var _t = language_get_string("Fire mode: automatic") + " (" + _t_ammo + ")";
            player_loadout_set_fire_mode(weapon_slot_now, "automatic");
            scr_draw_text_with_box(_t, false);
        }
    }
    else
    {
        scr_draw_text_with_box(_t_ammo, false);
    }
    
    return true;
}
