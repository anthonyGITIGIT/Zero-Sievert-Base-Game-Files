function saveslot_new()
{
    scr_aggiorna_save_slot(global.slot_selected);
    db_load("shared");
    scr_clear_save_slot();
    inventory_set_target_db_to_pre_raid();
    difficulty_set_sandbox(false);
    difficulty_sandbox_save();
    db_open(inventory_target_db());
    db_write("loadout", "id", uiGetData().loadout);
    db_close();
    var _prologue = uiGetData().play_prologue;
    
    if (_prologue)
    {
    }
    else
    {
        player_init_new_game_items();
    }
    
    player_init_new_game_skills();
    player_init_new_game_base();
    scr_save_skill_and_base();
    db_force_save("shared");
    mods_save_enabled_mods();
    __uiGlobal().__defaultOnion.Clear();
    db_open("general");
    db_write("prologue", "play", _prologue);
    db_close();
    room_goto(r_hub);
}
