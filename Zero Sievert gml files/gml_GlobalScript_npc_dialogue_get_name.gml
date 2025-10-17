function npc_dialogue_get_name(arg0)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return "";
    
    return language_get_string(arg0.npc_name);
}
