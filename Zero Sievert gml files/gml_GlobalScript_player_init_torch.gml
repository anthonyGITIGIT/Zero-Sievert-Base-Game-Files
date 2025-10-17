function player_init_torch()
{
    torch_on_general = false;
    torch_container_array = array_create(UnknownEnum.Value_17, undefined);
    var _i = 0;
    
    repeat (UnknownEnum.Value_17)
    {
        torch_container_array[_i] = new class_torch_container();
        _i++;
    }
}

enum UnknownEnum
{
    Value_17 = 17
}
