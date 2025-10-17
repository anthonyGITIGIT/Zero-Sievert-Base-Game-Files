function difficulty_get(arg0)
{
    var _difficulty_def = variable_struct_get(global.__difficulty_data, arg0);
    
    if (!is_struct(_difficulty_def))
        trace_error("Difficulty \"", arg0, "\" not recognised");
    
    with (_difficulty_def)
    {
        if (global.__difficulty_sandbox)
            return variable_struct_get(global.__difficulty_sandbox_values, arg0) ?? __default;
        else
            return db_read_ext("shared", "difficulty", __name, __default);
    }
}
