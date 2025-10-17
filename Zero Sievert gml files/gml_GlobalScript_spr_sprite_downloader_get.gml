function spr_sprite_downloader_get(arg0)
{
    with (obj_sprite_downloader)
    {
        if (spr_sprite_downloader_isSafe(arg0))
        {
            var _this_image = data[arg0];
            return _this_image.asset_id;
        }
    }
    
    return undefined;
}
