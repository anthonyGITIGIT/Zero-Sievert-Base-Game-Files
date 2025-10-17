function quest_save()
{
    db_open("general");
    
    for (var i = 0; i < 30; i++)
        db_write("quest", i, SnapDeepCopy(global.quest_state[i]));
    
    db_write("daily quests", "generated", SnapDeepCopy(global.save_daily_quest));
    db_write("quest line", "completed", SnapDeepCopy(global.quest_line_progress));
    db_close();
    trace("Quests saved");
}
