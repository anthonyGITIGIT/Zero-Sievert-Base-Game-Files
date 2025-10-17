data = [];

function downloaded_sprite(arg0, arg1) constructor
{
    asset_id = undefined;
    url_worked = false;
    downloaded = false;
    sprite_made = false;
    deleted_local_files = false;
    deleted_sprite_texture = false;
    error = false;
    from_url = arg0;
    id = arg1;
    async_id = undefined;
    extension = filename_ext(arg0);
    file_name = string(arg1) + extension;
    full_path = working_directory + "\\downloaded\\" + file_name;
    download_file_size_total = 0;
    download_file_size_current = 0;
}
