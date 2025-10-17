function loot_generate_from_item(arg0, arg1, arg2, arg3)
{
    with (arg0)
    {
        var _loot = new class_loot(my_id, qnt, x + arg1, y + arg2, rotation, arg3);
        loot_set_from_chest(_loot, true, durability, created_from_player);
        
        if (item_fits_category(my_id, "weapon"))
            loot_add_weapon_data(_loot, ammo_now_id, ammo_adesso, my_fire_mode, mod_container);
        
        return _loot;
    }
}
