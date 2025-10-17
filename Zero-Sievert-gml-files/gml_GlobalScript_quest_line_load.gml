function quest_line_load()
{
    db_open("general");
    global.quest_line_progress = db_read("quest line", "completed", {});
    db_close(true);
}
