using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class TimeInputDelegate extends Ui.BehaviorDelegate
{
    function onSwipe(evt)
    {
        if(SWIPE_UP == evt.getDirection())
        {
            min += 1;
        }
        
        if(SWIPE_DOWN == evt.getDirection())
        {
        	if( km > 1 ) {
            	min -= 1;
            }
        }
        
        Ui.requestUpdate();
    }
}

var min = 1;

class TimeView extends Ui.View
{
    function onUpdate(dc)
    {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );

        var x = dc.getWidth() / 2;
        dc.drawText(x, 20, Gfx.FONT_MEDIUM, "running time", Gfx.TEXT_JUSTIFY_CENTER);
		
		var kmString = Lang.format("$1$ min", [min]);
        var y = dc.getHeight() / 2;
        dc.drawText(x, y-10, Gfx.FONT_SMALL, "/\\", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(x, y+15, Gfx.FONT_LARGE, kmString, Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(x, y+40, Gfx.FONT_SMALL, "\\/", Gfx.TEXT_JUSTIFY_CENTER);
    }
}

