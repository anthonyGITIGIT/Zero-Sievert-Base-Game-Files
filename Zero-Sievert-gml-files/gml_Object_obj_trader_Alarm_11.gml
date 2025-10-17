if (is_trader)
{
    db_open("general");
    var _load = db_section_exists(trader_id);
    db_close();
    
    if (trader_id == "random_trader")
    {
        gamedata_trader_calculate_shared_money();
        _load = false;
    }
    
    if (_load)
    {
        db_open("general");
        loot_array = db_read(trader_id, "items", []);
        db_close();
    }
    else
    {
        db_open("general");
        loot_array = trader_unpack_to_loot_array(trader_id, true, false);
        db_write(trader_id, "items", loot_array);
        db_close();
    }
}

sprite_index = speaker_sprite_idle[speaker_get_index(speaker_id)];
depth = -y - (sprite_get_height(sprite_index) / 2);
