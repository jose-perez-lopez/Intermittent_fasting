
using Toybox.System;
using Toybox.Lang;
using Toybox.Time.Gregorian;


class FastingSchedulerTest{
	(:test) 
	function isThisHourWithinThisIntervalTest(logger){
		var fs = new FastingScheduler();
		var optionsHourA = {
	    	:year   => 2000,
	    	:month  => 5,
	    	:day    => 16,
	    	:hour   => 6,    
	    	:minute => 01
		};
		var gDate = Gregorian.moment(optionsHourA);
		var date = Gregorian.info(gDate, Time.FORMAT_MEDIUM);		
		var oneHour = new Time.Duration(Gregorian.SECONDS_PER_HOUR);
		var minusOneHour = Gregorian.info(gDate.subtract(oneHour), Time.FORMAT_MEDIUM).hour;
		var plusOneHour  = Gregorian.info(gDate.add(oneHour), Time.FORMAT_MEDIUM).hour;
	
		System.println("*isThisHourWithinThisInterval*"+date.hour +"_"+minusOneHour+"_"+plusOneHour);
		var result = fs.isThisHourWithinThisInterval(date,minusOneHour,plusOneHour);
		return result; 
	}
	
	
}	