using Toybox.Application as App;
using Toybox.System;
using Toybox.Time.Gregorian as Calendar;

var highScoreStrenght;
var highScoreDate;

class PowerPunchApp extends App.AppBase {
	
	var highScore = "HIGH_SCORE";
	var highDate = "HIGH_DATE"; 
	
    //! onStart() is called on application start up
    function onStart() {
    	highScoreStrenght = getProperty(highScore);
    	if(highScoreStrenght == null) {
    		highScoreStrenght = [0, 0, 0];
    	}
    	highScoreDate = getProperty(highDate);
    	if(highScoreDate == null) {
        	var now = Time.now();
        	var info = Calendar.info(now, Time.FORMAT_LONG);
    		highScoreDate = [info, info, info];
    	}
    	// System.println(highScoreStrenght);
    	// System.println(highScoreDate);
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    	setProperty(highScore, highScoreStrenght);
    	setProperty(highDate, highScoreDate);
    	// System.print(highScore); System.println(highScoreStrenght);
    	// System.print(highDate);  System.println(highScoreDate);
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new MenuView(), new MenuInputDelegate() ];
    }

}