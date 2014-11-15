using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Activity as Act;
using Toybox.Application as App;
using Toybox.Timer as Timer;

var timer;
var count1 = 0;

var code = 1;
var avrSpeed = 10;

class MyView extends Ui.View
{

	function callback() {
		abc();
		Ui.requestUpdate();
	}
	
	function onLayout() {
		timer = new Timer.Timer();
		timer.start( method(:callback), 2000, true );
	}

	function abc() {
	    var value_picked = null;
		//var info = Act.getActivityInfo(); 
		
		if(Act.getActivityInfo().averageSpeed != null) {
			value_picked = Act.getActivityInfo().averageSpeed;
		}

		if(value_picked > 1.1 * avrSpeed) {
			code = 0;
		}
		else if(value_picked > 0.9 * avrSpeed) {
			code = 1;
		}
		else {
			code = 2;
		}
	}

    function onUpdate(dc)
    {        
        if(code == 0) {
        	dc.setColor( Gfx.COLOR_GREEN, Gfx.COLOR_GREEN );
        }
        if(code == 1) {
        	dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_WHITE );
        }
        if(code == 2) {
        	dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_RED );
        }
 		dc.clear();
 		
    }
}


