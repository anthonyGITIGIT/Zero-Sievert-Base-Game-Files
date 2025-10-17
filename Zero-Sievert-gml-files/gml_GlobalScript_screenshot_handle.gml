function screenshot_handle()
{
    static _func_save_screenshot = function()
    {
        directory_create("screenshots");
        var _datetime = date_current_datetime();
        var _filename = concat("screenshots/", date_get_year(_datetime), "-", date_get_month(_datetime), "-", date_get_day(_datetime), "_", date_get_hour(_datetime), "-", date_get_minute(_datetime), "-", date_get_second(_datetime), ".png");
        screen_save(_filename);
        return _filename;
    };
    
    if (steam_initialised() && (steam_is_screenshot_requested() || keyboard_check_pressed(vk_f12)))
    {
        var _filename = _func_save_screenshot();
        var _width = window_get_width();
        var _height = window_get_height();
        steam_send_screenshot(_filename, _width, _height);
    }
    
    if (!steam_initialised() && keyboard_check_pressed(vk_f12))
        _func_save_screenshot();
}
