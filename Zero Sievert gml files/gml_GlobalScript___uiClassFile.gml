function __uiClassFile(arg0) constructor
{
    static _global = __uiGlobal();
    static _catspeakEnv = _global.__catspeakEnv;
    
    static toString = function()
    {
        return string(__path);
    };
    
    static __CheckForChanges = function()
    {
        var _fileHash = md5_file(__absolutePath);
        return __hash != _fileHash;
    };
    
    static __Load = function(arg0)
    {
        if (!arg0 && __hash != undefined)
            exit;
        
        var _totalTime = get_timer();
        __uiTrace("Loading ", "-1");
        var _timer = get_timer();
        var _buffer = buffer_load(__absolutePath);
        __uiTrace((get_timer() - _timer) / 1000, "ms read");
        var _oldHash = __hash;
        _timer = get_timer();
        __hash = md5_file(__absolutePath);
        __uiTrace((get_timer() - _timer) / 1000, "ms hash (", _oldHash, " -> ", __hash, ", forced=", arg0 ? "true" : "false", ")");
        
        try
        {
            _timer = get_timer();
            var _asg = _catspeakEnv.parse(_buffer);
            __uiTrace((get_timer() - _timer) / 1000, "ms Catspeak parse");
            _timer = get_timer();
            __function = _catspeakEnv.compileGML(_asg);
            __uiTrace((get_timer() - _timer) / 1000, "ms Catspeak compile");
        }
        catch (_error)
        {
            __uiTrace(_error);
            
            __function = function()
            {
            };
        }
        
        buffer_delete(_buffer);
        __uiTrace("Took ", (get_timer() - _totalTime) / 1000, "ms to preload ", "-1");
    };
    
    static __Execute = function(arg0)
    {
        __Load(false);
        var _timer = get_timer();
        var _result = undefined;
        var _oldFunction = _global.__currentFunction;
        _global.__currentFunction = __function;
        
        if (is_struct(arg0))
        {
            __function.setGlobals(arg0);
            __function.setSelf(arg0);
        }
        
        var _error = undefined;
        
        try
        {
            _result = __function();
        }
        catch (_error)
        {
            __uiTrace(_error);
        }
        
        if (is_struct(_result))
            _result.__fileOrigin = __path;
        else if (_error == undefined)
            __uiError("There was an error loading \"", __path, "\"\nIt did not return a valid UI struct");
        
        _global.__currentFunction = _oldFunction;
        __uiTrace("Took ", (get_timer() - _timer) / 1000, "ms to execute ", "-1", " (exc. any preload)");
        return _result;
    };
    
    variable_struct_set(_global.__fileDict, arg0, self);
    array_push(_global.__fileArray, self);
    __hash = undefined;
    __path = arg0;
    __absolutePath = _global.__fileDirectory + __path;
    __function = undefined;
    __uiTrace("Created file state for ", "-1", "          ", debug_get_callstack());
}
