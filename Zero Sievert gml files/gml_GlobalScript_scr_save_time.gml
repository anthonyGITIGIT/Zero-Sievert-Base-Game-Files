function scr_save_time()
{
    db_open("general");
    db_write("Game time played", "seconds", obj_light_controller.game_time_played);
    db_write("Real time played", "seconds", obj_light_controller.real_time_played);
    db_close();
}
