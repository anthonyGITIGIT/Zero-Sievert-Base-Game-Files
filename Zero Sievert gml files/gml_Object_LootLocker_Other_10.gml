if (!db_read_ext("shared settings", "Game analytics", "collect_data", false) || true)
    exit;

if (!os_is_network_connected() || !steam_initialised())
{
    alarm[0] = 0;
    trace("LootLocker >> Waiting 10 seconds and trying to connect again");
    exit;
}

lootlocker_initialized = true;
auth_ticket_handle = -1;
lootlocker_game_key = "dev_6acee8dbb84d4542adeab8a515339f56";
lootlocker_domain_key = "5tig2dju";
lootlocker_game_key = "prod_a4f775f5ada9444580d8a23844990754";
lootlocker_api_url = "https://" + lootlocker_domain_key + ".api.lootlocker.io";
lootlocker_session_token = "";
versionString = "0.0.0.1";
steamID = steam_get_user_steam_id();
trace("LootLocker >> Starting Steam Authentication");

if (steam_initialised())
    ticketMapID = steam_user_get_auth_session_ticket();
