package atom.task.model.vo;

import java.util.Date;

public class Task {
    // 사원번호 
    private String empId;

    // 작성자 
    private String empName;

    // 부서명 
    private String deptName;

    // 업무번호 
    private Integer taskNo;

    // 업무분류 
    private String categoryName;

    // 수신자 
    private String receiver;

    // 제목 
    private String taskTitle;

    // 내용 
    private String taskContent;

    // 첨부파일 원본이름 
    private String originalFile;

    // 첨부파일 변경이름 
    private String renameFile;

    // 등록일 
    private Date enrollDate;

    // 업무 기한 
    private Date deadline;

    // 업무 상태 
    private String taskStasus;

    // 확인 유무 
    private String taskCheck;
	
	public Task() {}

	public Task(String empId, String empName, String deptName, Integer taskNo, String categoryName, String receiver,
			String taskTitle, String taskContent, String originalFile, String renameFile, Date enrollDate,
			Date deadline, String taskStasus, String taskCheck) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.deptName = deptName;
		this.taskNo = taskNo;
		this.categoryName = categoryName;
		this.receiver = receiver;
		this.taskTitle = taskTitle;
		this.taskContent = taskContent;
		this.originalFile = originalFile;
		this.renameFile = renameFile;
		this.enrollDate = enrollDate;
		this.deadline = deadline;
		this.taskStasus = taskStasus;
		this.taskCheck = taskCheck;
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

	public Integer getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(Integer taskNo) {
		this.taskNo = taskNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getTaskTitle() {
		return taskTitle;
	}

	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}

	public String getTaskContent() {
		return taskContent;
	}

	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}

	public String getOriginalFile() {
		return originalFile;
	}

	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}

	public String getRenameFile() {
		return renameFile;
	}

	public void setRenameFile(String renameFile) {
		this.renameFile = renameFile;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getTaskStasus() {
		return taskStasus;
	}

	public void setTaskStasus(String taskStasus) {
		this.taskStasus = taskStasus;
	}

	public String getTaskCheck() {
		return taskCheck;
	}

	public void setTaskCheck(String taskCheck) {
		this.taskCheck = taskCheck;
	}

}
