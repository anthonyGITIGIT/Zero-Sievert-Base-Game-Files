uiAddBoxType("UiVideo", uiClassVideo, false);

function uiClassVideo() : __uiClassCommon() constructor
{
    queue_buffer_time = 1;
    queue_buffer_timer = 0;
    queue_video = 0;
    source = undefined;
    loop = true;
    color = 16777215;
    alpha = 1;
    backup_image = spr_videoreplacement_mainmenu;
    CallbackSetOnClose(function()
    {
        video_close();
    });
    CallbackSetDraw(function()
    {
        queue_buffer_timer = max(queue_buffer_timer - 1, 0);
        
        if (queue_video && queue_buffer_timer == 0)
        {
            video_open(source);
            video_enable_loop(loop);
            queue_video = false;
        }
        
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _video = video_draw();
        
        if (_video[0] == 0 && !global.is_steamdeck && surface_exists(_video[1]))
        {
            draw_surface_stretched_ext(_video[1], __drawLeft, __drawTop, __localRight - __localLeft, __localBottom - __localTop, _color, _alpha);
        }
        else
        {
            draw_sprite_stretched_ext(backup_image, 0, __drawLeft, __drawTop, __localRight - __localLeft, __localBottom - __localTop, _color, _alpha);
            video_close();
            
            if (!queue_video && _video[0] == -1 && !global.is_steamdeck)
            {
                queue_buffer_timer = queue_buffer_time;
                queue_video = true;
            }
        }
    });
}
