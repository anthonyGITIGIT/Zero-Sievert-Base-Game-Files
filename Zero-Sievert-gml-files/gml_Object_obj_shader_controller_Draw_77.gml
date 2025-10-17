var _player = player_get_local();
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var draw_normal = true;
draw_set_alpha(1);

if (!surface_exists(canvas_current))
    canvas_current = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));

if (!surface_exists(canvas_next))
    canvas_next = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));

shader_set(shd_full_alpha);
surface_set_target(canvas_current);
draw_clear_alpha(c_black, 1);
draw_surface(application_surface, 0, 0);
surface_reset_target();
surface_set_target(canvas_next);
draw_clear_alpha(c_black, 1);
draw_surface(application_surface, 0, 0);
surface_reset_target();
shader_reset();
surface_set_target(canvas_current);
draw_surface(application_surface, 0, 0);
var _temp = canvas_current;
canvas_current = canvas_next;
canvas_next = _temp;
surface_reset_target();

if (instance_exists(_player) && !player_local_state_is(scr_player_state_start, scr_player_state_free_camera, scr_player_state_dead))
{
    if (is_in_raid())
    {
        var rx = x div 8;
        var ry = (y + 8) div 8;
        rx = clamp(rx, 1, obj_map_generator.grid_rw - 1);
        ry = clamp(ry, 1, obj_map_generator.grid_rh - 1);
        var c = ds_grid_get(obj_map_generator.grid_radiation, rx, ry);
        var difesa_rad = item_armor_get_radiation(_player.armor_now);
        var radiation_ = c - global.injector_factor[UnknownEnum.Value_8] - difesa_rad;
        radiation_ = clamp(radiation_, 0, 1000);
        radiation_amount += (radiation_ - 200);
        radiation_amount = clamp(radiation_amount, 0, radiation_);
        var amount = radiation_amount / 600;
        amount = clamp(amount, 0, 1);
        
        if (amount > 0 && !global.night_vision && !player_local_state_is(scr_player_state_start, scr_player_state_free_camera))
        {
            draw_normal = false;
            application_surface_draw_enable(false);
            shader_set(shd_radiation);
            shader_set_uniform_f(shader_radiation_time, (0.00001 * current_time) % 1);
            shader_set_uniform_f(shader_radiation_intensity, amount);
            surface_set_target(canvas_current);
            draw_surface_stretched(canvas_next, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
            _temp = canvas_current;
            canvas_current = canvas_next;
            canvas_next = _temp;
            surface_reset_target();
            shader_reset();
        }
    }
    
    if (global.night_vision && player_exists_local())
    {
        var _headset_id = _player.headset_now;
        
        if (item_exists(_headset_id))
        {
            if (item_headset_get_type(_headset_id) == "night_vision")
            {
                draw_normal = false;
                application_surface_draw_enable(false);
                gpu_set_blendenable(false);
                shader_set(shd_night_vision);
                var uni_brightness_amount = shader_get_uniform(shd_night_vision, "brightness_amount");
                shader_set_uniform_f(uni_brightness_amount, item_headset_get_brightness(_headset_id));
                var uni_contrast_amount = shader_get_uniform(shd_night_vision, "contrast_amount");
                shader_set_uniform_f(uni_contrast_amount, item_headset_get_contrast(_headset_id));
                var uni_gamma_amount = shader_get_uniform(shd_night_vision, "gamma_amount");
                shader_set_uniform_f(uni_gamma_amount, item_headset_get_gamma(_headset_id));
                var uni_red_amount = shader_get_uniform(shd_night_vision, "red_amount");
                shader_set_uniform_f(uni_red_amount, item_headset_get_red(_headset_id));
                var uni_green_amount = shader_get_uniform(shd_night_vision, "green_amount");
                shader_set_uniform_f(uni_green_amount, item_headset_get_green(_headset_id));
                var uni_blue_amount = shader_get_uniform(shd_night_vision, "blue_amount");
                shader_set_uniform_f(uni_blue_amount, item_headset_get_blue(_headset_id));
                var uni_grain_time = shader_get_uniform(shd_night_vision, "grain_time");
                shader_set_uniform_f(uni_grain_time, (0.00001 * current_time) % 1);
                var uni_grain_amount = shader_get_uniform(shd_night_vision, "grain_amount");
                shader_set_uniform_f(uni_grain_amount, item_headset_get_grain(_headset_id));
                surface_set_target(canvas_current);
                draw_surface_stretched(canvas_next, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
                _temp = canvas_current;
                canvas_current = canvas_next;
                canvas_next = _temp;
                surface_reset_target();
                shader_reset();
                gpu_set_blendenable(true);
            }
        }
    }
    
    if (global.is_emission_now == true)
    {
        if (global.emission_has_shader[global.state_emission_now] == true)
        {
            draw_normal = false;
            application_surface_draw_enable(false);
            shader_set(shd_night_vision);
            var uni_brightness_amount = shader_get_uniform(shd_night_vision, "brightness_amount");
            shader_set_uniform_f(uni_brightness_amount, global.emission_shader_brightness_now);
            var uni_contrast_amount = shader_get_uniform(shd_night_vision, "contrast_amount");
            shader_set_uniform_f(uni_contrast_amount, global.emission_shader_contrast_now);
            var uni_gamma_amount = shader_get_uniform(shd_night_vision, "gamma_amount");
            shader_set_uniform_f(uni_gamma_amount, 1);
            var uni_red_amount = shader_get_uniform(shd_night_vision, "red_amount");
            shader_set_uniform_f(uni_red_amount, global.emission_shader_red_now);
            var uni_green_amount = shader_get_uniform(shd_night_vision, "green_amount");
            shader_set_uniform_f(uni_green_amount, global.emission_shader_green_now);
            var uni_blue_amount = shader_get_uniform(shd_night_vision, "blue_amount");
            shader_set_uniform_f(uni_blue_amount, global.emission_shader_blue_now);
            var uni_grain_time = shader_get_uniform(shd_night_vision, "grain_time");
            shader_set_uniform_f(uni_grain_time, (0.00001 * current_time) % 1);
            var uni_grain_amount = shader_get_uniform(shd_night_vision, "grain_amount");
            shader_set_uniform_f(uni_grain_amount, 0);
            surface_set_target(canvas_current);
            draw_surface_stretched(canvas_next, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
            _temp = canvas_current;
            canvas_current = canvas_next;
            canvas_next = _temp;
            surface_reset_target();
            shader_reset();
        }
    }
    
    if (settings_get("colour overlay"))
    {
        draw_normal = false;
        application_surface_draw_enable(false);
        gpu_set_blendenable(false);
        var _this_shader = shd_colour_changer;
        shader_set(_this_shader);
        var uni_brightness_amount = shader_get_uniform(_this_shader, "u_contrast_r");
        shader_set_uniform_f(uni_brightness_amount, u_contrast_r[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_contrast_g");
        shader_set_uniform_f(uni_brightness_amount, u_contrast_g[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_contrast_b");
        shader_set_uniform_f(uni_brightness_amount, u_contrast_b[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_saturation");
        shader_set_uniform_f(uni_brightness_amount, u_saturation[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_brightness");
        shader_set_uniform_f(uni_brightness_amount, u_brightness[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_amount_dark");
        shader_set_uniform_f(uni_brightness_amount, u_amount_dark[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_amount_light");
        shader_set_uniform_f(uni_brightness_amount, u_amount_light[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_threshold_highlight");
        shader_set_uniform_f(uni_brightness_amount, u_threshold_highlight[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_multiplier_highlight");
        shader_set_uniform_f(uni_brightness_amount, u_multiplier_highlight[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_threshold_lowlight");
        shader_set_uniform_f(uni_brightness_amount, u_threshold_lowlight[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_multiplier_lowlight");
        shader_set_uniform_f(uni_brightness_amount, u_multiplier_lowlight[0].value);
        surface_set_target(canvas_current);
        draw_surface_stretched(canvas_next, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
        _temp = canvas_current;
        canvas_current = canvas_next;
        canvas_next = _temp;
        surface_reset_target();
        shader_reset();
        gpu_set_blendenable(true);
        draw_normal = false;
        application_surface_draw_enable(false);
        gpu_set_blendenable(false);
        _this_shader = shd_colour_changer_ring_outside;
        shader_set(_this_shader);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_contrast_r");
        shader_set_uniform_f(uni_brightness_amount, u_contrast_r[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_contrast_g");
        shader_set_uniform_f(uni_brightness_amount, u_contrast_g[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_contrast_b");
        shader_set_uniform_f(uni_brightness_amount, u_contrast_b[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_saturation");
        shader_set_uniform_f(uni_brightness_amount, u_saturation[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_brightness");
        shader_set_uniform_f(uni_brightness_amount, u_brightness[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_amount_dark");
        shader_set_uniform_f(uni_brightness_amount, u_amount_dark[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_amount_light");
        shader_set_uniform_f(uni_brightness_amount, u_amount_light[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_threshold_highlight");
        shader_set_uniform_f(uni_brightness_amount, u_threshold_highlight[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_multiplier_highlight");
        shader_set_uniform_f(uni_brightness_amount, u_multiplier_highlight[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_threshold_lowlight");
        shader_set_uniform_f(uni_brightness_amount, u_threshold_lowlight[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_multiplier_lowlight");
        shader_set_uniform_f(uni_brightness_amount, u_multiplier_lowlight[1].value);
        surface_set_target(canvas_current);
        draw_surface_stretched(canvas_next, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
        _temp = canvas_current;
        canvas_current = canvas_next;
        canvas_next = _temp;
        surface_reset_target();
        shader_reset();
        gpu_set_blendenable(true);
        draw_normal = false;
        application_surface_draw_enable(false);
        gpu_set_blendenable(false);
        _this_shader = shd_colour_changer_ring_inside;
        shader_set(_this_shader);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_contrast_r");
        shader_set_uniform_f(uni_brightness_amount, u_contrast_r[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_contrast_g");
        shader_set_uniform_f(uni_brightness_amount, u_contrast_g[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_contrast_b");
        shader_set_uniform_f(uni_brightness_amount, u_contrast_b[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_saturation");
        shader_set_uniform_f(uni_brightness_amount, u_saturation[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_brightness");
        shader_set_uniform_f(uni_brightness_amount, u_brightness[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_amount_dark");
        shader_set_uniform_f(uni_brightness_amount, u_amount_dark[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_amount_light");
        shader_set_uniform_f(uni_brightness_amount, u_amount_light[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_threshold_highlight");
        shader_set_uniform_f(uni_brightness_amount, u_threshold_highlight[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_multiplier_highlight");
        shader_set_uniform_f(uni_brightness_amount, u_multiplier_highlight[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_threshold_lowlight");
        shader_set_uniform_f(uni_brightness_amount, u_threshold_lowlight[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_multiplier_lowlight");
        shader_set_uniform_f(uni_brightness_amount, u_multiplier_lowlight[2].value);
        surface_set_target(canvas_current);
        draw_surface_stretched(canvas_next, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
        _temp = canvas_current;
        canvas_current = canvas_next;
        canvas_next = _temp;
        surface_reset_target();
        shader_reset();
        gpu_set_blendenable(true);
        draw_normal = false;
        application_surface_draw_enable(false);
        gpu_set_blendenable(false);
        _this_shader = shd_chromatic_aberration_full;
        shader_set(_this_shader);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_chromatic_aberration_distance");
        shader_set_uniform_f(uni_brightness_amount, u_chromatic_aberration_distance[0].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_chromatic_aberration_amount");
        shader_set_uniform_f(uni_brightness_amount, u_chromatic_aberration_amount[0].value);
        surface_set_target(canvas_current);
        draw_surface_stretched(canvas_next, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
        _temp = canvas_current;
        canvas_current = canvas_next;
        canvas_next = _temp;
        surface_reset_target();
        shader_reset();
        gpu_set_blendenable(true);
        draw_normal = false;
        application_surface_draw_enable(false);
        gpu_set_blendenable(false);
        _this_shader = shd_chromatic_aberration_outside;
        shader_set(_this_shader);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_chromatic_aberration_distance");
        shader_set_uniform_f(uni_brightness_amount, u_chromatic_aberration_distance[1].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_chromatic_aberration_amount");
        shader_set_uniform_f(uni_brightness_amount, u_chromatic_aberration_amount[1].value);
        surface_set_target(canvas_current);
        draw_surface_stretched(canvas_next, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
        _temp = canvas_current;
        canvas_current = canvas_next;
        canvas_next = _temp;
        surface_reset_target();
        shader_reset();
        gpu_set_blendenable(true);
        draw_normal = false;
        application_surface_draw_enable(false);
        gpu_set_blendenable(false);
        _this_shader = shd_chromatic_aberration_inside;
        shader_set(_this_shader);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_chromatic_aberration_distance");
        shader_set_uniform_f(uni_brightness_amount, u_chromatic_aberration_distance[2].value);
        uni_brightness_amount = shader_get_uniform(_this_shader, "u_chromatic_aberration_amount");
        shader_set_uniform_f(uni_brightness_amount, u_chromatic_aberration_amount[2].value);
        surface_set_target(canvas_current);
        draw_surface_stretched(canvas_next, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
        _temp = canvas_current;
        canvas_current = canvas_next;
        canvas_next = _temp;
        surface_reset_target();
        shader_reset();
        gpu_set_blendenable(true);
    }
    
    if (draw_normal == true)
        application_surface_draw_enable(true);
}

var a = application_get_position();
var xscale = (a[2] - a[0]) / surface_get_width(_temp);
var yscale = (a[3] - a[1]) / surface_get_height(_temp);
draw_surface_ext(_temp, a[0], a[1], xscale, yscale, 0, c_white, 1);

if (draw_normal == true)
{
    global.night_vision = false;
    application_surface_draw_enable(true);
}

enum UnknownEnum
{
    Value_8 = 8
}
