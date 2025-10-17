function player_step_update_sprite()
{
    sprite_idle = item_armor_get_s_idle(armor_now);
    sprite_run = item_armor_get_s_run(armor_now);
    sprite_dead = item_armor_get_s_dead(armor_now);
}
