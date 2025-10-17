function loot_get_sprite_height(arg0, arg1 = undefined)
{
    if (!is_struct(arg0))
        return 0;
    
    with (arg0)
    {
        if (!item_exists(item))
            return 0;
        
        if ((arg1 ?? arg0.rotation) == 90)
            return sprite_get_width(item_get_sprite_inv(item));
        else
            return sprite_get_height(item_get_sprite_inv(item));
    }
}
