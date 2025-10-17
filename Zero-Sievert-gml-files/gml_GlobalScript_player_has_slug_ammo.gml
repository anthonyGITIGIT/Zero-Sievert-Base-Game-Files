function player_has_slug_ammo()
{
    with (player_get_local())
    {
        var _ammo_name = item_weapon_get_caliber(arma_now);
        var _ammo_number = item_ammo_get_number(player_loadout_get_ammo_item(self, weapon_slot_now));
        return _ammo_name == "a12x70" && _ammo_number == 1;
    }
}
