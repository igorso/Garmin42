using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class MenuInputDelegate extends Ui.BehaviorDelegate
{
    function onTap(evt)
    {
    	Ui.pushView(new MeasureView(), new MeasureInputDelegate(), Ui.SLIDE_IMMEDIATE );
    }
    
    function onSwipe(evt)
    {
		Ui.switchToView( new HighScoreView(), new HighScoreInputDelegate(), Ui.SLIDE_IMMEDIATE );
    }
}

class MenuView extends Ui.View
{
    function onUpdate(dc)
    {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
	
		// Menu Messages
        var x = dc.getWidth() / 2;
        dc.drawText(x, 20, Gfx.FONT_MEDIUM, "Power Punch", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(x, 50, Gfx.FONT_SMALL, "This app measure your", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(x, 70, Gfx.FONT_SMALL, "   punch power", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(x, 110, Gfx.FONT_SMALL, " Tap to Start", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(x, 130, Gfx.FONT_SMALL, " Swipe to High Scores", Gfx.TEXT_JUSTIFY_CENTER);
    }
}

