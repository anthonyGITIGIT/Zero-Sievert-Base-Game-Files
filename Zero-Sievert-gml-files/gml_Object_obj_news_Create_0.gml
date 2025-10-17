http_news_request = http_get("http://api.steampowered.com/ISteamNews/GetNewsForApp/v0002/?appid=1782120&count=" + string(UiNewsCount()) + "&maxlength=0&format=json&feeds=steam_community_announcements");

news_get_recent = function()
{
    if (variable_struct_exists(news_json, "appnews"))
    {
        if (variable_struct_exists(struct_get_from_hash(news_json, variable_get_hash("appnews")), "newsitems"))
        {
            var _news_items = struct_get_from_hash(struct_get_from_hash(news_json, variable_get_hash("appnews")), variable_get_hash("newsitems"));
            return _news_items;
        }
    }
    
    return [];
};

alarm[0] = 1;
news_json = [];
