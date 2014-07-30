package com.collegechakhna;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import com.google.appengine.api.datastore.Text;

public class test {

	public static void main(String[] args) {
		
		String test = "\'";
		System.out.println(test);
		
		// Constructor allows to set year, month and date
		Calendar cal1 = new GregorianCalendar(2008, 01, 01);
		// Constructor could also be empty
		Calendar cal2 = new GregorianCalendar();
		// Change the month
		cal1.set(Calendar.MONTH, Calendar.MAY);
		//
		//		    System.out.println("Year: " + cal1.get(Calendar.YEAR));
		//		    System.out.println("Month: " + (cal1.get(Calendar.MONTH) + 1));
		//		    System.out.println("Days: " + cal1.get(Calendar.DAY_OF_MONTH));

		System.out.println("Year: " + cal2.get(Calendar.YEAR));
		System.out.println("Month: " + (cal2.get(Calendar.MONTH) + 1));
		System.out.println("Days: " + cal2.get(Calendar.DAY_OF_MONTH));


		//		    // Format the output with leading zeros for days and month
		//		    SimpleDateFormat date_format = new SimpleDateFormat("yyyyMMdd");
		//		    System.out.println(date_format.format(cal1.getTime()));

		//==========================================================================================================

		Text random;
		random = new Text("blah blah blah!!");
		System.out.println(random.getValue());
	}
}
