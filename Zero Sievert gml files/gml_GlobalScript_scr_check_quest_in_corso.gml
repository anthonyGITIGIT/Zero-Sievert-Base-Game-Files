function scr_check_quest_in_corso(arg0)
{
    var _id_to_check = arg0;
    var _ret = UnknownEnum.Value_0;
    var o = obj_controller;
    
    for (var i = 0; i < 30; i++)
    {
        var _quest_id = global.quest_state[i].id;
        
        if (_quest_id != "")
        {
            if (_quest_id == _id_to_check)
            {
                if (global.quest_state[i].state == "active")
                    _ret = UnknownEnum.Value_1;
                
                if (global.quest_state[i].state == "completed")
                    _ret = UnknownEnum.Value_2;
                
                var _quanti_obj = array_length(variable_struct_get(global.quest_database, _quest_id).objective);
                var _obj_fatti = 0;
                
                for (var k = 0; k < _quanti_obj; k++)
                {
                    if (global.quest_state[i].amount_now[k] >= variable_struct_get(global.quest_database, _quest_id).objective[k].amount_max)
                        _obj_fatti += 1;
                }
                
                if (_obj_fatti == _quanti_obj)
                    _ret = UnknownEnum.Value_2;
            }
        }
    }
    
    return _ret;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
