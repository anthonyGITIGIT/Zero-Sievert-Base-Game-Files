function scr_set_radiation_disk(arg0, arg1)
{
    var xx = x div 16;
    var yy = y div 16;
    radiation_at_center = arg0;
    number_of_disk = arg1;
    
    for (var i = 0; i < number_of_disk; i++)
        ds_grid_add_disk(obj_map_generator.grid_radiation, xx, yy, 12 div (number_of_disk - i), radiation_at_center / number_of_disk);
}
