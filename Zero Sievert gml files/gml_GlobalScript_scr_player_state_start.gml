function scr_player_state_start()
{
    if (instance_exists(obj_map_generator))
    {
        var _map = obj_map_generator.area;
        
        if (obj_map_generator.area_player_train_spawn[_map] == true)
        {
            if (instance_exists(obj_train))
            {
                x = obj_train.x;
                y = obj_train.y;
            }
        }
        else if (instance_exists(obj_spawner_player_100))
        {
            x = obj_spawner_player_100.x;
            y = obj_spawner_player_100.y;
        }
    }
    
    visible = false;
}
