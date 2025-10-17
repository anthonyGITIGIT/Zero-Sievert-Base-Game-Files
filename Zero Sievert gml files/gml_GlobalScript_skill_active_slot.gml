function skill_active_slot(arg0, arg1)
{
    with (player_get_local())
    {
        if (skills.get_value(arg0) > 0)
        {
            var _usage_array = skills.get_meta_skill_mastery(arg0);
            var _usage_count = array_length(_usage_array);
            
            for (var i = 0; i < _usage_count; i++)
            {
                var _this_usage = _usage_array[i];
                
                if (_this_usage.gun_type == item_weapon_get_type(player_loadout_get_item(self, arg1)))
                    return true;
            }
        }
        
        return false;
    }
    
    return false;
}
