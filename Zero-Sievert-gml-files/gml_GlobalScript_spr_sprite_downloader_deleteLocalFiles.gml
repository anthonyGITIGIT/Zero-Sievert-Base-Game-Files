function spr_sprite_downloader_deleteLocalFiles(arg0)
{
    with (obj_sprite_downloader)
    {
        var _this_image = data[arg0];
        
        if (file_exists(_this_image.full_path))
        {
            if (file_delete(_this_image.full_path))
            {
                _this_image.deleted_local_files = true;
                return true;
            }
        }
    }
    
    return false;
}
