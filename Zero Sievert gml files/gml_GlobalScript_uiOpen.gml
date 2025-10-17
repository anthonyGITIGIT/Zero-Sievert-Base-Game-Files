function uiOpen(arg0 = uiClassBox)
{
    var _box = uiCreate(arg0);
    uiOpenExisting(_box);
    return _box;
}
