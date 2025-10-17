function npc_dialogue_get_answer(arg0, arg1)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return "";
    
    var _speaker_index = speaker_get_index(arg0.npc_speaker_id);
    var _answer_array = arg0.answer[_speaker_index];
    
    if (arg1 == undefined || arg1 < 0 || arg1 >= array_length(_answer_array))
        return "...";
    
    return language_get_string(_answer_array[arg1]);
}
