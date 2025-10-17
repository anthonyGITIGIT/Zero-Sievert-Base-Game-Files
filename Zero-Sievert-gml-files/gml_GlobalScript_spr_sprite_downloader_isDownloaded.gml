function spr_sprite_downloader_isDownloaded(arg0)
{
    with (obj_sprite_downloader)
    {
        var _this_image = data[arg0];
        
        if (_this_image.error == false)
            return _this_image.downloaded;
    }
    
    return false;
}
