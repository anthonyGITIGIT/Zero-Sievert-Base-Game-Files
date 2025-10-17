if (!db_read_ext("shared settings", "Game analytics", "collect_data", false) || true)
    exit;

if (!lootlocker_initialized)
    exit;

asyncStatus = ds_map_find_value(async_load, "status");

if (asyncStatus == 0)
{
    asyncID = ds_map_find_value(async_load, "id");
    
    if (asyncID == lootLockerVerifySteamPlayerHttpRequestId)
    {
        var text = ds_map_find_value(async_load, "result");
        var statusCode = ds_map_find_value(async_load, "http_status");
        data = json_parse(text);
        
        if (statusCode != 200)
        {
            trace("LootLocker >> Steam Player could not be verified with LootLocker");
            trace(data);
            exit;
        }
        
        trace(data);
        var url = lootlocker_api_url + "/game/v2/session";
        var _return_map = ds_map_create();
        ds_map_add(_return_map, "Content-Type", "application/json");
        data = "{\"game_key\": \"" + lootlocker_game_key + "\", \"platform\": \"steam\",\"player_identifier\": \"" + string(steamID) + "\",\"game_version\":\"" + versionString + "\"}";
        lootLockerStartSteamSessionHttpRequestId = http_request(url, "POST", _return_map, data);
    }
    else if (asyncID == lootLockerStartSteamSessionHttpRequestId)
    {
        var statusCode = ds_map_find_value(async_load, "http_status");
        var text = ds_map_find_value(async_load, "result");
        data = json_parse(text);
        
        if (statusCode != 200)
        {
            trace("LootLocker >> Steam Session could not be started with LootLocker, error: " + text);
            trace(data);
            exit;
        }
        
        trace("LootLocker >> Steam Session successfully started with LootLocker");
        trace("LootLocker >> Getting messages");
        trace(data);
        var url = lootlocker_api_url + "/game/v1/messages";
        var _return_map = ds_map_create();
        ds_map_add(_return_map, "Content-Type", "application/json");
        ds_map_add(_return_map, "x-session-token", data.session_token);
        lootLockerMessageHttpRequestId = http_request(url, "GET", _return_map, data);
    }
    else if (asyncID == lootLockerMessageHttpRequestId)
    {
        var text = ds_map_find_value(async_load, "result");
        var statusCode = ds_map_find_value(async_load, "http_status");
        data = json_parse(text);
        
        if (statusCode != 200)
        {
            trace("LootLocker >> Messages could not be retrieved");
            trace(data);
            exit;
        }
        
        data = json_parse(text);
        trace("LootLocker >> Messages received");
        trace(data);
        trace(data.messages[array_length(data.messages) - 1].body);
    }
}
else if (asyncStatus < 0)
{
    show_debug_message("LootLocker failed async, error: " + string(asyncStatus));
}
