function player_init_laser()
{
    laser_on_general = false;
    laser_container_array = array_create(UnknownEnum.Value_17, undefined);
    var _i = 0;
    
    repeat (UnknownEnum.Value_17)
    {
        laser_container_array[_i] = new class_laser_container();
        _i++;
    }
}

enum UnknownEnum
{
    Value_17 = 17
}
