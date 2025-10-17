bb_w = min(string_width(t) + 14, 464);

if (string_pos("\n", t) != 0)
    bb_w = 460;

draw_y_limit = 270 - bb_h - 8;
draw_x = 480 - bb_w - 10;
depth = -15991;
draw_y = lerp(draw_y, draw_y_limit, 0.15);

if (player_exists_local())
{
    x = player_get_local().x;
    y = player_get_local().y;
}
