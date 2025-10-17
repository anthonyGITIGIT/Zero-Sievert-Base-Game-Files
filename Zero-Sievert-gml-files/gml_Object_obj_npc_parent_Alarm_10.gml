alert_player_max = alert_player_max_value * global.sk_k[UnknownEnum.Value_11];
timer_visible_max = 30 * global.sk_k[UnknownEnum.Value_14];

if (is_a_quest_giver[speaker_get_index(npc_speaker_id)])
{
    var name_ = npc_id + "_quest";
    quest_max = speaker_quest_max[speaker_get_index(npc_speaker_id)];
    db_open(inventory_target_db());
    
    if (db_key_exists("NPC", name_))
    {
        var _def_array = array_create(quest_max);
        
        for (var i = 0; i < array_length(_def_array); i++)
            _def_array[i] = "";
        
        var _array_quest_saved = db_read("NPC", name_, _def_array);
        
        for (var i = 0; i < array_length(_def_array); i++)
        {
            if (array_length(_array_quest_saved) > i)
                quest_array[i] = _array_quest_saved[i];
        }
        
        if (npc_id == "daily_quest_giver")
        {
            var _daily_array = _def_array;
            
            for (var i = 0; i < array_length(_def_array); i++)
            {
                for (var j = 0; j < 8; j++)
                {
                    if (quest_array[i] == ("daily_quest_" + string(j)))
                        _daily_array[j] = quest_array[i];
                }
            }
            
            for (var i = 0; i < array_length(_def_array); i++)
                quest_array[i] = _daily_array[i];
        }
    }
    
    if (!db_key_exists("NPC", name_))
    {
        for (var i = 0; i < quest_max; i++)
            quest_array[i] = "";
        
        var n_quest_trader = array_length(speaker_quest[speaker_get_index(npc_speaker_id)]);
        
        for (var i = 0; i < n_quest_trader; i++)
            quest_array[i] = speaker_quest[speaker_get_index(npc_speaker_id)][i];
        
        db_write("NPC", name_, quest_array);
    }
    
    db_close();
}
else
{
    quest_array[0] = -1;
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_14 = 14
}
