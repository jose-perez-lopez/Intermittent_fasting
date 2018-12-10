using Toybox.System;
using Toybox.Lang;
using Toybox.Time.Gregorian;


class FastingScheduler{

	function isAllowedToEatNow(){
		var clockTime = System.getClockTime(); 
		return isAllowedToEatAtThisTime(clockTime);		
	}
	
	function isAllowedToEatAtThisTime(time){
		var startHour = Application.getApp().getProperty("startHour");
        var endHour = Application.getApp().getProperty("endHour");
        isThisHourWithinThisInterval(time, startHour,endHour);                     
	}

	function isThisHourWithinThisInterval(time, startHour, endHour ){
	 if(time.hour >= startHour && time.hour < endHour){
        	return true; 
        }else{
            return false; 
        }  	
	}
	
	(:test) 
	function isThisHourWithinThisInterval(){
		var optionsHourA = {
	    	:year   => 2000,
	    	:month  => 5,
	    	:day    => 16,
	    	:hour   => 6,    
	    	:minute => 01
		};
		var date = Gregorian.moment(optionsHourA);
		var oneHour = new Time.Duration(Gregorian.SECONDS_PER_HOUR);
		
		var minusOneHour = date.add(oneHour*-1);
		var plusOneHour  = date.add(oneHour);
		assert(isThisHourWithinThisInterval(date,minusOneHour,plusOneHour));
	
		
	}
}