uiAddBoxType("UiMasteryPipButton", uiClassMasteryPipButton, false);

function uiClassMasteryPipButton() : uiClassSpriteButton() constructor
{
    level = 0;
    mastery = "";
    CallbackSetDraw(scr_draw_ui_mastery_pip);
}
