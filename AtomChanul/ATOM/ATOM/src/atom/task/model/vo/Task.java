package atom.task.model.vo;

import java.util.Date;

public class Task {
	private String empId;
	private String empName;
	private String deptName;
	private int taskNo;
	private String category;
	private String title;
	private String contents;
	private Date enrollDate;
	private Date reportDate;
	
	public Task() {}

	public Task(String empId, String empName, String deptName, int taskNo, String category, String title,
			String contents, Date enrollDate, Date reportDate) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.deptName = deptName;
		this.taskNo = taskNo;
		this.category = category;
		this.title = title;
		this.contents = contents;
		this.enrollDate = enrollDate;
		this.reportDate = reportDate;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "Task [empId=" + empId + ", empName=" + empName + ", deptName=" + deptName + ", taskNo=" + taskNo
				+ ", category=" + category + ", title=" + title + ", contents=" + contents + ", enrollDate="
				+ enrollDate + ", reportDate=" + reportDate + "]";
	}

}
