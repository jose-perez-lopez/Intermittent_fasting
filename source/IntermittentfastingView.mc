using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Time.Gregorian;
using Toybox.Application.Properties;

class IntermittentfastingView extends WatchUi.WatchFace {
	
	
	var fastingScheduler;

    function initialize() {
        WatchFace.initialize();
     	fastingScheduler = new FastingScheduler();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }
    
    // Update the view
    function onUpdate(dc) {
        var vTime = View.findDrawableById("TimeLabel");
        var vDate = View.findDrawableById("DateLabel");
          // Get and show the current time
        var clockTime = System.getClockTime();   
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        
        var dateInfo = Gregorian.info(Time.now(), Time.FORMAT_LONG);
        var dateString = Lang.format("$1$ $2$", [dateInfo.month, dateInfo.day]);
        
        
        if(fastingScheduler.isAllowedToEatNow()){
        	vTime.setColor(Graphics.COLOR_GREEN);
        }else{
            vTime.setColor(Graphics.COLOR_RED);
        }
        
        vTime.setText(timeString);
        vDate.setText(dateString);
        

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
       
    
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
        
    
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
      
    
    }
    
    

}
