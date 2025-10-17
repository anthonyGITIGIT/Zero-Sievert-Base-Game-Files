global.database_alias = undefined;
global.database_current = undefined;
global.database_data_root = undefined;
global.database_array = [];
global.database_struct = {};
global.database_cloud_conflict = 0;
global.database_was_previously_using_cloud_saves = undefined;

if (!extension_exists("Steamworks"))
    trace_error("Steamworks extension missing");

if (!steam_initialised() && 1)
    trace_error("Steam not running");

__db_trace("steam_is_cloud_enabled_for_app() = ", steam_is_cloud_enabled_for_app());
__db_trace("steam_is_cloud_enabled_for_account() = ", steam_is_cloud_enabled_for_account());
__db_trace("steam_get_quota_total() = ", steam_get_quota_total());
__db_trace("steam_get_quota_free() = ", steam_get_quota_free());
global.database_savedata_root = steam_initialised() ? (string(steam_get_user_account_id()) + "/") : "offline/";
trace("DB: Set savedata root as ", global.database_savedata_root);
directory_create(global.database_savedata_root);
directory_create(global.database_savedata_root + "backup");
