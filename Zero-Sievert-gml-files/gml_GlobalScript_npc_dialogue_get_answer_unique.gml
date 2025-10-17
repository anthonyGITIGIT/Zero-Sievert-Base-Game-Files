function npc_dialogue_get_answer_unique(arg0, arg1)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return "";
    
    var _speaker_index = speaker_get_index(arg0.npc_speaker_id);
    var _answer_array_type = arg0.dia_type[_speaker_index];
    var _answer_array = arg0.dia_type_answer[_speaker_index];
    
    for (var i = 0; i < array_length(_answer_array_type); i++)
    {
        if (arg1 == _answer_array_type[i])
            return _answer_array[i];
    }
    
    return "...";
}
