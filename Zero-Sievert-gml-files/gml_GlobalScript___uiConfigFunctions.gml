if (script_execute_ext(min, [2, 1]) == 2)
{
    uiAddFunction("Min", function(arg0, arg1)
    {
        return min(arg0, arg1);
    });
    uiAddFunction("Max", function(arg0, arg1)
    {
        return max(arg0, arg1);
    });
    uiAddFunction("Clamp", function(arg0, arg1, arg2)
    {
        return clamp(arg0, arg1, arg2);
    });
    uiAddFunction("Lerp", function(arg0, arg1, arg2)
    {
        return lerp(arg0, arg1, arg2);
    });
    uiAddFunction("Clamp", function(arg0, arg1, arg2)
    {
        return clamp(arg0, arg1, arg2);
    });
    uiAddFunction("Lerp", function(arg0, arg1, arg2)
    {
        return lerp(arg0, arg1, arg2);
    });
    uiAddFunction("DrawSprite", function(arg0, arg1, arg2, arg3)
    {
        draw_sprite(arg0, arg1, arg2, arg3);
    });
    uiAddFunction("DrawSpriteExt", function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    {
        draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    });
    uiAddFunction("DrawSpriteStretched", function(arg0, arg1, arg2, arg3, arg4, arg5)
    {
        draw_sprite_stretched(arg0, arg1, arg2, arg3, arg4, arg5);
    });
    uiAddFunction("DrawSpriteStretchedExt", function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    {
        draw_sprite_stretched_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    });
}
else
{
    uiAddNativeFunction(min, "Min");
    uiAddNativeFunction(max, "Max");
    uiAddNativeFunction(clamp, "Clamp");
    uiAddNativeFunction(lerp, "Lerp");
}

uiAddNativeFunction(floor, "Floor");
uiAddNativeFunction(ceil, "Ceil");
uiAddNativeFunction(round, "Round");
uiAddNativeFunction(abs, "Abs");
uiAddNativeFunction(sign, "Sign");
uiAddNativeFunction(string, "String");
uiAddNativeFunction(is_struct, "IsStruct");
uiAddNativeFunction(is_array, "IsArray");
uiAddNativeFunction(is_string, "IsString");
uiAddNativeFunction(is_numeric, "IsNumeric");
uiAddNativeFunction(array_length, "ArrayLength");
uiAddNativeFunction(array_push, "ArrayPush");
uiAddNativeFunction(array_pop, "ArrayPop");
uiAddNativeFunction(array_insert, "ArrayInsert");
uiAddNativeFunction(array_delete, "ArrayDelete");
uiAddNativeFunction(draw_rectangle, "DrawRectangle");
uiAddNativeFunction(draw_circle, "DrawCircle");
uiAddNativeFunction(draw_text, "DrawText");
uiAddNativeFunction(draw_text_ext, "DrawTextExt");
uiAddFunction("FileExists", function(arg0)
{
    static _global = __uiGlobal();
    
    return file_exists(_global.__fileDirectory + arg0);
});
