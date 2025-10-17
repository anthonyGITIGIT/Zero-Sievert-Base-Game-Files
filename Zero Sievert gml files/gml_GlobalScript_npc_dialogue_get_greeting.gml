function npc_dialogue_get_greeting(arg0)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return "";
    
    return language_get_string(arg0.text_hello[speaker_get_index(arg0.npc_speaker_id)]);
}
