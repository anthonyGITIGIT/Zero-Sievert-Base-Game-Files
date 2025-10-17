function player_meeting(arg0, arg1, arg2 = 0)
{
    var _player = player_get(arg2);
    return instance_exists(_player) ? place_meeting(arg0, arg1, _player) : false;
}
