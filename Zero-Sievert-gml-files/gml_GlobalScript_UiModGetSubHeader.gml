function UiModGetSubHeader(arg0)
{
    var _all_name = variable_struct_get_names(global.Mods_Data);
    var _this_mod = _all_name[arg0];
    
    if (variable_struct_get(global.Mods_Data, _this_mod).failed_to_compile)
    {
        if (struct_exists(variable_struct_get(global.Mods_Data, _this_mod).compile_error, "message"))
        {
            var _message = variable_struct_get(global.Mods_Data, _this_mod).compile_error.message;
            _message = string_replace(_message, "\n", "");
            _message = string_replace(_message, "\n", "");
            _message = string_replace(_message, "Code failure in: ", "Error:");
            _message = string_copy(_message, 0, 58);
            return _message;
        }
        else
        {
            return "error";
        }
    }
    else
    {
        return UiModGetSingleCreatorName(arg0);
    }
}
