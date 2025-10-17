__uiInit();

function __uiInit()
{
    static _initialized = false;
    
    if (_initialized)
        exit;
    
    _initialized = true;
    __uiTrace("Initializing UI (v", "1.0.12", "  ", "2023-08-24", ")");
    catspeak_force_init();
    var _global = __uiGlobal();
    _global.__nullCallback = new __uiClassCallback(undefined, undefined, false);
    _global.__currentCallback = _global.__nullCallback;
    _global.__catspeakEnv = global.Catspeak;
    _global.__defaultOnion = uiOnionCreate("master");
    __uiInitEnvironment();
    time_source_start(time_source_create(0, 1, 1, function()
    {
        __uiSurfaceCheckForOrphans();
    }, [], -1));
}
