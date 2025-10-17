function spr_sprite_downloader_downloadAmount(arg0)
{
    with (obj_sprite_downloader)
    {
        var _this_image = data[arg0];
        
        if (_this_image.error == false && _this_image.url_worked == true)
        {
            if (_this_image.downloaded)
                return 1;
            
            return _this_image.download_file_size_current / _this_image.download_file_size_total;
        }
    }
    
    return false;
}
