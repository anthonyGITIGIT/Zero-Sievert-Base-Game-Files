previous_x = x;
previous_y = y;

if (player_local_state_is(scr_player_state_move) && player_get_local().shooting)
{
    var _dis = point_distance(x, y, obj_cursor.aa_x, obj_cursor.aa_y);
    
    if (_dis < 0.5)
    {
        x = obj_cursor.aa_x;
        y = obj_cursor.aa_y;
    }
    else
    {
        _dir = point_direction(x, y, obj_cursor.aa_x, obj_cursor.aa_y);
        x += lengthdir_x(_dis / 6, _dir);
        y += lengthdir_y(_dis / 6, _dir);
    }
}
else
{
    x = obj_cursor.aa_x;
    y = obj_cursor.aa_y;
}

if (!player_exists_local())
    exit;

var _player = player_get_local();

if (player_local_state_is(scr_player_state_move))
    image_index = 8;

linea_libera_gun_mouse = true;
var _dir = point_direction(_player.laser_startx, _player.laser_starty, x, y) + 90;
var _off = 1;
var _newx = _player.laser_startx + lengthdir_x(_off, _dir);
var _newy = _player.laser_starty + lengthdir_y(_off, _dir);

if (collision_line(x, y, _newx, _newy, obj_solid, true, true))
    linea_libera_gun_mouse = false;

_dir = point_direction(_player.laser_startx, _player.laser_starty, x, y) - 90;
_newx = _player.laser_startx + lengthdir_x(_off, _dir);
_newy = _player.laser_starty + lengthdir_y(_off, _dir);

if (collision_line(x, y, _newx, _newy, obj_solid, true, true))
    linea_libera_gun_mouse = false;
