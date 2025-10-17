function scr_save_player_status()
{
    with (player_get_local())
    {
        db_open(inventory_target_db());
        db_write("player", "hp_max", hp_max);
        db_write("player", "hp", hp);
        db_write("player", "stamina_max", stamina_max);
        db_write("player", "wound", wound);
        db_write("player", "fatigue", fatigue);
        db_write("player", "energy", energy);
        db_write("player", "thirst", thirst);
        db_write("player", "radiation", radiation_accumulata);
        db_write("stats", "money", global.player_money);
        
        if (is_in_hub())
        {
            db_write("player", "x", x);
            db_write("player", "y", y);
        }
        
        db_close();
    }
}
