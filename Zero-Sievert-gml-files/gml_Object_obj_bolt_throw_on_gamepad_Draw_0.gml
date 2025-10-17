var camx = 0;
var camy = 0;
var _player = player_get_local();
var _min = 30;
var _max = 65;
var _dis = lerp(_max, _min, frame / frames);
_dis = clamp(_dis, _min, _max);
var _dir = obj_gamepad.input_decimal[UnknownEnum.Value_27];
var _base = 4;
var _offset_from_p = 8;
var x1 = ((_player.x + lengthdir_x(_base / 2, _dir + 90)) - camx) + lengthdir_x(_offset_from_p, _dir);
var y1 = ((_player.y + lengthdir_y(_base / 2, _dir + 90)) - camy) + lengthdir_y(_offset_from_p, _dir);
var x2 = ((_player.x + lengthdir_x(_base / 2, _dir - 90)) - camx) + lengthdir_x(_offset_from_p, _dir);
var y2 = ((_player.y + lengthdir_y(_base / 2, _dir - 90)) - camy) + lengthdir_y(_offset_from_p, _dir);
var x3 = (_player.x + lengthdir_x(_dis, _dir)) - camx;
var y3 = (_player.y + lengthdir_y(_dis, _dir)) - camy;
var _c = 16777215;
var _a = 0.6;
draw_set_alpha(_a);
draw_triangle_color(x1, y1, x2, y2, x3, y3, _c, _c, _c, false);
draw_set_alpha(1);

enum UnknownEnum
{
    Value_27 = 27
}
