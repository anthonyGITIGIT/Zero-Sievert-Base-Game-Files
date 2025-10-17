function player_init_weapons()
{
    arma_now = "no_item";
    weapon_slot_now = UnknownEnum.Value_1;
    loot_in_slot = {};
    now_precision = 0;
    now_recoil = 0;
    now_damage = 0;
    now_ergo = 0;
    now_reload_time = 0;
}

enum UnknownEnum
{
    Value_1 = 1
}
