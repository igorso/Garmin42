using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Timer as Timer;
using Toybox.System as Sys;
//using Toybox.Lang.String; as String;


class ResultInputDelegate extends Ui.BehaviorDelegate
{
    function onTap(evt)
    {
    	Ui.switchToView(new MenuView(), new MenuInputDelegate(), Ui.SLIDE_IMMEDIATE );
    }
}

class ResultView extends Ui.View {
	
	var timerR;
	var image;
	var message;
	var currentMsg;
	var currentMsgLength = 2;
	
	var cnLevel = 140; 
	var tgLevel = 130;
	var sgLevel = 120;
	var weakGuy = 0;

	var strenght = 2.0;

	var yOffset = 6; // yOffset to help printing both the messagex
                     // and the image on the screen

    function setPunchStrenght(pS) {
    	strenght = pS;
    	
    	if( strenght > table[0] ) {
    		table[2] = table[1];
    		table[1] = table[0];
    		table[0] = strenght;
    	} else if (strenght > table[1] ) {
    		table[2] = table[1];
    		table[1] = strenght;
    	} else {
    		table[2] = strenght;
    	}
    	
    }

    //! Load your resources here
    function onLayout(dc) {
        if(strenght > cnLevel) {
        	image = Ui.loadResource(Rez.Drawables.id_chuckNorris);	
        	message = "You're a punching God.";
        }
        else if(strenght > tgLevel) {
        	image = Ui.loadResource(Rez.Drawables.id_toughGuy);
        	message = "Such a Tough guy!";
        }
        else if(strenght > sgLevel) {
        	image = Ui.loadResource(Rez.Drawables.id_skinnyGuy);
        	message = "Not bad!";
        }
        else {
        	image = Ui.loadResource(Rez.Drawables.id_weakGuy);
        	message = "Is your dad home, kid?";
        }
        
        currentMsg = "";
        
        timerR = new Timer.Timer();
        timerR.start( method(:updateMessage), 100, true );
    }

	function updateMessage() {
		if(currentMsgLength != message.length()) {
			++currentMsgLength;
		}
		currentMsg = message.substring(0, currentMsgLength);
		Ui.requestUpdate();
	}
		
    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {

        var dcWidth = dc.getWidth();
        var dcHeight = dc.getHeight();

        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.clear();
        dc.drawText(dcWidth/2, 20, Gfx.FONT_MEDIUM, currentMsg, Gfx.TEXT_JUSTIFY_CENTER);    
        
        var imageWidth = image.getWidth();
        var imageHeight = image.getHeight();
        
        dc.drawBitmap((dcWidth - imageWidth) / 2, yOffset + (dcHeight - imageHeight) / 2, image);	
    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    	timerR.stop();
    }

}