function quest_build_rewards_text(arg0, arg1)
{
    var _quest_name = npc_dialogue_get_quest_id(arg0, arg1);
    var _text = language_get_string("Exp") + ": " + string(variable_struct_get(global.quest_database, _quest_name).experience);
    _text = _text + " / " + language_get_string("Rep") + ": " + string(variable_struct_get(global.quest_database, _quest_name).reputation) + " / ";
    _text = _text + language_get_string("Reward") + ": " + string(variable_struct_get(global.quest_database, _quest_name).money) + " " + language_get_string("Roubles");
    return _text;
}
