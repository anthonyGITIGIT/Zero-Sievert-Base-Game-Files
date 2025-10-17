function quest_is_complete(arg0)
{
    if (arg0 == undefined)
        return false;
    
    if (variable_struct_get(global.quest_line_progress, arg0) == true)
        return true;
    else
        return false;
}
