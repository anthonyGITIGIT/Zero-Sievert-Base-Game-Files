function scr_load_end_game_choice()
{
    db_open("general");
    global.end_game_choice = db_read("end_game_choice", "choice", -1);
    db_close();
}
