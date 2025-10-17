function scr_setup_news()
{
    trace("Setting up news feed");
    instance_create_depth(0, 0, 0, obj_news);
}
