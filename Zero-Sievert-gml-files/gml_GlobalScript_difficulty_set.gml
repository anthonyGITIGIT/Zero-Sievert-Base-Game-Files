function difficulty_set(arg0, arg1)
{
    var _difficulty_def = variable_struct_get(global.__difficulty_data, arg0);
    
    if (!is_struct(_difficulty_def))
        trace_error("Difficulty \"", arg0, "\" not recognised");
    
    with (_difficulty_def)
    {
        if (global.__difficulty_sandbox)
        {
            if (arg1 != variable_struct_get(global.__difficulty_sandbox_values, arg0))
            {
                uiGetData().difficulty_name = "custom";
                variable_struct_set(global.__difficulty_sandbox_values, arg0, arg1);
            }
        }
        else if (arg1 != db_read_ext("shared", "difficulty", arg0, __default))
        {
            uiGetData().difficulty_name = "custom";
            db_open("shared");
            db_write("difficulty", __name, arg1);
            db_close();
        }
    }
}
