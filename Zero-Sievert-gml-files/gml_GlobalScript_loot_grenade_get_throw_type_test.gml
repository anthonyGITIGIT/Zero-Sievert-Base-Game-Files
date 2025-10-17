function loot_grenade_get_throw_type_test(arg0)
{
    switch (item_grenade_get_throw_type(arg0.item))
    {
        case "GRENADE_throw_bounce":
            return "no";
            break;
        
        case "GRENADE_throw_no_bounce":
            return "yes";
            break;
        
        case "GRENADE_throw_no_move":
            return "land mine";
            break;
    }
}
