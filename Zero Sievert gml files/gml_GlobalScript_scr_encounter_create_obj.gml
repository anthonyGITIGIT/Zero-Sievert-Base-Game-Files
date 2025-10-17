function scr_encounter_create_obj(arg0, arg1, arg2, arg3, arg4)
{
    var xx = arg0;
    var yy = arg1;
    var o = arg2;
    var amount = arg3;
    var chase_player = arg4;
    
    repeat (amount)
    {
        if (chase_player == true)
        {
            var oo = instance_create_depth(xx, yy, 0, o);
            oo.alarm[6] = 2;
        }
        else
        {
            instance_create_depth(xx, yy, 0, o);
        }
    }
}
