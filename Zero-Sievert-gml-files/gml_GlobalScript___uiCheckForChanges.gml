function __uiCheckForChanges()
{
    static _global = __uiGlobal();
    static _fileArray = __uiGlobal().__fileArray;
    static _rootArray = __uiGlobal().__rootElementArray;
    static _index = 0;
    static _inFocus = window_has_focus();
    static _lastCheck = -infinity;
    
    var _fileCount = array_length(_fileArray);
    
    if (_fileCount > 0)
    {
        var _repeats = 1;
        
        if (_inFocus != window_has_focus())
        {
            _inFocus = window_has_focus();
            
            if (window_has_focus())
            {
                __uiTrace("Window back in focus, refreshing all files");
                _repeats = _fileCount;
                _lastCheck = -infinity;
            }
        }
        
        if ((current_time - _lastCheck) > (_inFocus ? 500 : 16))
        {
            _lastCheck = current_time;
            var _changedFilesArray = [];
            
            repeat (_repeats)
            {
                _index = (_index + 1) % _fileCount;
                var _fileStruct = _fileArray[_index];
                
                if (_fileStruct.__CheckForChanges())
                    array_push(_changedFilesArray, _fileStruct);
            }
            
            var _changedCount = array_length(_changedFilesArray);
            
            if (_changedCount <= 0)
            {
                var _i = 0;
                
                repeat (array_length(_rootArray))
                {
                    if (weak_ref_alive(_rootArray[_i]))
                        _i++;
                    else
                        array_delete(_rootArray, _i, 1);
                }
            }
            else
            {
                __uiTrace("Changes detected in ", _changedFilesArray);
                var _i = 0;
                
                repeat (_changedCount)
                {
                    var _fileStruct = _changedFilesArray[_i];
                    _fileStruct.__Load(true);
                    _changedFilesArray[_i] = _fileStruct.__path;
                    _i++;
                }
                
                __uiTrace("Paths are ", _changedFilesArray);
                var _changedUIArray = [];
                _i = 0;
                
                repeat (array_length(_rootArray))
                {
                    if (weak_ref_alive(_rootArray[_i]))
                    {
                        _rootArray[_i].ref.__FileOriginSearch(_changedFilesArray, _changedUIArray);
                        _i++;
                    }
                    else
                    {
                        array_delete(_rootArray, _i, 1);
                    }
                }
                
                __uiTrace("Changed UI elements are ", _changedUIArray);
                _i = 0;
                
                repeat (array_length(_changedUIArray))
                {
                    with (_changedUIArray[_i])
                        ReplaceFromFile(__fileOrigin);
                    
                    _i++;
                }
            }
        }
    }
}
