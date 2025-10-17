function end_game_save_choice()
{
    db_open("general");
    db_write("end_game_choice", "choice", global.end_game_choice);
    db_close();
}
