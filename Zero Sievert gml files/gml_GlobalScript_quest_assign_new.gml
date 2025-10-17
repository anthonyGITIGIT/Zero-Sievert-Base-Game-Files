function quest_assign_new(arg0, arg1)
{
    var _name = arg0 + "_quest";
    var _assigned = false;
    var _quest_max_npc = obj_controller.speaker_quest_max[speaker_get_index(npc_get_speaker_id(arg0, true))];
    var _def_array = array_create(_quest_max_npc);
    
    for (var k = 0; k < array_length(_def_array); k++)
        _def_array[k] = "";
    
    db_open(inventory_target_db());
    var _quest_array = db_read("NPC", _name, _def_array);
    
    for (var i = 0; i < array_length(_quest_array); i++)
    {
        if (_assigned == false)
        {
            if (_quest_array[i] == "")
            {
                _quest_array[i] = arg1;
                _assigned = true;
            }
        }
    }
    
    db_write("NPC", _name, _quest_array);
    db_close();
}
