function npc_dialogue_get_question_count(arg0)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return 0;
    
    var _speaker_index = speaker_get_index(arg0.npc_speaker_id);
    return array_length(arg0.question[_speaker_index]);
}
