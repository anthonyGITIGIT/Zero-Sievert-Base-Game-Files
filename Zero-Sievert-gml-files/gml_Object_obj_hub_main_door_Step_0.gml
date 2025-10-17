open = player_nearest_distance(x, y - 16) < 64;

if (open)
{
    if (image_index < (image_number - 1))
    {
        image_speed = 1;
    }
    else
    {
        image_index = image_number - 1;
        image_speed = 0;
    }
}
else if (image_index > 1)
{
    image_speed = -1;
}
else
{
    image_index = 0;
    image_speed = 0;
}
