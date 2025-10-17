function __uiFileEnsure(arg0)
{
    static _fileDict = __uiGlobal().__fileDict;
    
    var _struct = variable_struct_get(_fileDict, arg0);
    return is_struct(_struct) ? _struct : new __uiClassFile(arg0);
}
