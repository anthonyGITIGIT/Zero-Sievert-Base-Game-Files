function quest_line_update(arg0 = false)
{
    var _restock = arg0;
    db_open(inventory_target_db());
    var _array_names = variable_struct_get_names(global.quest_database);
    
    for (var i = 0; i < array_length(_array_names); i++)
    {
        var _quest_struct = variable_struct_get(global.quest_database, array_get(_array_names, i));
        var _id = _quest_struct.id;
        
        if (quest_is_complete(_id))
        {
            var _array_next_quest = _quest_struct.quest_next;
            
            for (var j = 0; j < array_length(_array_next_quest); j++)
            {
                var _id_next = _array_next_quest[j].id;
                var _npc_id = _array_next_quest[j].npc_id;
                var _npc_speaker_id = npc_get_speaker_id(_npc_id, true);
                
                if ((!quest_is_complete(_id_next) && !quest_is_active(_id_next)) || (_quest_struct.daily == true && _restock == true))
                {
                    var _npc_name = _npc_id + "_quest";
                    var _quest_max_npc = obj_controller.speaker_quest_max[speaker_get_index(_npc_speaker_id)];
                    var _def_array = array_create(_quest_max_npc);
                    
                    for (var k = 0; k < array_length(_def_array); k++)
                        _def_array[k] = "";
                    
                    var _array_quest_npc = db_read("NPC", _npc_name, _def_array);
                    var _npc_has_quest = false;
                    
                    for (var k = 0; k < array_length(_array_quest_npc); k++)
                    {
                        if (_array_quest_npc[k] == _id_next)
                            _npc_has_quest = true;
                    }
                    
                    if (_npc_has_quest == false)
                    {
                        var _added = false;
                        
                        for (var k = 0; k < _quest_max_npc; k++)
                        {
                            if (_added == false)
                            {
                                if (_array_quest_npc[k] == "")
                                {
                                    _added = true;
                                    _array_quest_npc[k] = _id_next;
                                }
                            }
                        }
                        
                        db_write("NPC", _npc_name, _array_quest_npc);
                    }
                }
            }
        }
    }
    
    db_close();
}
