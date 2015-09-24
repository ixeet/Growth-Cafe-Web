/**
 * 
 */
package  com.slms.domain.utility;

import java.io.FileNotFoundException;
import java.io.IOException;
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
}
