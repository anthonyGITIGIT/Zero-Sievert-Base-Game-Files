function inventory_set_weapon_ammo(arg0, arg1, arg2)
{
    var _loot = inventory_find_loot(arg0);
    
    if (_loot != undefined)
    {
        with (_loot)
        {
            ammo_id = arg2;
            ammo_quantity = arg1;
        }
    }
}
