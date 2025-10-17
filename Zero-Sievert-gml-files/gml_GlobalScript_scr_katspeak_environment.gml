function KatspeakForeignInterface() constructor
{
    static get = function(arg0)
    {
        if (variable_struct_exists(banList, arg0))
            return undefined;
        
        if (variable_struct_exists(database, arg0))
            return variable_struct_get(database, arg0);
        
        return undefined;
    };
    
    static isDynamicConstant = function(arg0)
    {
        if (variable_struct_get(databaseDynConst, arg0) ?? false)
            return true;
        
        return false;
    };
    
    static exists = function(arg0)
    {
        if (variable_struct_exists(banList, arg0))
            return false;
        
        if (variable_struct_exists(database, arg0) || variable_struct_exists(databaseDynConst, arg0))
            return true;
        
        return false;
    };
    
    static addBanList = function()
    {
        var banList_ = banList;
        
        for (var i = 0; i < argument_count; i += 1)
        {
            var ban = argument[i];
            __katspeak_check_arg("ban", ban, is_string);
            variable_struct_set(banList_, ban, true);
        }
    };
    
    static addPardonList = function()
    {
        var banList_ = banList;
        
        for (var i = 0; i < argument_count; i += 1)
        {
            var pardon = argument[i];
            __katspeak_check_arg("pardon", pardon, is_string);
            
            if (variable_struct_exists(banList_, pardon))
                variable_struct_remove(banList_, pardon);
        }
    };
    
    static exposeConstant = function()
    {
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i + 0];
            var value = argument[i + 1];
            __katspeak_check_arg("name", name, is_string);
            variable_struct_set(database, name, value);
        }
    };
    
    static exposeDynamicConstant = function()
    {
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i + 0];
            var func = argument[i + 1];
            __katspeak_check_arg("name", name, is_string);
            func = is_method(func) ? func : method(undefined, func);
            variable_struct_set(database, name, func);
            variable_struct_set(databaseDynConst, name, true);
        }
    };
    
    static exposeFunction = function()
    {
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i + 0];
            var func = argument[i + 1];
            __katspeak_check_arg("name", name, is_string);
            func = is_method(func) ? method_get_index(func) : func;
            variable_struct_set(database, name, method(undefined, func));
        }
    };
    
    static exposeFunctionByPrefix = function()
    {
        for (var i = 0; i < argument_count; i += 1)
        {
            var namespace = argument[i];
            __katspeak_check_arg("namespace", namespace, is_string);
            var database_ = database;
            
            if (!string_starts_with(namespace, "<unknown>") && !string_starts_with(namespace, "@@") && !string_starts_with(namespace, "$") && !string_starts_with(namespace, "YoYo") && !string_starts_with(namespace, "yy") && !string_starts_with(namespace, "[[") && !string_starts_with(namespace, "__"))
            {
                for (var builtinID = 0; builtinID < 10000; builtinID += 1)
                {
                    var name = script_get_name(builtinID);
                    
                    if (string_starts_with(name, namespace))
                        variable_struct_set(database_, name, method(undefined, builtinID));
                }
            }
            
            for (var scriptID = 100001; script_exists(scriptID); scriptID += 1)
            {
                var name = script_get_name(scriptID);
                
                if (string_starts_with(name, "anon") || string_count("gml_GlobalScript", name) > 0 || string_count("__struct__", name) > 0)
                    continue;
                
                if (string_starts_with(name, namespace))
                    variable_struct_set(database_, name, method(undefined, scriptID));
            }
        }
    };
    
    static exposeMethod = function()
    {
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i + 0];
            var func = argument[i + 1];
            __katspeak_check_arg("name", name, is_string);
            func = is_method(func) ? func : method(undefined, func);
            variable_struct_set(database, name, func);
        }
    };
    
    static exposeAsset = function()
    {
        for (var i = 0; i < argument_count; i += 1)
        {
            var name = argument[i];
            __katspeak_check_arg("name", name, is_string);
            var value = asset_get_index(name);
            var type = asset_get_type(name);
            
            if (value == -1)
                __katspeak_error("invalid GMAsset: got '", value, "' from '", name, "'");
            
            if (type == 5)
            {
                value = method(undefined, value);
                exit;
            }
            
            variable_struct_set(database, name, value);
        }
    };
    
    static exposeAssetByTag = function()
    {
        for (var i = 0; i < argument_count; i += 1)
        {
            var assets = tag_get_assets(argument[i]);
            var j = array_length(assets) - 1;
            
            while (j >= 0)
            {
                exposeAsset(assets[j]);
                j -= 1;
            }
        }
    };
    
    self.database = {};
    self.databaseDynConst = {};
    self.banList = {};
}

