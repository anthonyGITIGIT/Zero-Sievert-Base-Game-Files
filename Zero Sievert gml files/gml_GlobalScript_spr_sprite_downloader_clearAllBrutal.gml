function spr_sprite_downloader_clearAllBrutal()
{
    spr_sprite_downloader_clearAll();
    
    with (obj_sprite_downloader)
        directory_destroy(working_directory + "\\downloaded\\");
}
