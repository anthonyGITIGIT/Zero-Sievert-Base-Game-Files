function npc_dialogue_get_repair(arg0)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return "";
    
    var _text = arg0.text_repair[speaker_get_index(arg0.npc_speaker_id)];
    return language_get_string(arg0.text_repair[speaker_get_index(arg0.npc_speaker_id)]);
}
