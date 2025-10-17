switch (status)
{
    case UnknownEnum.Value_0:
        steam_update();
        break;
    
    case UnknownEnum.Value_2:
        var _folder_path = ugc_get_folder() + "\\" + folder;
        var _meta_file = _folder_path + "\\" + "meta.ini";
        
        if (file_exists(_meta_file))
        {
            ini_open(_meta_file);
            var _meta_name = ini_read_string("mod", "name", undefined);
            var _meta_desc = ini_read_string("mod", "description", undefined);
            var _meta_version = ini_read_string("mod", "version", undefined);
            var _meta_author = ini_read_string("mod", "author", undefined);
            var _meta_tags = ini_read_string("mod", "tags", undefined);
            ini_close();
            
            if (!is_undefined(_meta_name))
            {
                meta_name = _meta_name;
            }
            else
            {
                error_string = "Missing 'name' in mod meta file";
                status = UnknownEnum.Value_12;
            }
            
            if (!is_undefined(_meta_desc))
            {
                meta_description = _meta_desc;
            }
            else
            {
                error_string = "Missing 'description' in mod meta file";
                status = UnknownEnum.Value_12;
            }
            
            if (!is_undefined(_meta_version))
            {
                meta_version = _meta_version;
            }
            else
            {
                error_string = "Missing 'version' in mod meta file";
                status = UnknownEnum.Value_12;
            }
            
            if (!is_undefined(_meta_author))
            {
                meta_author = _meta_author;
            }
            else
            {
                error_string = "Missing 'author' in mod meta file";
                status = UnknownEnum.Value_12;
            }
            
            if (!is_undefined(_meta_tags))
                meta_tags = _meta_tags;
            else
                meta_tags = "";
        }
        else
        {
            error_string = "Failed to find mod meta file";
            status = UnknownEnum.Value_12;
        }
        
        if (status != UnknownEnum.Value_12)
            status = UnknownEnum.Value_3;
        
        break;
    
    case UnknownEnum.Value_1:
        status = UnknownEnum.Value_2;
        break;
    
    case UnknownEnum.Value_4:
        status = UnknownEnum.Value_5;
        break;
    
    case UnknownEnum.Value_3:
        status = UnknownEnum.Value_4;
        break;
    
    case UnknownEnum.Value_6:
        var _upload_folder = ugc_get_folder() + "\\" + folder;
        show_debug_message("Trying to upload this folder: " + string(_upload_folder));
        
        if (directory_exists(_upload_folder))
        {
            var _app_id = steam_get_app_id();
            updateHandle = steam_ugc_start_item_update(_app_id, workshop_id);
            steam_ugc_set_item_title(updateHandle, meta_name);
            steam_ugc_set_item_description(updateHandle, meta_description);
            steam_ugc_set_item_visibility(updateHandle, 0);
            steam_ugc_set_item_tags(updateHandle, string_split(meta_tags, ","));
            steam_ugc_set_item_preview(updateHandle, _upload_folder + "\\" + "icon.png");
            steam_ugc_set_item_content(updateHandle, _upload_folder);
            status = UnknownEnum.Value_7;
        }
        else
        {
            status = UnknownEnum.Value_12;
            error_string = "Error: Folder of mod not found or not readable.";
        }
        
        break;
    
    case UnknownEnum.Value_5:
        status = UnknownEnum.Value_6;
        break;
    
    case UnknownEnum.Value_8:
        requestId = steam_ugc_submit_item_update(updateHandle, meta_version);
        status = UnknownEnum.Value_9;
        break;
    
    case UnknownEnum.Value_7:
        status = UnknownEnum.Value_8;
        break;
    
    case UnknownEnum.Value_10:
        steam_update();
        upload_started = true;
        var _uploadMap = ds_map_create();
        var _returned = steam_ugc_get_item_update_progress(updateHandle, _uploadMap);
        
        if (_returned == 1)
        {
            upload_in_progress = true;
            upload_code = ds_map_find_value(_uploadMap, "status_code");
            upload_status = ds_map_find_value(_uploadMap, "status_string");
            upload_processed = max(ds_map_find_value(_uploadMap, "bytes_processed"), upload_processed);
            upload_total = max(ds_map_find_value(_uploadMap, "bytes_total"), upload_total);
            
            if (upload_code == 5)
            {
                upload_committing = true;
                upload_invalid_count++;
                
                if (upload_invalid_count > upload_invalid_count_max)
                {
                    status = UnknownEnum.Value_12;
                    error_string = "Notice: Steam stopped replying, unable to find status.";
                }
            }
            
            if (upload_committing == true && upload_code == 0)
            {
                upload_finished = true;
                upload_in_progress = false;
                status = UnknownEnum.Value_11;
            }
            
            if (upload_code == 0 && status == UnknownEnum.Value_10 && string_lower(upload_status) == "invalid")
            {
                status = UnknownEnum.Value_12;
                error_string = "Steam returned invalid during upload. Maybe Steam Cloud storage is full or mod/icon is too big?";
            }
        }
        else
        {
            status = UnknownEnum.Value_12;
            error_string = "Warning: Problem getting progress from Steam. (may still have uploaded)";
        }
        
        ds_map_destroy(_uploadMap);
        break;
    
    case UnknownEnum.Value_9:
        status = UnknownEnum.Value_10;
        break;
}

var _show_button_1 = false;
var _show_button_2 = false;
var _s_val_1 = status + 1;
var _s_val_2 = 12;
var _status_string = "[VALUE1] of [VALUE2]";
_status_string = string_replace(_status_string, "[VALUE1]", _s_val_1);
_status_string = string_replace(_status_string, "[VALUE2]", _s_val_2);
var _val_1 = upload_processed;
var _val_2 = upload_total;
var _progress_string = "[VALUE1] of [VALUE2]";
_progress_string = string_replace(_progress_string, "[VALUE1]", _val_1);
_progress_string = string_replace(_progress_string, "[VALUE2]", _val_2);
var _use_upload_dec = 0;

if (status == UnknownEnum.Value_10 || status == UnknownEnum.Value_11)
{
    if (upload_total > 0)
        _use_upload_dec = upload_processed / upload_total;
}
else if (status == UnknownEnum.Value_12)
{
    _use_upload_dec = 0;
    _show_button_1 = true;
}
else if (status > UnknownEnum.Value_10)
{
    _use_upload_dec = 1;
}

var _final_string = "";

if (status == UnknownEnum.Value_11)
{
    upload_status = "Done";
    _use_upload_dec = 1;
    upload_processed = upload_total;
    _show_button_1 = true;
    
    if (error_string == "")
    {
        _final_string = "Mod successfully uploaded to Steamworks.";
        _show_button_2 = true;
    }
}

uiGetData().ugc_upload_status = 
{
    in_progress: true,
    status: _s_val_1,
    status_count: _s_val_2,
    status_of: _status_string,
    status_string: display_text[status],
    mod_name: folder,
    workshop_id: workshop_id,
    upload_started: upload_started,
    upload_in_progress: upload_in_progress,
    upload_finished: upload_finished,
    upload_status: upload_status,
    upload_dec: _use_upload_dec,
    upload_processed: upload_processed,
    upload_total: upload_total,
    upload_progress_string: _progress_string,
    error_string: error_string,
    final_string: _final_string,
    show_button_1: _show_button_1,
    show_button_2: _show_button_2
};

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12
}
