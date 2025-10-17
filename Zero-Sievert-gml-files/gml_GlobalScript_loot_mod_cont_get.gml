function loot_mod_cont_get(arg0, arg1)
{
    if (!is_struct(arg0))
        return "no_item";
    
    if (arg1 == undefined)
        return "no_item";
    
    var _item = variable_struct_get(arg0, arg1);
    
    if (_item == undefined)
        trace_error("Error reading mod pos \"", arg1, "\" from mod container ", arg0);
    
    return _item;
}
