package atom.calendar.model.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Calendar {
	
	private int scheduleId;
	private String scheduleName;
	private String startDate;
	private String endDate;
	private String empId;
	private String category;
	private String content;
	private String place;
	private char repeatYN;
	private String repeatCategory;
	private String dayOfWeek;
	private Date repeatEndDate;
	
	private SimpleDateFormat sd; 
	
	public Calendar() {
		sd = new SimpleDateFormat("YYYY-MM-dd");		
	}

	public Calendar(int scheduleId, String scheduleName, String startDate, String endDate, String empId,
			String category, String content, String place, char repeatYN, String repeatCategory, String dayOfWeek,
			Date repeatEndDate) {
		super();
		this.scheduleId = scheduleId;
		this.scheduleName = scheduleName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.empId = empId;
		this.category = category;
		this.content = content;
		this.place = place;
		this.repeatYN = repeatYN;
		this.repeatCategory = repeatCategory;
		this.dayOfWeek = dayOfWeek;
		this.repeatEndDate = repeatEndDate;
	}

	public int getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}

	public String getScheduleName() {
		return scheduleName;
	}

	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public char getRepeatYN() {
		return repeatYN;
	}

	public void setRepeatYN(char repeatYN) {
		this.repeatYN = repeatYN;
	}

	public String getRepeatCategory() {
		return repeatCategory;
	}

	public void setRepeatCategory(String repeatCategory) {
		this.repeatCategory = repeatCategory;
	}

	public String getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public Date getRepeatEndDate() {
		return repeatEndDate;
	}

	public void setRepeatEndDate(Date repeatEndDate) {
		this.repeatEndDate = repeatEndDate;
	}
	
	

	@Override
	public String toString() {
		return "Calendar [scheduleId=" + scheduleId + ", scheduleName=" + scheduleName + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", empId=" + empId + ", category=" + category + ", content=" + content
				+ ", place=" + place + ", repeatYN=" + repeatYN + ", repeatCategory=" + repeatCategory
				+ ", dayOfWeek=" + dayOfWeek + ", repeatEndDate=" + repeatEndDate + "]";
	}

	public int getStartYear() {
		System.out.println("aaaaa" + startDate);
		String[] temp =startDate.split(" ");
		System.out.println("dddddd" + temp[0]);
		String[] date = temp[0].split("/");
		return Integer.parseInt(date[2]);
	}
	
	public int getStartMonth() {
		String[] temp =startDate.split(" ");
		String[] date = temp[0].split("/");
		return Integer.parseInt(date[0]);
	}
	
	public int getStartDay() {
		String[] temp =startDate.split(" ");
		String[] date = temp[0].split("/");
		return Integer.parseInt(date[1]);
	}
	
	public int getEndYear() {
		String[] temp =sd.format(repeatEndDate).split("-");
		return Integer.parseInt(temp[0]);
	}
	
	public int getEndMonth() {
		String[] temp =sd.format(repeatEndDate).split("-");
		return Integer.parseInt(temp[1]);
	}
	
	public int getEndDay() {
		String[] temp =sd.format(repeatEndDate).split("-");
		return Integer.parseInt(temp[2]);
	}
	
	
}
