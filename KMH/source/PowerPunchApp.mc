using Toybox.Application as App;

var table = [0, 0, 0];

class PowerPunchApp extends App.AppBase {
	
	var highScore = "HIGH_SCORE"; 
	
    //! onStart() is called on application start up
    function onStart() {
    	table = getProperty(highScore);
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    	setProperty(highScore, table);
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new MenuView(), new MenuInputDelegate() ];
    }

}