function npc_dialogue_get_quest_count(arg0)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return 0;
    
    if (!arg0.is_a_quest_giver[speaker_get_index(arg0.npc_speaker_id)])
        return 0;
    
    return array_length(arg0.quest_array);
}
