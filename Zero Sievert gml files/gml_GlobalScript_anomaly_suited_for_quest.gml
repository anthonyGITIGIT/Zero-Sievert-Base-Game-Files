function anomaly_suited_for_quest(arg0)
{
    if (!instance_exists(arg0))
        return -4;
    
    if (instance_exists(arg0))
    {
        if (area == UnknownEnum.Value_6)
        {
            var _arr = [];
            
            with (arg0)
                array_push(_arr, id);
            
            for (var i = 0; i < array_length(_arr); i++)
            {
                var _id = _arr[i];
                
                if (_id.x >= 3824 && _id.x < 4688 && _id.y >= 432 && _id.y <= 944)
                    continue;
                
                return _id;
            }
        }
    }
    
    return -4;
}

enum UnknownEnum
{
    Value_6 = 6
}
