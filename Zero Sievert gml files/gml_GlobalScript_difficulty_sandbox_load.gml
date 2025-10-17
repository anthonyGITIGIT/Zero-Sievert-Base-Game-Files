function difficulty_sandbox_load()
{
    trace("Loading difficulty sandbox values");
    db_open("shared");
    var _names_array = variable_struct_get_names(global.__difficulty_data);
    var _i = 0;
    
    repeat (array_length(_names_array))
    {
        var _name = _names_array[_i];
        variable_struct_set(global.__difficulty_sandbox_values, _name, db_read("difficulty", _name, difficulty_get_default(_name)));
        _i++;
    }
    
    db_close();
}
