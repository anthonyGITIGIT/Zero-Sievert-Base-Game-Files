function __quest_log_get_quest_data(arg0)
{
    var _id = quest_log_get_id(arg0);
    
    if (_id == undefined)
        return undefined;
    
    return variable_struct_get(global.quest_database, _id);
}
