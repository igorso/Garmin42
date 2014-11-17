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
		
		var date1 = highScoreDate[0];
		var date2 = highScoreDate[1];
		var date3 = highScoreDate[2];
        var dateStr1 = Lang.format("$1$:$2$ - $3$ $4$", [date1.hour, date1.min, date1.month, date1.day]);
        var dateStr2 = Lang.format("$1$:$2$ - $3$ $4$", [date2.hour, date2.min, date2.month, date2.day]);
        var dateStr3 = Lang.format("$1$:$2$ - $3$ $4$", [date3.hour, date3.min, date3.month, date3.day]);

		var score1 = Lang.format("1. $1$  $2$", [highScoreStrenght[0], dateStr1]);
		var score2 = Lang.format("2. $1$  $2$", [highScoreStrenght[1], dateStr2]);
		var score3 = Lang.format("3. $1$  $2$", [highScoreStrenght[2], dateStr3]);

        var x = dc.getWidth() / 2;
        dc.drawText(x, 20, Gfx.FONT_MEDIUM, "High Score", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(10, 50, Gfx.FONT_SMALL, score1, Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 80, Gfx.FONT_SMALL, score2, Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 110, Gfx.FONT_SMALL, score3, Gfx.TEXT_JUSTIFY_LEFT);
    }
}

