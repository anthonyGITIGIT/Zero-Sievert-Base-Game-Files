function settings_determine_resolution()
{
    var _resolution = settings_get("resolution");
    
    while (true)
    {
        var _width, _height, _lower;
        
        switch (_resolution)
        {
            case UnknownEnum.Value_0:
                _width = 1280;
                _height = 720;
                _lower = UnknownEnum.Value_0;
                break;
            
            case UnknownEnum.Value_1:
                _width = 1920;
                _height = 1080;
                _lower = UnknownEnum.Value_0;
                break;
            
            case UnknownEnum.Value_2:
                _width = 2560;
                _height = 1440;
                _lower = UnknownEnum.Value_1;
                break;
            
            case UnknownEnum.Value_3:
                _width = 3840;
                _height = 2160;
                _lower = UnknownEnum.Value_2;
                break;
            
            default:
                _resolution = UnknownEnum.Value_1;
                _width = 1920;
                _height = 1080;
                _lower = UnknownEnum.Value_0;
                break;
        }
        
        if ((0.9 * display_get_width()) >= _width || (0.9 * window_get_height()) >= _height)
            break;
        
        _resolution = _lower;
        
        if (_resolution == UnknownEnum.Value_0)
            break;
    }
    
    settings_set("resolution", _resolution);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}
