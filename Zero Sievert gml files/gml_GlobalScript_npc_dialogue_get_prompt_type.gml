function npc_dialogue_get_prompt_type(arg0, arg1)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return "";
    
    var _speaker_index = speaker_get_index(arg0.npc_speaker_id);
    var _type_array = arg0.dia_type[_speaker_index];
    
    if (arg1 == undefined || arg1 < 0 || arg1 >= array_length(_type_array))
        return "";
    
    return _type_array[arg1];
}
