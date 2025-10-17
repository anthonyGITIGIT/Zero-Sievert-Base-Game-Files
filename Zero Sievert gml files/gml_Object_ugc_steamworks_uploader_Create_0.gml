display_text = array_create(UnknownEnum.Value_13);
display_text[UnknownEnum.Value_0] = "Connecting to Steam...";
display_text[UnknownEnum.Value_3] = "Gathering files...";
display_text[UnknownEnum.Value_4] = "Gathering files...";
display_text[UnknownEnum.Value_5] = "Making Workshop Page...";
display_text[UnknownEnum.Value_6] = "Making Workshop Page...";
display_text[UnknownEnum.Value_7] = "Uploading...";
display_text[UnknownEnum.Value_8] = "Uploading...";
display_text[UnknownEnum.Value_9] = "Uploading...";
display_text[UnknownEnum.Value_10] = "Uploading...";
display_text[UnknownEnum.Value_12] = "Error Happened";
display_text[UnknownEnum.Value_11] = "Finished";
status = UnknownEnum.Value_0;
updateHandle = undefined;
requestId = undefined;

if (workshop_id != undefined)
{
    workshop_id_connection = steam_ugc_start_item_update(steam_get_app_id(), workshop_id);
    status = UnknownEnum.Value_2;
    var _folder_path = ugc_get_folder() + "\\" + folder;
    var _meta_file = _folder_path + "\\" + "meta.ini";
    
    if (file_exists(_meta_file))
    {
        ini_open(_meta_file);
        ini_write_real("leave blank", "author_id", steam_get_user_account_id());
        ini_close();
    }
}
else
{
    workshop_id_connection = steam_ugc_create_item(steam_get_app_id(), ugc_filetype_community);
}

upload_started = false;
upload_in_progress = false;
upload_finished = false;
upload_committing = false;
upload_code = 0;
upload_status = "";
upload_processed = 0;
upload_total = 0;
upload_invalid_count = 0;
upload_invalid_count_max = 200;
error_string = "";
meta_name = "Not Loaded";
meta_description = "Not Loaded";
meta_version = "Not Loaded";
meta_author = "Not Loaded";
meta_tags = "Not Loaded";

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13
}
