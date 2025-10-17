function ga_initialize(arg0, arg1)
{
    var GA_VERSION = "gamemaker 3.1.0";
    configureSdkGameEngineVersion_windows(GA_VERSION);
    native_ga_initialize_windows(arg0, arg1);
}
