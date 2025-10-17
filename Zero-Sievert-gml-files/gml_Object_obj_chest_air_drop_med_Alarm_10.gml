if (player_nearest_distance(x, y) < 450)
{
    if (!already_looted && !items_deleted)
    {
        items_deleted = true;
        var _tempo_passato = current_time - current_time_spawned;
        var _quante_volte = _tempo_passato div time_to_delete_items;
        var _loot_array = db_read_ext("all loot", "chest_" + string(id), "items", []);
        
        repeat (_quante_volte)
        {
            var _i = 0;
            
            repeat (array_length(_loot_array))
            {
                if (scr_chance(18))
                    loot_clear(_loot_array[_i]);
                
                _i++;
            }
        }
        
        db_close();
    }
}

alarm[10] = 30;