function KatspeakEnvironment() constructor
{
    static enableSharedGlobal = function(arg0 = true)
    {
        __katspeak_check_arg("enabled", arg0, is_numeric);
        sharedGlobal = arg0 ? {} : undefined;
        return sharedGlobal;
    };
    
    static applyPreset = function()
    {
        for (var i = 0; i < argument_count; i += 1)
        {
            var presetFunc = __katspeak_preset_get(argument[i]);
            presetFunc(getInterface());
        }
    };
    
    static getInterface = function()
    {
        interface ??= new KatspeakForeignInterface();
        return interface;
    };
    
    static tokenise = function(arg0, arg1 = undefined, arg2 = undefined)
    {
        __katspeak_check_arg("buff", arg0, buffer_exists);
        __katspeak_check_arg_optional("offset", arg1, is_numeric);
        __katspeak_check_arg_optional("size", arg2, is_numeric);
        return new lexerType(arg0, arg1, arg2, keywords);
    };
    
    static parse = function(arg0, arg1 = undefined, arg2 = undefined)
    {
        __katspeak_check_arg("buff", arg0, buffer_exists);
        __katspeak_check_arg_optional("offset", arg1, is_numeric);
        __katspeak_check_arg_optional("size", arg2, is_numeric);
        var lexer = tokenise(arg0, arg1, arg2);
        var builder = new KatspeakIRBuilder();
        var parser = new parserType(lexer, builder);
        var moreToParse;
        
        do
            moreToParse = parser.update();
        until (!moreToParse);
        
        return builder.get();
    };
    
    static parseString = function(arg0)
    {
        __katspeak_check_arg("src", arg0, is_string);
        var buff = __katspeak_create_buffer_from_string(arg0);
        var result = parse(buff);
        buffer_delete(buff);
        return result;
    };
    
    static parseAsync = function(arg0, arg1 = undefined, arg2 = undefined)
    {
        __katspeak_error_unimplemented("async-parsing");
    };
    
    static compile = function(arg0)
    {
        __katspeak_check_arg("ir", arg0, is_struct);
        var compiler = new codegenType(arg0, interface);
        var result;
        
        do
            result = compiler.update();
        until (result != undefined);
        
        if (sharedGlobal != undefined)
            result.setGlobals(sharedGlobal);
        
        return result;
    };
    
    static compileGML = compile;
    
    static renameKeyword = function()
    {
        keywords ??= __katspeak_keywords_create();
        var keywords_ = keywords;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var currentName = argument[i];
            var newName = argument[i + 1];
            __katspeak_check_arg("currentName", currentName, is_string);
            __katspeak_check_arg("newName", newName, is_string);
            __katspeak_keywords_rename(keywords, currentName, newName);
        }
    };
    
    static addKeyword = function()
    {
        keywords ??= __katspeak_keywords_create();
        var keywords_ = keywords;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i];
            var token = argument[i + 1];
            __katspeak_check_arg("name", name, is_string);
            variable_struct_set(keywords_, name, token);
        }
    };
    
    static removeKeyword = function()
    {
        keywords ??= __katspeak_keywords_create();
        var keywords_ = keywords;
        
        for (var i = 0; i < argument_count; i += 2)
        {
            var name = argument[i];
            __katspeak_check_arg("name", name, is_string);
            
            if (variable_struct_exists(keywords_, name))
                variable_struct_remove(keywords_, name);
        }
    };
    
    static addConstant = function()
    {
        var interface_ = getInterface();
        
        for (var i = 0; i < argument_count; i += 2)
            interface_.exposeConstant(argument[i + 0], argument[i + 1]);
    };
    
    static addMethod = function()
    {
        var interface_ = getInterface();
        
        for (var i = 0; i < argument_count; i += 2)
            interface_.exposeMethod(argument[i + 0], argument[i + 1]);
    };
    
    static addFunction = function()
    {
        var interface_ = getInterface();
        
        for (var i = 0; i < argument_count; i += 2)
            interface_.exposeFunction(argument[i + 0], argument[i + 1]);
    };
    
    static __removeInterface = function()
    {
        var interface_ = getInterface();
        
        for (var i = 0; i < argument_count; i += 1)
            interface_.addBanList([argument[i]]);
    };
    
    static removeConstant = __removeInterface;
    static removeFunction = __removeInterface;
    
    self.keywords = undefined;
    self.interface = new KatspeakForeignInterface();
    self.sharedGlobal = undefined;
    self.lexerType = KatspeakLexer;
    self.parserType = KatspeakParser;
    self.codegenType = KatspeakGMLCompiler;
}

