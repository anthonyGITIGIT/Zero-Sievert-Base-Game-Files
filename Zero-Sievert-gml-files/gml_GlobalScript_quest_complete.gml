function quest_complete(arg0)
{
    variable_struct_set(global.quest_line_progress, arg0, true);
    stat_increment("tot_quests_completed");
    steam_stat_increment("questscompleted");
    eyeforaneye_achievement();
    lastorders_achievement();
    downwiththesickness_achievement();
}
