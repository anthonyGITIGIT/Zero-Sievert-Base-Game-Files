if (!db_read_ext("shared settings", "Game analytics", "collect_data", false) || true)
{
    steam_shutdown();
    exit;
}

if (auth_ticket_handle >= 0)
    steam_user_cancel_auth_ticket(auth_ticket_handle);

steam_shutdown();
