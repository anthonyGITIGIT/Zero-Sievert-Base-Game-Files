if (!db_read_ext("shared settings", "Game analytics", "collect_data", false) || true)
    exit;

if (!lootlocker_initialized)
    exit;

steamStatus = ds_map_find_value(async_load, "result");

if (steamStatus == 1)
{
    evType = ds_map_find_value(async_load, "event_type");
    
    if (evType == "ticket_response")
    {
        auth_ticket_handle = ds_map_find_value(async_load, "auth_ticket_handle");
        ticketString = "";
        
        for (var i = 0; i < buffer_get_size(ticketMapID); i++)
            ticketString += dec_to_hex(buffer_read(ticketMapID, buffer_u8), 2);
        
        var url = lootlocker_api_url + "/game/v1/player/verify";
        var _return_map = ds_map_create();
        ds_map_add(_return_map, "Content-Type", "application/json");
        var data = "{\"key\": \"" + lootlocker_game_key + "\", \"platform\": \"steam\",\"token\": \"" + ticketString + "\"}";
        lootLockerVerifySteamPlayerHttpRequestId = http_request(url, "POST", _return_map, data);
        trace("LootLocker >> Attempting to verify the player...");
    }
}
else
{
    trace("LootLocker >> Steam call failed, error: " + string(steamStatus));
    trace("LootLocker >> Retrying in 3 seconds");
    alarm[0] = 0;
}
