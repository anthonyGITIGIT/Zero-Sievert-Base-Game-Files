if (is_in_raid() && player_exists_local())
{
    var xx = player_get_local().x div 16;
    var yy = player_get_local().y div 16;
    var _w = 34;
    var _h = 20;
    ds_grid_set_region(grid_surface_cover, xx - (_w / 2), yy - (_h / 2), xx + (_w / 2), yy + (_h / 2), true);
}

alarm[1] = 60;
