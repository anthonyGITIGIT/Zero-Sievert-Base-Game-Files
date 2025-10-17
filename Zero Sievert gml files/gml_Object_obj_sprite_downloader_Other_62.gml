var _this_id = ds_map_find_value(async_load, "id");
var _number_of_images_in_progress = array_length(data);

for (var i = 0; i < _number_of_images_in_progress; i++)
{
    var _this_image = data[i];
    
    if (_this_image.async_id == _this_id)
    {
        var _status = ds_map_find_value(async_load, "status");
        
        if (_status == 0)
        {
            _this_image.downloaded = true;
            
            if (file_exists(_this_image.full_path))
            {
                _this_image.asset_id = sprite_add(_this_image.full_path, 1, false, true, 0, 0);
                
                if (_this_image.asset_id != -1 && sprite_exists(_this_image.asset_id))
                {
                    _this_image.sprite_made = true;
                    spr_sprite_downloader_deleteLocalFiles(_this_image.id);
                }
                else
                {
                    trace("Error in Sprite Downloader - Problems making the sprite.");
                    _this_image.error = true;
                }
            }
            else
            {
                trace("Error in Sprite Downloader - Couldnt find/read the file.");
                _this_image.error = true;
            }
        }
        else if (_status < 0)
        {
            trace("Error in Sprite Downloader - File didnt download for whatever reason.");
            _this_image.error = true;
        }
        else if (_status == 1)
        {
            _this_image.download_file_size_total = ds_map_find_value(async_load, "contentLength");
            _this_image.download_file_size_current = ds_map_find_value(async_load, "sizeDownloaded");
        }
    }
}
