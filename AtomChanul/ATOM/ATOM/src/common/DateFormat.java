package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateFormat {
	private SimpleDateFormat format;
	String day="";
	
	// 입력 날짜에 대한 요일 출력
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
	
	// 오늘 날짜 출력
	public String today() {
		format = new SimpleDateFormat("yyyy-MM-dd");
		day = format.format(new Date());
		
		return day;
	}
	
	// 현재 년-월 출력
	public String curMonth() {
		format = new SimpleDateFormat("yyyy-MM");
		day = format.format(new Date());
		
		return day;
	}
	
	// 지금 시간 출력
	public String time() {
		format = new SimpleDateFormat("HH:mm");
		day = format.format(new Date());
		
		return day;
	}
	
	// 입력 Date에 대한 시간 출력
	public int hour(Date date) {
		format = new SimpleDateFormat("HH");
		day = format.format(date);
		
		return Integer.parseInt(day);
	}
	
	// 입력 Date에 대한 분 출력
	public int minute(Date date) {
		format = new SimpleDateFormat("mm");
		day = format.format(date);
		
		return Integer.parseInt(day);
	}
	
	// 시간 차이 계산 (ex)지각시간, 연장시간 계산)
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
			timeGap = hour+":"+min;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return timeGap;
	}
	
	// 입력 날짜를 Date형식으로 변환
	public Date dateType(String date) throws ParseException {
		format = new SimpleDateFormat("yyyy-MM-dd");
		Date dayType = format.parse(date);
		
		return dayType;
	}
	
	// 입력 Date를 string으로 변환
	public String strType(Date date) {
		format = new SimpleDateFormat("yyyy-MM-dd");
		day = format.format(date);
		
		return day;
	}
	
	// 입력 날짜+시간 형태를 날짜만 남게 변경
	public String date(String date) throws ParseException {
		Date d = dateType(date);
		String s = strType(d);
		
		return s;		
	}
	
	// 입력 Calendar를 string으로 변경
	public String calStr(Calendar cal) {
		format = new SimpleDateFormat("yyyy-MM-dd");
		String strdate = format.format(cal.getTime());
		
		return strdate;
	}
	
	// 시간 합 출력 (ex)총 근무시간 계산)
	public String timeSum(String t1, String t2) {
		format = new SimpleDateFormat("HH:mm");
		String timesum="";
		try {
			// String 시간 값을 Date 값으로 포맷
			Date d1 = format.parse(t1);
			Date d2 = format.parse(t2);
			// Date 값을 시간, 분으로 나누기
			int h1 = hour(d1);
			int m1 = minute(d1);
			int h2 = hour(d2);
			int m2 = minute(d2);
			// 시간 더하기
			int hour=h1+h2;
			int min=m1+m2;
			// 값을 시간:분 형태로 변환
			if(min>59) {
				min-=60;
				hour++;
			}
			timesum = hour+":"+min;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return timesum;
	}
	
	// 00:00 형태를 00시간00분 형태로 변경
	public String timeType(String time) {
		format = new SimpleDateFormat("HH:mm");
		String type="";
		try {
			// String 시간 값을 Date 값으로 포맷
			Date date = format.parse(time);
			// Date 값을 시간, 분으로 나누기
			int hour = hour(date);
			int min = minute(date);
			type = hour+"시간 "+min+"분";
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return type;
	}
	
	// 두 시간을 비교하여 분 형태로 출력 (ex)기준시간과 입력 시간에 대해 정상,지각,조퇴 구분)
	public int timeCompare(String input, String standard) {
		format = new SimpleDateFormat("HH:mm");
		long time=0;
		try {
			// String 시간 값을 Date 값으로 포맷
			Date sDate = format.parse(input);
			Date eDate = format.parse(standard);
			// Date 값을 시간으로 변환
			long sTime = sDate.getTime();
			long eTime = eDate.getTime();
			// 차이를 초단위로 계산
			long gap = (eTime-sTime)/1000;
			// 값을 시간:분 형태로 변환
			long hour=gap/60/60;
			long min=((long)(gap/60))%60;
			// 시간 분을 분 형태로 변경
			time=(hour*60)+min;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		if(time>=0)
			return 1; // 정상출근 / 조퇴
		else
			return -1; // 지각 / 정상퇴근
	}
	
}
