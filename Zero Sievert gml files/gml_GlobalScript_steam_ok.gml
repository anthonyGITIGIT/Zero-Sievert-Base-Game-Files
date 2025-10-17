function steam_ok()
{
    if (!os_is_network_connected(0))
    {
        return 
        {
            value: -1,
            error: "No Internet"
        };
    }
    
    if (!steam_initialised())
    {
        return 
        {
            value: -2,
            error: "Steam not active"
        };
    }
    
    if (!steam_is_user_logged_on())
    {
        return 
        {
            value: -3,
            error: "Steam not logged in"
        };
    }
    
    return 
    {
        value: true,
        error: ""
    };
}
