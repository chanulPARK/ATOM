package atom.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	private int scheduleId;
	private String scheduleName;
	private Date startDate;
	private Date endDate;
	private String empId;
	private String category;
	private String content;
	private String place;
	private char repeatYN;
	private String repeatCategory;
	private int repeatCycle;
	private Date repeatEndDate;
	
	public Calendar() {}

	public Calendar(int scheduleId, String scheduleName, Date startDate, Date endDate, String empId, String category,
			String content, String place, char repeatYN, String repeatCategory, int repeatCycle, Date repeatEndDate) {
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
		this.repeatCycle = repeatCycle;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
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

	public int getRepeatCycle() {
		return repeatCycle;
	}

	public void setRepeatCycle(int repeatCycle) {
		this.repeatCycle = repeatCycle;
	}

	public Date getRepeatEndDate() {
		return repeatEndDate;
	}

	public void setRepeatEndDate(Date repeatEndDate) {
		this.repeatEndDate = repeatEndDate;
	}
	
	
}
