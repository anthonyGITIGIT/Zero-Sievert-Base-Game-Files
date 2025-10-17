function pp_colour(arg0 = 1) constructor
{
    static update = function()
    {
        if (frame > 0)
        {
            frame--;
            value += amount_to_change;
            
            if (frame <= 0)
                value = goto_value;
        }
    };
    
    value = arg0;
    goto_value = value;
    amount_to_change = 0;
    frames = 1;
    frame = 0;
}
