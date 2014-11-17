using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Sensor as Snsr;

class MeasureInputDelegate extends Ui.BehaviorDelegate
{
}

class MeasureView extends Ui.View
{
	var punchString;	// take the punch power as string
	var counter;		// will count 3 seconds to measure the punch
	var timer;			// updates the callback every second
	
    //! Constructor
    function initialize()
    {
    	counter = 3;
    	punchString = "0";
    	
    	// Heart Rate was used as impact sensor
        Snsr.setEnabledSensors( [Snsr.SENSOR_HEARTRATE] );
        Snsr.enableSensorEvents( method(:onSnsr) );
    }
    
    // Converts sampling to punch power
    function onSnsr(sensor_info)
    {
        var HR = sensor_info.heartRate;
        var bucket;
        if( sensor_info.heartRate != null )
        {
            punchString = HR.toString();
        }
        else
        {
            punchString = "0";
        }
    }
    
    function callback()
    {
        counter -= 1;
        if(counter == 0) {
        	var resultView = new ResultView();
        	
        	// Send the measured power punch to another view
        	resultView.setPunchStrenght(punchString.toNumber());
        	
        	// Release the sensors
        	Snsr.enableSensorEvents(null);
        	Snsr.setEnabledSensors([]);
        	
    		Ui.switchToView(resultView, new ResultInputDelegate(), Ui.SLIDE_IMMEDIATE );	
    	}
        Ui.requestUpdate();
    }
    
    function onLayout(dc)
    {
        timer = new Timer.Timer();

        timer.start( method(:callback), 1000, true );
    }

    function onUpdate(dc)
    {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );

        var x = dc.getWidth() / 2;
        dc.drawText(x, 30, Gfx.FONT_LARGE, "PUNCH NOW!", Gfx.TEXT_JUSTIFY_CENTER);
		
		var timePunch = Lang.format("$1$", [counter]);
        var y = dc.getHeight() / 2;
        dc.drawText(x, y+15, Gfx.FONT_LARGE, timePunch, Gfx.TEXT_JUSTIFY_CENTER);
        
        // Just to see if HR can be used to simulate punch power
        dc.drawText(x, y+45, Gfx.FONT_LARGE, punchString, Gfx.TEXT_JUSTIFY_CENTER);
    }
    
    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    	timer.stop();
    }
}

