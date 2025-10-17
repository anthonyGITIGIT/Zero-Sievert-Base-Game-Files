draw_sprite_ext(sprite_index, image_index, x, y, 1 - scale_now, 1 - scale_now, image_angle, c_black, 0.4);
var _dist_dec = clamp(distance_travelled / detonation_point, 0, 1);
var _lob_height_max = 0;
var _start_point = 0;
var _use_dec = 0;
var _lob_height_current = 0;
var _bounce_count = array_length(bouncing);

if (throw_type != "GRENADE_throw_no_move")
{
    for (var i = 0; i < _bounce_count; i++)
    {
        var _this_bounce = bouncing[i];
        
        if (_this_bounce.point >= _dist_dec)
        {
            _use_dec = map_value(_dist_dec, _start_point, _this_bounce.point, 0, 1);
            _lob_height_max = _this_bounce.height;
            break;
        }
        
        _start_point = _this_bounce.point;
    }
    
    _lob_height_current = sin(_use_dec * pi) * _lob_height_max;
}

draw_sprite_ext(sprite_index, image_index, x, y - _lob_height_current, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
