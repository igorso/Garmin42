using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Sensor as Snsr;

class HighScoreInputDelegate extends Ui.BehaviorDelegate
{
    function onTap(evt)
    {
    	Ui.switchToView(new MenuView(), new MenuInputDelegate(), Ui.SLIDE_IMMEDIATE );
    }
    
    function onSwipe(evt)
    {
    	Ui.switchToView(new MenuView(), new MenuInputDelegate(), Ui.SLIDE_IMMEDIATE );
    }
}

class HighScoreView extends Ui.View
{
    function onUpdate(dc)
    {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );

		var score1 = Lang.format("1. $1$", [table[0]]);
		var score2 = Lang.format("2. $1$", [table[1]]);
		var score3 = Lang.format("3. $1$", [table[2]]);

        var x = dc.getWidth() / 2;
        dc.drawText(x, 20, Gfx.FONT_MEDIUM, "High Score", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(10, 50, Gfx.FONT_SMALL, score1, Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 80, Gfx.FONT_SMALL, score2, Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 110, Gfx.FONT_SMALL, score3, Gfx.TEXT_JUSTIFY_LEFT);
    }
}

