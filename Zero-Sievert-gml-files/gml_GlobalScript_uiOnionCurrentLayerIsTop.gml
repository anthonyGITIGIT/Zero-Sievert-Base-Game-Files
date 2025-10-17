function uiOnionCurrentLayerIsTop()
{
    static _global = __uiGlobal();
    
    return _global.__currentOnionLayer == _global.__currentOnion.GetTopLayer();
}