function katspeak_special_to_struct(arg0)
{
    if (is_struct(arg0))
        return arg0;
    
    if (arg0 == global)
    {
        var getGlobal = method(global, function()
        {
            return self;
        });
        return getGlobal();
    }
    
    if (__katspeak_is_withable(arg0))
    {
        with (arg0)
            return self;
    }
    
    __katspeak_error_silent("could not convert special GML value '", arg0, "' ", "into a valid Katspeak representation");
    return undefined;
}

function katspeak_execute(arg0)
{
    static args = [];
    
    for (var i = argument_count; i >= 1; i -= 1)
        args[i - 1] = argument[i];
    
    return katspeak_execute_ext(arg0, self, args, 0, argument_count - 1);
}

function katspeak_execute_ext(arg0, arg1, arg2 = undefined, arg3 = 0, arg4 = undefined)
{
    var result = undefined;
    var __selfPrev = global.__katspeakGmlSelf;
    var __otherPrev = global.__katspeakGmlOther;
    
    try
    {
        global.__katspeakGmlOther = __selfPrev;
        global.__katspeakGmlSelf = arg1;
        
        with (__selfPrev ?? other)
        {
            with (method_get_self(arg0) ?? arg1)
            {
                if (arg2 == undefined)
                {
                    result = script_execute(method_get_index(arg0));
                }
                else
                {
                    arg4 ??= array_length(arg2) - arg3;
                    result = script_execute_ext(method_get_index(arg0), arg2, arg3, arg4);
                }
            }
        }
    }
    finally
    {
        global.__katspeakGmlSelf = __selfPrev;
        global.__katspeakGmlOther = __otherPrev;
    }
    
    return result;
}

function katspeak_globals(arg0)
{
    if (is_katspeak(arg0))
    {
        if (method_get_index(arg0) == __katspeak_function_method__)
        {
        }
        else
        {
            return arg0.getGlobals();
        }
    }
    
    return undefined;
}

function katspeak_method(arg0, arg1)
{
    if (is_katspeak(arg1))
    {
        if (method_get_index(arg1) == __katspeak_function_method__)
        {
            var methodData = method_get_self(arg1);
            return method(
            {
                callee: methodData.callee,
                self_: arg0
            }, __katspeak_function_method__);
        }
        else
        {
            return method(
            {
                callee: arg1,
                self_: arg0
            }, __katspeak_function_method__);
        }
    }
    
    return method(arg0, arg1);
}

function __katspeak_function_method__()
{
    static args = [];
    
    for (var i = argument_count; i >= 0; i -= 1)
        args[i] = argument[i];
    
    return katspeak_execute_ext(callee, self_, args, 0, argument_count);
}

function __katspeak_init_engine()
{
    global.__katspeak__ = new KatspeakEnvironment();
}
