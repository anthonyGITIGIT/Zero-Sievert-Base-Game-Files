function player_damage(arg0, arg1 = 0)
{
    var _player = player_get(arg1);
    
    if (instance_exists(_player))
    {
        _player.hp -= arg0;
        
        if (_player.hp <= 0)
        {
            _player.hp = -100;
            
            if (skill_hunter_obtained("immortal"))
            {
                if (!_player.immortal_used)
                {
                    _player.hp = struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("immortal")), variable_get_hash("health_given"));
                    _player.immortal_used = true;
                }
            }
            
            if (instance_exists(obj_map_generator) && obj_map_generator.area == UnknownEnum.Value_10)
                _player.hp = 10;
        }
    }
    
    rumble(UnknownEnum.Value_0);
}

enum UnknownEnum
{
    Value_0,
    Value_10 = 10
}
