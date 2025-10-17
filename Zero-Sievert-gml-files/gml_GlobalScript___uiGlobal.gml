function __uiGlobal()
{
    static _struct = 
    {
        __catspeakEnv: undefined,
        __dataStruct: {},
        __currentOnion: undefined,
        __currentOnionLayer: undefined,
        __currentOnionLayerStruct: undefined,
        __defaultOnion: undefined,
        __rootElementArray: [],
        __fileDirectory: "",
        __fileDict: {},
        __fileArray: [],
        __surfaceArray: [],
        __rootStack: [undefined],
        __contextStack: [undefined],
        __createReplaceTarget: undefined,
        __createHijack: undefined,
        __currentFunction: undefined,
        __currentCallback: undefined,
        __currentCallbackScope: undefined,
        __currentCallbackParam0: undefined,
        __currentCallbackParam1: undefined,
        __nullCallback: undefined,
        __debug: 
        {
            __showPointer: false,
            __showSkeleton: false,
            __relaxedSprites: false,
            __showNavigationGraph: false,
            __showFreeNav: false
        }
    };
    
    __uiInit();
    return _struct;
}
