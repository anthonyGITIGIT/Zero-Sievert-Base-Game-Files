if (!variable_global_exists("lootLockerSingleton"))
    global.lootLockerSingleton = self;

lootlocker_initialized = false;
data = {};
session_data = {};
event_user(0);
lootLockerMessagesHttpRequestId = -1;

message_update = function()
{
    var _url = lootlocker_api_url + "/game/v1/messages";
    var _return_map = ds_map_create();
    ds_map_add(_return_map, "Content-Type", "application/json");
    ds_map_add(_return_map, "x-session-token", data.session_token);
    lootLockerMessagesHttpRequestId = http_request(_url, "GET", _return_map, data);
};
