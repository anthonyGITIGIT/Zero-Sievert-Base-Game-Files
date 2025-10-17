function npc_dialogue_get_question(arg0, arg1)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return "";
    
    var _speaker_index = speaker_get_index(arg0.npc_speaker_id);
    var _question_array = arg0.question[_speaker_index];
    
    if (arg1 == undefined || arg1 < 0 || arg1 >= array_length(_question_array))
        return "";
    
    return language_get_string(_question_array[arg1]);
}
