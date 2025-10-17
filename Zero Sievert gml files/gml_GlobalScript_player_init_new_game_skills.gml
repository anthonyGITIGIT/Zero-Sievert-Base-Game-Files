function player_init_new_game_skills()
{
    db_open(inventory_target_db());
    var t_id = db_read("loadout", "id", "equipment_1");
    db_close();
    skills_reset();
    global.sk_lvl[UnknownEnum.Value_0] = loadout_get_cardio(t_id);
    global.sk_lvl[UnknownEnum.Value_4] = loadout_get_style(t_id);
    global.sk_lvl[UnknownEnum.Value_8] = loadout_get_shooting(t_id);
    global.sk_lvl[UnknownEnum.Value_12] = loadout_get_charisma(t_id);
    global.sk_lvl[UnknownEnum.Value_16] = loadout_get_medicine(t_id);
    global.sk_lvl[UnknownEnum.Value_19] = loadout_get_cooking(t_id);
    global.sk_lvl[UnknownEnum.Value_22] = loadout_get_gunsmith(t_id);
    global.player_money = loadout_get_starting_money(t_id);
    db_open(inventory_target_db());
    db_write("stats", "money", global.player_money);
    db_close();
}

enum UnknownEnum
{
    Value_0,
    Value_4 = 4,
    Value_8 = 8,
    Value_12 = 12,
    Value_16 = 16,
    Value_19 = 19,
    Value_22 = 22
}
