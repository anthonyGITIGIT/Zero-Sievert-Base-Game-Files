function spr_sprite_downloader_fetch(arg0)
{
    trace("About to download a file from: ", arg0);
    
    with (obj_sprite_downloader)
    {
        var _next_id = array_length(data);
        var _ds = new downloaded_sprite(arg0, _next_id);
        data[_next_id] = _ds;
        var _result = http_get_file(arg0, _ds.full_path);
        
        if (_result <= 0)
        {
            trace("File url DID NOT WORK: ", _result);
            _ds.error = true;
        }
        else
        {
            trace("File url worked: ", _result);
            _ds.url_worked = true;
            _ds.async_id = _result;
        }
    }
}
