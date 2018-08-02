package atom.task.model.vo;

import java.sql.Date;

public class Task {

    // 사원번호 
    private String empId;

    // 작성자 
    private String empName;

    // 부서명 
    private String deptName;

    // 직급명 
    private String jobName;

    // 업무번호 
    private Integer taskNo;

    // 업무분류 
    private String taskType;

    // 제목 
    private String taskTitle;

    // 내용 
    private String taskContent;

    // 수신자 
    private String receiver;

    // 첨부파일 원본이름 
    private String originalFile;

    // 첨부파일 변경이름 
    private String renamedFile;

    // 등록일 
    private Date enrollDate;

    // 업무 기한 
    private Date deadline;

    // 업무 상태 
    private String taskStatus;

    // 확인 유무 
    private String taskCheck;
    
    public Task() {}

	public Task(String empId, String empName, String deptName, String jobName, Integer taskNo, String taskType,
			String taskTitle, String taskContent, String receiver, String originalFile, String renamedFile,
			Date enrollDate, Date deadline, String taskStatus, String taskCheck) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.deptName = deptName;
		this.jobName = jobName;
		this.taskNo = taskNo;
		this.taskType = taskType;
		this.taskTitle = taskTitle;
		this.taskContent = taskContent;
		this.receiver = receiver;
		this.originalFile = originalFile;
		this.renamedFile = renamedFile;
		this.enrollDate = enrollDate;
		this.deadline = deadline;
		this.taskStatus = taskStatus;
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

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public Integer getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(Integer taskNo) {
		this.taskNo = taskNo;
	}

	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
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

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getOriginalFile() {
		return originalFile;
	}

	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}

	public String getRenamedFile() {
		return renamedFile;
	}

	public void setRenamedFile(String renamedFile) {
		this.renamedFile = renamedFile;
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

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	public String getTaskCheck() {
		return taskCheck;
	}

	public void setTaskCheck(String taskCheck) {
		this.taskCheck = taskCheck;
	}

	@Override
	public String toString() {
		return "Task [empId=" + empId + ", empName=" + empName + ", deptName=" + deptName + ", jobName=" + jobName
				+ ", taskNo=" + taskNo + ", taskType=" + taskType + ", taskTitle=" + taskTitle + ", taskContent="
				+ taskContent + ", receiver=" + receiver + ", originalFile=" + originalFile + ", renamedFile="
				+ renamedFile + ", enrollDate=" + enrollDate + ", deadline=" + deadline + ", taskStatus=" + taskStatus
				+ ", taskCheck=" + taskCheck + "]";
	}
	
	
    
}