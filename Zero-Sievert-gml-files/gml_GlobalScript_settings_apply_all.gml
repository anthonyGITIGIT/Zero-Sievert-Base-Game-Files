function settings_apply_all()
{
    var _names_array = variable_struct_get_names(global.__settings_data);
    var _i = 0;
    
    repeat (array_length(_names_array))
    {
        settings_apply(_names_array[_i]);
        _i++;
    }
}
