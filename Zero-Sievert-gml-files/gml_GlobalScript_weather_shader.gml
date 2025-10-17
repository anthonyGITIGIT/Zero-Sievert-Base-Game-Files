function weather_shader(arg0 = 1)
{
    if (is_in_hub())
        arg0 = 1;
    
    var _weather_now = weather_get_weather_now();
    var u_saturation = 1;
    var u_brightness = 1;
    var u_amount_dark = 0;
    var u_amount_light = 1;
    var u_threshold_highlight = 0.4;
    var u_multiplier_highlight = 1;
    var u_threshold_lowlight = 0.3;
    var u_multiplier_lowlight = 1;
    var u_contrast_r = 1;
    var u_contrast_g = 1;
    var u_contrast_b = 1;
    
    if (!is_inside_bunker())
    {
        switch (_weather_now)
        {
            case "sun_1":
                u_saturation = 1.05;
                u_brightness = 1.04;
                u_amount_light = 1.1;
                u_threshold_highlight = 0.4;
                u_multiplier_highlight = 1.1;
                u_threshold_lowlight = 0.3;
                u_multiplier_lowlight = 1;
                u_contrast_r = 1.04;
                u_contrast_g = 1.04;
                u_contrast_b = 1.04;
                break;
            
            case "cloud_1":
                u_saturation = 1;
                u_brightness = 1;
                u_amount_light = 0.98;
                u_threshold_highlight = 0.4;
                u_multiplier_highlight = 1;
                u_threshold_lowlight = 0.3;
                u_multiplier_lowlight = 1.2;
                u_contrast_r = 0.98;
                u_contrast_g = 0.98;
                u_contrast_b = 1.08;
                break;
            
            case "rain_1":
                u_saturation = 0.8;
                u_brightness = 0.98;
                u_amount_light = 0.98;
                u_threshold_highlight = 0.4;
                u_multiplier_highlight = 0.95;
                u_threshold_lowlight = 0.3;
                u_multiplier_lowlight = 1.25;
                u_contrast_r = 0.94;
                u_contrast_g = 0.94;
                u_contrast_b = 1.1;
                break;
            
            case "rain_2":
                u_saturation = 0.7;
                u_brightness = 0.98;
                u_amount_light = 0.95;
                u_threshold_highlight = 0.4;
                u_multiplier_highlight = 0.85;
                u_threshold_lowlight = 0.3;
                u_multiplier_lowlight = 1.4;
                u_contrast_r = 0.85;
                u_contrast_g = 0.85;
                u_contrast_b = 1.2;
                break;
            
            case "rain_3":
                u_saturation = 0.6;
                u_brightness = 0.96;
                u_amount_light = 0.95;
                u_threshold_highlight = 0.4;
                u_multiplier_highlight = 0.85;
                u_threshold_lowlight = 0.3;
                u_multiplier_lowlight = 1.4;
                u_contrast_r = 0.8;
                u_contrast_g = 0.8;
                u_contrast_b = 1.25;
                break;
            
            case "rad_rain_1":
                u_saturation = 0.96;
                u_amount_light = 0.98;
                u_contrast_g = 1.1;
                break;
            
            case "rad_rain_2":
                u_saturation = 0.96;
                u_amount_light = 0.98;
                u_contrast_g = 1.16;
                break;
            
            case "rad_rain_3":
                u_saturation = 0.96;
                u_amount_light = 0.98;
                u_contrast_g = 1.25;
                break;
            
            case "fog_1":
                u_saturation = 0.75;
                u_brightness = 1;
                u_amount_light = 1.08;
                u_threshold_highlight = 0.4;
                u_multiplier_highlight = 0.9;
                u_threshold_lowlight = 0.3;
                u_multiplier_lowlight = 1;
                u_contrast_r = 0.97;
                u_contrast_g = 0.97;
                u_contrast_b = 1.1;
                break;
            
            case "fog_2":
                u_saturation = 0.55;
                u_brightness = 1.04;
                u_amount_light = 1.1;
                u_threshold_highlight = 0.4;
                u_multiplier_highlight = 0.8;
                u_threshold_lowlight = 0.3;
                u_multiplier_lowlight = 1;
                u_contrast_r = 0.9;
                u_contrast_g = 0.9;
                u_contrast_b = 1.08;
                break;
            
            case "snow_1":
            case "snow_2":
            case "snow_3":
                u_saturation = 0.8;
                u_brightness = 1.02;
                u_amount_light = 1.05;
                u_threshold_highlight = 0.4;
                u_multiplier_highlight = 1.1;
                u_threshold_lowlight = 0.3;
                u_multiplier_lowlight = 1;
                u_contrast_r = 1;
                u_contrast_g = 1;
                u_contrast_b = 1.2;
                break;
        }
    }
    
    pp_colour_change_rgb(u_contrast_r, u_contrast_g, u_contrast_b, arg0);
    pp_colour_change_light(u_amount_light, arg0);
    pp_colour_change_dark(u_amount_dark, arg0);
    pp_colour_change_highlights(u_multiplier_highlight, arg0);
    pp_colour_change_lowlights(u_multiplier_lowlight, arg0);
    pp_colour_change_highlights_threshold(u_threshold_highlight, arg0);
    pp_colour_change_lowlights_threshold(u_threshold_lowlight, arg0);
    pp_colour_change_saturation(u_saturation, arg0);
    pp_colour_change_brightness(u_brightness, arg0);
}
