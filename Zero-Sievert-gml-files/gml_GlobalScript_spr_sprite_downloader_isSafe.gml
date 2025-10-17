function spr_sprite_downloader_isSafe(arg0)
{
    with (obj_sprite_downloader)
    {
        var _this_image = data[arg0];
        
        if (_this_image.sprite_made && _this_image.error == false && sprite_exists(_this_image.asset_id))
            return true;
    }
    
    return false;
}
