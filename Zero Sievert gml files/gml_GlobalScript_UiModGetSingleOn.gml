function UiModGetSingleOn(arg0)
{
    var _mod_name = modding_utility_num_to_string(arg0);
    return array_contains(global.Mods_Order, _mod_name);
}
