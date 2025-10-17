if (is_in_raid())
{
    if (quest_is_active("bridge_to_zakov"))
    {
        instance_create_depth(x, y, 0, obj_extraction_point);
        minimap_add_extraction_marker(x, y);
    }
    
    instance_destroy();
}
