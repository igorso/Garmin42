using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class KmInputDelegate extends Ui.BehaviorDelegate
{
    function onSwipe(evt)
    {
        if(SWIPE_UP == evt.getDirection())
        {
            km += 1;
        }
        else if(SWIPE_DOWN == evt.getDirection())
        {
        	if( km > 1 ) {
            	km -= 1;
            }
        }
        else if(SWIPE_LEFT == evt.getDirection())
        {
    		Ui.pushView(new TimeView(), new TimeInputDelegate(), Ui.SLIDE_IMMEDIATE );
        }
        
        Ui.requestUpdate();
    }
}

var km = 1;

class KmView extends Ui.View
{
    function onUpdate(dc)
    {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );

        var x = dc.getWidth() / 2;
        dc.drawText(x, 20, Gfx.FONT_MEDIUM, "km to run", Gfx.TEXT_JUSTIFY_CENTER);
		
		var kmString = Lang.format("$1$ km", [km]);
        var y = dc.getHeight() / 2;
        dc.drawText(x, y-10, Gfx.FONT_SMALL, "/\\", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(x, y+15, Gfx.FONT_LARGE, kmString, Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(x, y+40, Gfx.FONT_SMALL, "\\/", Gfx.TEXT_JUSTIFY_CENTER);
    }
}

