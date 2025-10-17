function CatspeakEnvironment() constructor
{
    static enableSharedGlobal = function(arg0 = true)
    {
        sharedGlobal = arg0 ? {} : undefined;
        return sharedGlobal;
    };
    
    static applyPreset = function()
    {
        for (var i = 0; i < argument_count; i += 1)
        {
            var presetFunc = __catspeak_preset_get(argument[i]);
            presetFunc(self);
        }
    };
    
    static tokenise = function(arg0, arg1 = undefined, arg2 = undefined)
    {
        return new CatspeakLexer(arg0, arg1, arg2, keywords);
    };
    
    static parse = function(arg0, arg1 = undefined, arg2 = undefined)
    {
        var lexer = tokenise(arg0, arg1, arg2);
        var builder = new CatspeakIRBuilder();
        var parser = new CatspeakParser(lexer, builder);
        var moreToParse;
        
        do
            moreToParse = parser.update();
        until (!moreToParse);
        
        return builder.get();
    };
    
    static parseString = function(arg0)
    {
        var buff = __catspeak_create_buffer_from_string(arg0);
        return global.Catspeak.parse(buff);
    };
    
    static parseAsync = function(arg0, arg1 = undefined, arg2 = undefined)
    {
        __catspeak_error_unimplemented("async-parsing");
    };
    
    static compileGML = function(arg0)
    {
        var compiler = new CatspeakGMLCompiler(arg0, interface);
        var result;
        
        do
            result = compiler.update();
        until (result != undefined);
        
        if (sharedGlobal != undefined)
            result.setGlobals(sharedGlobal);
        
        return result;
    };
    
    static renameKeyword = function()
    {
        keywords ??= __catspeak_keywords_create();
        var keywords_ = keywords;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var currentName = argument[i];
            var newName = argument[i + 1];
            __catspeak_keywords_rename(keywords, currentName, newName);
        }
    };
    
    static addKeyword = function()
    {
        keywords ??= __catspeak_keywords_create();
        var keywords_ = keywords;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i];
            var token = argument[i + 1];
            variable_struct_set(keywords_, name, token);
        }
    };
    
    static removeKeyword = function()
    {
        keywords ??= __catspeak_keywords_create();
        var keywords_ = keywords;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i];
            
            if (variable_struct_exists(keywords_, name))
                variable_struct_remove(keywords_, name);
        }
    };
    
    static addFunction = function()
    {
        interface ??= {};
        var interface_ = interface;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i];
            var func = argument[i + 1];
            func = is_method(func) ? func : method(undefined, func);
            variable_struct_set(interface_, name, func);
        }
    };
    
    static addGlobalFunction = function()
    {
        interface ??= {};
        var interface_ = interface;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i];
            var func = argument[i + 1];
            variable_struct_set(interface_, name, method(undefined, func));
        }
    };
    
    static removeFunction = function()
    {
        interface ??= {};
        var interface_ = interface;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i];
            
            if (variable_struct_exists(interface_, name) && is_method(variable_struct_get(interface_, name)))
                variable_struct_remove(interface_, name);
        }
    };
    
    static addConstant = function()
    {
        interface ??= {};
        var interface_ = interface;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i];
            var value = argument[i + 1];
            variable_struct_set(interface_, name, value);
        }
    };
    
    static removeConstant = function()
    {
        interface ??= {};
        var interface_ = interface;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i];
            
            if (variable_struct_exists(interface_, name))
                variable_struct_remove(interface_, name);
        }
    };
    
    self.keywords = undefined;
    self.interface = undefined;
    self.sharedGlobal = undefined;
}

function catspeak_special_to_struct(arg0)
{
    if (is_struct(arg0))
        return arg0;
    
    if (is_undefined(arg0))
        return undefined;
    
    if (arg0 == global)
    {
        var getGlobal = method(global, function()
        {
            return self;
        });
        return getGlobal();
    }
    
    if (__catspeak_is_withable(arg0))
    {
        with (arg0)
            return self;
    }
    
    __catspeak_error_silent("could not convert special GML value '", arg0, "' ", "into a valid Catspeak representation");
    return undefined;
}

function __catspeak_init_engine()
{
    global.Catspeak = new CatspeakEnvironment();
}
