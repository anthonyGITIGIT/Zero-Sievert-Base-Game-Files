function modding_utility_string_to_num(arg0)
{
    var _all_names = variable_struct_get_names(global.Mods_Data);
    var _count_of_mods = array_length(_all_names);
    
    for (var i = 0; i < _count_of_mods; i++)
    {
        if (_all_names[i] == arg0)
            return i;
    }
    
    show_error("Error: inside modding_utility_string_to_num() we were given a string we couldnt match to a mod that was on. String: " + string(arg0), false);
    return 0;
}
