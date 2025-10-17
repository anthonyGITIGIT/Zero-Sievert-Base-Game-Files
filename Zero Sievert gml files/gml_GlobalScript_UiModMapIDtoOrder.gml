function UiModMapIDtoOrder(arg0)
{
    var _count_of_on_mods = array_length(global.Mods_Order);
    
    if (arg0 <= (_count_of_on_mods - 1))
        return modding_utility_string_to_num(global.Mods_Order[arg0]);
    else
        return modding_utility_string_to_num(global.Mods_Off[arg0 - _count_of_on_mods]);
}
