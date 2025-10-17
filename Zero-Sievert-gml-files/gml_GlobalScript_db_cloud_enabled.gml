function db_cloud_enabled()
{
    return true && steam_initialised() && steam_is_cloud_enabled_for_app() && steam_is_cloud_enabled_for_account();
}
