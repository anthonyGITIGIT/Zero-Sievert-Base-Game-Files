function scr_check_quest_from_file(arg0)
{
    var _quest_to_check = arg0;
    var _found = false;
    db_open("general");
    
    for (var j = 0; j < 30; j++)
    {
        var quest_id_ = db_read("Quest", string(j) + "_id", -1);
        
        if (quest_id_ == _quest_to_check)
        {
            var _status = db_read("Quest", string(j) + "_status", 0);
            
            if (_status == 1)
                _found = true;
        }
    }
    
    db_close();
    return _found;
}
