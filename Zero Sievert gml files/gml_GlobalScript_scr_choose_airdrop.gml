function scr_choose_airdrop()
{
    var _air_drop = -4;
    var _arr = [];
    
    repeat (25)
        array_push(_arr, obj_chest_air_drop_med);
    
    repeat (25)
        array_push(_arr, obj_chest_air_drop_supplies);
    
    repeat (25)
        array_push(_arr, obj_chest_air_drop_ammo);
    
    _air_drop = _arr[irandom(array_length(_arr) - 1)];
    return _air_drop;
}
