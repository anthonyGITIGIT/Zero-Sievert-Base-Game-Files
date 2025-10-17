function quest_check_state()
{
    for (var i = 0; i < 30; i++)
    {
        var _struct_save = global.quest_state[i];
        var _quest_id = _struct_save.id;
        
        if (_quest_id != "")
        {
            var _quest_is_complete = true;
            var _array_amount_now = _struct_save.amount_now;
            var _array_objective = variable_struct_get(global.quest_database, _quest_id).objective;
            
            for (var j = 0; j < array_length(variable_struct_get(global.quest_database, _quest_id).objective); j++)
            {
                if (_array_amount_now[j] >= _array_objective[j].amount_max)
                {
                    if (_struct_save.notifica_sub[j] == false)
                    {
                        _struct_save.notifica_sub[j] = true;
                        var _t = language_get_string("Sub-Task") + ": - " + language_get_string(variable_struct_get(global.quest_database, _quest_id).name) + " - " + language_get_string("completed");
                        scr_draw_text_with_box(_t, false);
                    }
                }
                else
                {
                    _quest_is_complete = false;
                    _struct_save.notifica_sub[j] = false;
                }
            }
            
            if (_quest_is_complete == true)
            {
                _struct_save.state = "completed";
                
                if (_struct_save.notifica == false)
                {
                    _struct_save.notifica = true;
                    var _t = language_get_string("Quest") + ": - " + language_get_string(variable_struct_get(global.quest_database, _quest_id).name) + " - " + language_get_string("completed!");
                    scr_draw_text_with_box(_t, false);
                }
            }
            else
            {
                _struct_save.state = "active";
            }
        }
    }
}
