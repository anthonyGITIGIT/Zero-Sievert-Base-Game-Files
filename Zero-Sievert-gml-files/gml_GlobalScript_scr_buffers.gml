function buffer_save_callback(arg0, arg1, arg2, arg3 = true, arg4, arg5 = [])
{
    var _arguments = arg5;
    array_push(_arguments, ["buffer", arg0], ["directory", arg2], ["file", arg1], ["compression", arg3], ["callstack", debug_get_callstack()]);
    callback(function()
    {
        self.operation_started = false;
        self.async_pointer = undefined;
        self.success = false;
    }, function()
    {
        if (!self.operation_started)
        {
            self.operation_started = true;
            buffer_async_group_begin(self.directory);
            buffer_save_async(self.compression ? buffer_compress(self.buffer, 0, buffer_get_size(self.buffer)) : self.buffer, self.file, 0, buffer_get_size(self.buffer));
            self.async_pointer = buffer_async_group_end();
        }
        
        return false;
    }, arg4, false, _arguments);
}

function buffer_load_callback(arg0, arg1, arg2, arg3 = true, arg4 = undefined, arg5 = [])
{
    var _arguments = arg5;
    array_push(_arguments, ["buffer", arg0], ["directory", arg2], ["file", arg1], ["compression", arg3], ["callstack", debug_get_callstack()]);
    callback(function()
    {
        self.operation_started = false;
        self.async_pointer = undefined;
        self.success = false;
    }, function()
    {
        if (!self.operation_started)
        {
            self.operation_started = true;
            buffer_async_group_begin(self.directory);
            buffer_load_async(self.buffer, self.file, 0, -1);
            self.async_pointer = buffer_async_group_end();
        }
        
        return false;
    }, method(
    {
        _complete_func: arg4
    }, function(arg0)
    {
        var _buffer;
        
        if (arg0.compression)
            _buffer = buffer_decompress(arg0.buffer);
        else
            _buffer = arg0.buffer;
        
        if (!is_undefined(self._complete_func))
        {
            arg0.buffer = _buffer;
            method(
            {
                parent: arg0,
                _func: self._complete_func
            }, function()
            {
                var _func_to_use = self._func;
                log(parent.callstack);
                
                with (self.parent)
                    _func_to_use();
            })();
        }
        else
        {
            buffer_delete(arg0.buffer);
            arg0.buffer = _buffer;
        }
    }), false, _arguments);
}

function buffer_callback_async()
{
    if (ds_map_exists(async_load, "type"))
        exit;
    
    var _pointer_id = ds_map_find_value(async_load, "id");
    var _pointer_index = undefined;
    
    for (var i = 0; i < array_length(global.Callback_Data); i++)
    {
        if (global.Callback_Data[i].async_pointer == _pointer_id)
        {
            _pointer_index = i;
            break;
        }
    }
    
    if (_pointer_index == undefined)
        exit;
    
    if (ds_map_find_value(async_load, "status"))
    {
        with (global.Callback_Data[_pointer_index])
        {
            self.success = true;
            self.complete(self);
        }
    }
    else
    {
        with (global.Callback_Data[_pointer_index])
        {
            self.success = false;
            self.complete(self);
        }
    }
    
    array_delete(global.Callback_Data, _pointer_index, 1);
    return true;
}

function buffer_from_struct(arg0)
{
    var _buffer = buffer_create(1, buffer_grow, 1);
    buffer_write(_buffer, buffer_text, json_stringify(arg0));
    return _buffer;
}

function buffer_quf_buffer_free()
{
    buffer_delete(self.buffer);
}

function buffer_quf_buffer_create()
{
    return buffer_create(1, buffer_grow, 1);
}

function buffer_quf_buffer_to_struct()
{
    if (self.success)
    {
        buffer_seek(self.buffer, buffer_seek_start, 0);
        var _text = buffer_read(self.buffer, buffer_text);
        
        try
        {
            variable_global_set(self.struct, json_parse(_text));
        }
        catch (_error)
        {
            show_message(_error);
            show_message(_text);
        }
    }
    
    buffer_delete(self.buffer);
}
