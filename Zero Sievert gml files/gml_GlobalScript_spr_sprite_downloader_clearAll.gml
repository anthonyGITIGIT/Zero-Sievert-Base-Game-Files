function spr_sprite_downloader_clearAll()
{
    with (obj_sprite_downloader)
    {
        var _count_of_images = array_length(data);
        
        for (var i = 0; i < _count_of_images; i++)
            spr_sprite_downloader_clear(i);
    }
}
