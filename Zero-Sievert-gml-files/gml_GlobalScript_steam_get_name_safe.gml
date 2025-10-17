function steam_get_name_safe()
{
    if (steam_initialised() && steam_get_user_account_id() > 0)
        return steam_get_persona_name();
    else
        return "Unknown";
}
