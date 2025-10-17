if (is_a_quest_giver[speaker_get_index(speaker_id)])
{
    start_sorting_quest = true;
    quest_max = speaker_quest_max[speaker_get_index(speaker_id)];
    var list_quest = ds_list_create();
    db_open("general");
    var o = obj_controller;
    var quest_amount = o.slot_quest_max;
    var quest_slot = 0;
    
    for (var j = 0; j < quest_amount; j++)
    {
        var quest_id_ = db_read("Quest", "y_" + string(j) + "_x_" + "0", -1);
        var quest_giver_id = db_read("Quest", "y_" + string(j) + "_x_" + "10", -1);
        
        if (quest_id_ != -1)
        {
            if (quest_giver_id == speaker_id)
            {
                ds_list_add(list_quest, quest_id_);
                quest_slot++;
            }
        }
    }
    
    db_close();
    db_open("general");
    var name_ = speaker_name[speaker_get_index(speaker_id)];
    
    if (!db_section_exists(name_))
    {
        for (var i = 0; i < quest_max; i++)
            quest_array[i] = UnknownEnum.Value_0;
        
        var list_quest_possibili = ds_list_create();
        var n_quest_trader = array_length_2d(speaker_quest, speaker_get_index(speaker_id));
        
        for (var i = 0; i < n_quest_trader; i++)
        {
            var get_quest_id = speaker_quest[speaker_get_index(speaker_id)][i];
            
            if (faction_get_rep("Player", variable_struct_get(global.quest_database, get_quest_id).faction) >= variable_struct_get(global.quest_database, get_quest_id).rep_min)
            {
                repeat (speaker_quest_chance[speaker_get_index(speaker_id)][i])
                    ds_list_add(list_quest_possibili, speaker_quest[speaker_get_index(speaker_id)][i]);
            }
        }
        
        repeat (1000)
        {
            ds_list_shuffle(list_quest_possibili);
            var quest_da_aggiungere = ds_list_find_value(list_quest_possibili, 0);
            var aggiungere = true;
            
            for (var k = 0; k < quest_slot; k++)
            {
                if (ds_list_find_value(list_quest, k) == quest_da_aggiungere)
                    aggiungere = false;
            }
            
            if (global.quest_unique_done[quest_da_aggiungere] == true)
                aggiungere = false;
            
            if (aggiungere == true)
            {
                ds_list_add(list_quest, quest_da_aggiungere);
                quest_slot++;
            }
        }
        
        for (var i = 0; i < quest_slot; i++)
            quest_array[i] = ds_list_find_value(list_quest, i);
        
        for (var i = 0; i < quest_slot; i++)
            db_write(name_, "quest_" + string(i), quest_array[i]);
    }
    else
    {
        var k = -1;
        var temp_list;
        
        for (var i = 0; i < quest_max; i++)
        {
            var pp = db_read(name_, "quest_" + string(i), 0);
            
            if (pp != UnknownEnum.Value_0)
            {
                k++;
                temp_list[k] = pp;
            }
        }
        
        for (var i = 0; i < array_length_1d(temp_list); i++)
            quest_array[i] = temp_list[i];
    }
    
    db_close();
}
else
{
    quest_array[0] = -1;
}

enum UnknownEnum
{
    Value_0
}
