resolution_scale = settings_get("resolution scaling");
var _aspect_ratio = 1.7777777777777777;
var _height = window_get_height();

if (_height == 0)
    _height = display_get_height();

var _width = _height * _aspect_ratio;

if (surface_get_width(application_surface) != (_width * resolution_scale) || surface_get_height(application_surface) != (_height * resolution_scale))
{
    if (surface_exists(canvas_current))
        surface_free(canvas_current);
    
    if (surface_exists(canvas_next))
        surface_free(canvas_next);
    
    canvas_current = undefined;
    canvas_next = undefined;
    var _new_width = round(_width * resolution_scale);
    var _new_height = round(_height * resolution_scale);
    
    if (_new_width > 0 && _new_height > 0)
        surface_resize(application_surface, _new_width, _new_height);
}

player_follow_local();

if (is_in_hub())
    weather_shader(1);

var _to_change = 0;
u_contrast_r[_to_change].update();
u_contrast_g[_to_change].update();
u_contrast_b[_to_change].update();
u_saturation[_to_change].update();
u_brightness[_to_change].update();
u_amount_dark[_to_change].update();
u_amount_light[_to_change].update();
u_threshold_highlight[_to_change].update();
u_multiplier_highlight[_to_change].update();
u_threshold_lowlight[_to_change].update();
u_multiplier_lowlight[_to_change].update();
u_chromatic_aberration_distance[_to_change].update();
u_chromatic_aberration_amount[_to_change].update();
