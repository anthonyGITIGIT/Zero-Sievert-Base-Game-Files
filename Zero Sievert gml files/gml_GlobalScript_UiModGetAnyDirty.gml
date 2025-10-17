function UiModGetAnyDirty()
{
    return variable_global_exists("Mods_Is_Dirty") ? global.Mods_Is_Dirty : 0;
}
