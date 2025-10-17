function loot_array_remove_gambled_items(arg0)
{
    var _i = 0;
    
    repeat (array_length(arg0))
    {
        var _lose = false;
        
        switch (item_get_category(arg0[_i].item))
        {
            case "weapon":
            case "armor":
            case "headset":
            case "backpack":
                _lose = difficulty_get("hardcore_lose_equipment");
                break;
            
            case "medication":
                _lose = difficulty_get("hardcore_lose_medication");
                break;
            
            case "ammo":
                _lose = difficulty_get("hardcore_lose_ammo");
                break;
            
            case "consumable":
                _lose = difficulty_get("hardcore_lose_consumable");
                break;
            
            case "key":
                _lose = difficulty_get("hardcore_lose_keys");
                break;
            
            default:
                _lose = difficulty_get("hardcore_lose_other");
                break;
        }
        
        if (!item_get_can_be_sold(arg0[_i].item))
            _lose = false;
        
        if (_lose)
            array_delete(arg0, _i, 1);
        else
            _i++;
    }
}
