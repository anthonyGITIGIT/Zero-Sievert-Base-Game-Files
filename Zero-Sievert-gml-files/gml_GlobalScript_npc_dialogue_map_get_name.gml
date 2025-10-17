function npc_dialogue_map_get_name(arg0)
{
    if (!instance_exists(obj_controller))
        return "???";
    
    return obj_controller.map_nome[arg0];
}
