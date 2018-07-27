package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.tomcat.util.codec.binary.StringUtils;

public class DateFormat {
	private SimpleDateFormat format;
	String day="";
	
	public String dayOfWeek(String date) throws ParseException {
		format = new SimpleDateFormat("yyyy-MM-dd");
		Date nDate = null;
		nDate = format.parse(date);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(nDate);
		
		int dayNum = cal.get(Calendar.DAY_OF_WEEK);
		
		switch(dayNum){
			case 1: day="일";break; 
			case 2: day="월";break; 
			case 3: day="화";break; 
			case 4: day="수";break; 
			case 5: day="목";break; 
			case 6: day="금";break; 
			case 7: day="토";break;
		}
		return day;
	}
	
	public String today() {
		format = new SimpleDateFormat("yyyy-MM-dd");
		day = format.format(new Date());
		
		return day;
	}
	
	public String year() {
		format = new SimpleDateFormat("yyyy");
		day = format.format(new Date());
		
		return day;
	}
	
	public String month() {
		format = new SimpleDateFormat("MM");
		day = format.format(new Date());
		
		return day;
	}
	
	public String day() {
		format = new SimpleDateFormat("dd");
		day = format.format(new Date());
		
		return day;
	}
	
	public String time() {
		format = new SimpleDateFormat("HH:mm");
		day = format.format(new Date());
		
		return day;
	}
	
	public String hour() {
		format = new SimpleDateFormat("HH");
		day = format.format(new Date());
		
		return day;
	}
	
	public String minute() {
		format = new SimpleDateFormat("mm");
		day = format.format(new Date());
		
		return day;
	}
	
	public String timeGap(String start, String end) {
		format = new SimpleDateFormat("HH:mm");
		String timeGap="";
		try {
			// String 시간 값을 Date 값으로 포맷
			Date sDate = format.parse(start);
			Date eDate = format.parse(end);
			// Date 값을 시간으로 변환
			long sTime = sDate.getTime();
			long eTime = eDate.getTime();
			// 차이를 초단위로 계산
			long gap = (eTime-sTime)/1000;
			// 값을 시간:분 형태로 변환
			long hour=gap/60/60;
			long min=((long)(gap/60))%60;
			timeGap = hour+"시간 "+min+"분";
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return timeGap;
	}
	
	public Date dateType(String date) throws ParseException {
		format = new SimpleDateFormat("yyyy-MM-dd");
		Date dayType = format.parse(date);
		return dayType;
	}
	
	public String calStr(Calendar cal) {
		format = new SimpleDateFormat("yyyy-MM-dd");
		String strdate = format.format(cal.getTime());
		return strdate;
	}
}
