function spr_sprite_downloader_clear(arg0)
{
    with (obj_sprite_downloader)
    {
        var _this_image = data[arg0];
        
        if (_this_image.sprite_made && _this_image.deleted_sprite_texture == false && sprite_exists(_this_image.asset_id))
        {
            sprite_delete(_this_image.asset_id);
            _this_image.deleted_sprite_texture = true;
        }
    }
    
    spr_sprite_downloader_deleteLocalFiles(arg0);
}
