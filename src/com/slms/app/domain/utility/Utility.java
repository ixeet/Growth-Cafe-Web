/**
 * 
 */
package  com.slms.app.domain.utility;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;


/**
 * @author Pradeep.Sharma
 * @since 03-12-2012
 * @version 1.0
 * Common Utilities supports re-usability code pattern
 */
public class Utility {

 public static  Properties getProperties(String fileName){
	 Properties props = new Properties();
	
	 try
	 {
		 java.net.URL url = Thread.currentThread().getContextClassLoader().getResource(fileName);
		 props.load(url.openStream());
	 }
	 catch (FileNotFoundException e)
	 {
		 e.printStackTrace();
	 }
	 catch (IOException e)
	 {
		 e.printStackTrace();
	 }
	 return props;
	 } 

/**
* getting time window array
* @author pradeep.sharma
* @since 04-02-2013
* @version 1.0
* @param departTime
* @param timeWindow
* @return
*/
 
public static String[] getTimeWindow(String departTime, String timeWindow){
		String[] timeWindowArray = new String[2];
		int intDepartTime = Integer.parseInt(departTime.substring(0, 2));
		int intTimeWindow = Integer.parseInt(timeWindow);
		int tempEndTm	  = 0;
		int tempStartTm	  = 0;
		String startTmWnd = "";
		String endTmWnd   = "";
		/**
		 * Start time Window
		 */
		if(intTimeWindow > intDepartTime){
			tempStartTm	= intDepartTime + intTimeWindow;
		}else{
			tempStartTm	= intDepartTime - intTimeWindow;
		}
		
		if(String.valueOf(tempStartTm).length()==1)
			startTmWnd = "0"+tempStartTm+"00";
		else
			startTmWnd = tempStartTm+"00";
		
		/**
		 * End time Window
		 */
		if(intDepartTime + intTimeWindow>24){
			tempEndTm	= intDepartTime + intTimeWindow-24;
		}else{
			tempEndTm	= intDepartTime + intTimeWindow;
		}
		if(String.valueOf(tempEndTm).length()==1)
			endTmWnd = "0"+tempEndTm+"00";
		else
			endTmWnd = tempEndTm+"00";
		
		timeWindowArray[0]=startTmWnd;
		timeWindowArray[1]=endTmWnd;
		
		return timeWindowArray;
	}

	public static boolean isValidDate(String inDate) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    try {
	      dateFormat.parse(inDate.trim());
	    } catch (Exception e) {
	      return false;
	    }
	    return true;
	  }
	
	
	 public static String getDisplayDate(String inStr) {
	        String outStr = inStr;
	        try {
	            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	            Date fechaNueva = format.parse(inStr);
	            SimpleDateFormat format2 = new SimpleDateFormat("MM/dd/yyyy");
	            outStr = format2.format(fechaNueva);
	           // System.out.println(outStr); // Prints 2013-10-10 10:49:29
	        } catch (Exception e) {
	            System.out.println("Exception # getDisplayDate - " +
	            		e.getMessage());
	        }
	        return outStr;
	    }
	 
	 
	 
	 
	 
	 
	 public static int timeDifference (String dateStart, String dateStop) {
		 
			dateStart = dateStart+" 00:00:00";
			dateStop = dateStop+" 00:00:00";
	 
			//HH converts hour in 24 hours format (0-23), day calculation
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			int days=0;
			Date d1 = null;
			Date d2 = null;
	 
			try {
				d1 = format.parse(dateStart);
				d2 = format.parse(dateStop);
	 
				//in milliseconds
				long diff = d2.getTime() - d1.getTime();
	 
				long diffSeconds = diff / 1000 % 60;
				long diffMinutes = diff / (60 * 1000) % 60;
				long diffHours = diff / (60 * 60 * 1000) % 24;
				long diffDays =  (diff / (24 * 60 * 60 * 1000));
				days =(int) diffDays;
 				//System.out.print(diffDays + " days, ");
				//System.out.print(diffHours + " hours, ");
				//System.out.print(diffMinutes + " minutes, ");
				//System.out.print(diffSeconds + " seconds.");
	 
			} catch (Exception e) {
				e.printStackTrace();
			}
			return days;
	 
		}
	 
	 
	 public static String getBeforeTime(String dateTime) {
		 
			//HH converts hour in 24 hours format (0-23), day calculation
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			int days=0;
			Date d1 = null;
			Date d2 = new Date();
			long diffMinutes=0;
			long diffHours=0;
			try {
				d1 = format.parse(dateTime);
	 
				//in milliseconds
				long diff = d2.getTime() - d1.getTime();
	 
				long diffSeconds = diff / 1000 % 60;
				diffMinutes = diff / (60 * 1000) % 60;
				diffHours = diff / (60 * 60 * 1000) % 24;
				long diffDays =  (diff / (24 * 60 * 60 * 1000));
				days =(int) diffDays;
				//System.out.print(diffDays + " days, ");
				//System.out.print(diffHours + " hours, ");
				//System.out.print(diffMinutes + " minutes, ");
				//System.out.print(diffSeconds + " seconds.");
	 
			} catch (Exception e) {
				e.printStackTrace();
			}
			String time="";
			if(days!=0){
				if(days==1){time="Yesterday";}else{time=days+" Days ";}
			}else{
			if(diffHours!=0){
				if(diffHours==1){time=time+diffHours+" Hr ";}else{time=time+diffHours+" Hrs ";}
			}
			if(diffMinutes!=0){
				if(diffHours==1){time=time+diffMinutes+" Min ";}else{time=time+diffMinutes+" Mins ";}
			}}
			if(time.equalsIgnoreCase("")){time="Just now";}
			return time;
	 
		}
	 
	 /**
	  * if current date is previous date from argument date, then this method return 1 other wise it will return 4
	  * @param date
	  * @return
	  */
	 public static int checkDateIsPreDate(String date){
         
	        Date current = new Date();
	        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	        //create date object
	        Date prev=null;
			try {
				prev = format.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	        //compare both dates
	        if(prev.before(current)){
	        		return 4;
	        } else {
	        	return 1;
	        }
	    }
}
