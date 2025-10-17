if (ds_map_find_value(async_load, "id") == http_news_request)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        if (ds_map_exists(async_load, "result"))
        {
            try
            {
                news_json = json_parse(ds_map_find_value(async_load, "result"));
            }
            catch (_e)
            {
            }
        }
    }
}
