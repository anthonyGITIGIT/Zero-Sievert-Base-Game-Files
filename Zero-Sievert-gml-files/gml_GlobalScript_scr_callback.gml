global.Callback_Data = [];

function callback(arg0, arg1, arg2, arg3 = false, arg4 = [])
{
    var _struct = {};
    
    with (_struct)
    {
        for (var i = 0; i < array_length(arg4); i++)
            variable_struct_set(self, array_get(array_get(arg4, i), 0), arg4[i][1]);
        
        if (arg3)
        {
            if (arg0 != undefined)
                method(self, arg0)();
        }
        else if (arg0 != undefined)
        {
            self.start = method(self, arg0);
            self.started = false;
        }
        
        self.step = method(self, arg1);
        
        if (arg2 != undefined)
            self.complete = arg2;
        else
            self.complete = undefined;
        
        self.async_allowed = arg3;
        array_push(global.Callback_Data, self);
    }
}

function callback_process()
{
    for (var i = 0; i < array_length(global.Callback_Data); i++)
    {
        with (global.Callback_Data[i])
        {
            if (self.async_allowed)
            {
                if (self.step())
                {
                    if (self.complete != undefined)
                        self.complete(self);
                    
                    array_delete(global.Callback_Data, i, 1);
                    i--;
                }
            }
            else
            {
                if (self.started)
                {
                    if (self.step())
                    {
                        if (self.complete != undefined)
                            self.complete(self);
                        
                        array_delete(global.Callback_Data, i, 1);
                    }
                }
                else
                {
                    if (self.start != undefined)
                        self.start();
                    
                    self.started = true;
                }
                
                exit;
            }
        }
    }
}
