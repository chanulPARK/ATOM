package atom.attendance.model.vo;

import java.sql.Date;

public class Attendance {
	private String empId;
	private Date attDate;
	private String attYn;
	private String attTime;
	private String leaveTime;
	private String workTime;
	private String attNote;
	private String attType;
	private int holiCnt;
	
	public Attendance() {}

	public Attendance(String empId, String attNote, String attType) {
		super();
		this.empId = empId;
		this.attNote = attNote;
		this.attType = attType;
	}
	
	public Attendance(String empId, String attTime, String attNote, String attType) {
		super();
		this.empId = empId;
		this.attTime = attTime;
		this.attNote = attNote;
		this.attType = attType;
	}

	public Attendance(String empId, String leaveTime, String workTime, String attNote, String attType) {
		super();
		this.empId = empId;
		this.leaveTime = leaveTime;
		this.workTime = workTime;
		this.attNote = attNote;
		this.attType = attType;
	}

	public Attendance(String empId, Date attDate, String attYn, String attTime, String leaveTime, String workTime,
			String attNote, String attType, int holiCnt) {
		super();
		this.empId = empId;
		this.attDate = attDate;
		this.attYn = attYn;
		this.attTime = attTime;
		this.leaveTime = leaveTime;
		this.workTime = workTime;
		this.attNote = attNote;
		this.attType = attType;
		this.holiCnt = holiCnt;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public Date getAttDate() {
		return attDate;
	}

	public void setAttDate(Date attDate) {
		this.attDate = attDate;
	}

	public String getAttYn() {
		return attYn;
	}

	public void setAttYn(String attYn) {
		this.attYn = attYn;
	}

	public String getAttTime() {
		return attTime;
	}

	public void setAttTime(String attTime) {
		this.attTime = attTime;
	}

	public String getLeaveTime() {
		return leaveTime;
	}

	public void setLeaveTime(String leaveTime) {
		this.leaveTime = leaveTime;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public String getAttNote() {
		return attNote;
	}

	public void setAttNote(String attNote) {
		this.attNote = attNote;
	}

	public String getAttType() {
		return attType;
	}

	public void setAttType(String attType) {
		this.attType = attType;
	}

	public int getHoliCnt() {
		return holiCnt;
	}

	public void setHoliCnt(int holiCnt) {
		this.holiCnt = holiCnt;
	}

	@Override
	public String toString() {
		return "Attendance [empId=" + empId + ", attDate=" + attDate + ", attYn=" + attYn + ", attTime=" + attTime
				+ ", leaveTime=" + leaveTime + ", workTime=" + workTime + ", attNote=" + attNote + ", attType="
				+ attType + ", holiCnt=" + holiCnt + "]";
	}
	
}
