function hotfix_remove_completed_quests()
{
    db_open("general");
    var _current_quest_dict = SnapDeepCopy(db_section_read("quest"));
    db_close();
    var _current_quest_array = variable_struct_get_names(_current_quest_dict);
    var _i = 0;
    
    repeat (array_length(_current_quest_array))
    {
        var _key = _current_quest_array[_i];
        var _quest_struct = variable_struct_get(_current_quest_dict, _key);
        var _quest_id = struct_get_from_hash(_quest_struct, variable_get_hash("id"));
        var _is_daily_quest = is_string(_quest_id) && string_copy(_quest_id, 1, 12) == "daily_quest_";
        
        if (!_is_daily_quest && quest_is_complete(_quest_id))
        {
            trace("Hotfix: Found active yet completed quest \"", _quest_id, "\", removing from active list");
            variable_struct_set(_current_quest_dict, _key, new class_quest_state());
        }
        else
        {
            _i++;
        }
    }
    
    db_open("general");
    db_section_write("quest", _current_quest_dict);
    db_close();
}
