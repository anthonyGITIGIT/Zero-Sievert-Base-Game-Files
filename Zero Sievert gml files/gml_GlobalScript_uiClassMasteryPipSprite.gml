uiAddBoxType("UiMasteryPipSprite", uiClassMasteryPipSprite, false);

function uiClassMasteryPipSprite() : uiClassSprite() constructor
{
    level = 0;
    mastery = "";
    CallbackSetDraw(scr_draw_ui_mastery_pip);
}
