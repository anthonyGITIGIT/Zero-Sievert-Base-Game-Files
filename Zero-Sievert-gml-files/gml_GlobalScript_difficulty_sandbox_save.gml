function difficulty_sandbox_save()
{
    trace("Saving difficulty sandbox values");
    db_open("shared");
    var _names_array = variable_struct_get_names(global.__difficulty_data);
    var _i = 0;
    
    repeat (array_length(_names_array))
    {
        var _name = _names_array[_i];
        db_write("difficulty", _name, variable_struct_get(global.__difficulty_sandbox_values, _name));
        _i++;
    }
    
    db_close();
}
