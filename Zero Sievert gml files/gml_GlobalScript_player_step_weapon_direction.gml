function player_step_weapon_direction()
{
    if (item_get_category(arma_now) == "weapon")
    {
        if (alarm[1] < max(1, item_weapon_get_rate_of_fire(arma_now) - 2))
            weapon_pointing_direction = point_direction(x, y, aim_point_x, aim_point_y);
    }
}
