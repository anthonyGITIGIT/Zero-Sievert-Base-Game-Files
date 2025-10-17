function class_loot(arg0 = "no_item", arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = undefined, arg6 = 100) constructor
{
    item = arg0;
    quantity = arg1;
    x = arg2;
    y = arg3;
    rotation = arg4;
    durability = arg6;
    placement = arg5;
    
    if (item_get_category(arg0) == "weapon")
        loot_add_weapon_data(self);
}
