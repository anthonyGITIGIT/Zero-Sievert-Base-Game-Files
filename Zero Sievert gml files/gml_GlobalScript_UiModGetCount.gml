function UiModGetCount()
{
    return array_length(variable_struct_get_names(global.Mods_Data));
}
