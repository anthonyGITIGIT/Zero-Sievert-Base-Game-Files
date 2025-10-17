function scr_choose_color_stat(arg0, arg1)
{
    var stat_to_check = arg0;
    var positive_is_green = arg1;
    var col = 16777215;
    
    if (positive_is_green == true)
    {
        if (stat_to_check > 0)
            col = 9688723;
        
        if (stat_to_check < 0)
            col = 5855724;
    }
    else
    {
        if (stat_to_check > 0)
            col = 5855724;
        
        if (stat_to_check < 0)
            col = 9688723;
    }
    
    return col;
}
