function npc_get_general(arg0, arg1, arg2)
{
    if (arg1 == "{use_preset}")
    {
        if (npc_get_preset(arg0) == "no_preset")
            trace_error("NPC \"", arg0, "\" has {use_preset} on ", arg2, "but has no_preset as preset");
        
        arg1 = preset_get_value(npc_get_preset(arg0), arg2);
    }
    else
    {
        arg1 = preset_general_get_value(arg2, arg1);
    }
    
    return arg1;
}
