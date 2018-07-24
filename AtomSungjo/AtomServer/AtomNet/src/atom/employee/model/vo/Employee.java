package atom.employee.model.vo;

import java.sql.Date;

public class Employee {
	private String empId;
	private String empPw;
	private String empName;
	private String empNo;
	private String email;
	private String phone;
	private String addr;
	private String deptCode;
	private String deptName;
	private String jobCode;
	private String jobName;
	private String adminCode;
	private String adminName;
	private String managerId;
	private Date hireDate;
	private Date entDate;
	private String entYn;
	private String empPr;
	private String empImg;
	
	
	
	
	public Employee() {}

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

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public Employee(String empId, String empPw, String empName, String empNo, String email, String phone, String addr,
			String deptCode, String deptName, String jobCode, String jobName, String adminCode, String adminName,
			String managerId, Date hireDate, Date entDate, String entYn, String empPr, String empImg) {
		super();
		this.empId = empId;
		this.empPw = empPw;
		this.empName = empName;
		this.empNo = empNo;
		this.email = email;
		this.phone = phone;
		this.addr = addr;
		this.deptCode = deptCode;
		this.deptName = deptName;
		this.jobCode = jobCode;
		this.jobName = jobName;
		this.adminCode = adminCode;
		this.adminName = adminName;
		this.managerId = managerId;
		this.hireDate = hireDate;
		this.entDate = entDate;
		this.entYn = entYn;
		this.empPr = empPr;
		this.empImg = empImg;
	}



	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpPw() {
		return empPw;
	}

	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public String getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public Date getEntDate() {
		return entDate;
	}

	public void setEntDate(Date entDate) {
		this.entDate = entDate;
	}

	public String getEntYn() {
		return entYn;
	}

	public void setEntYn(String entYn) {
		this.entYn = entYn;
	}

	public String getEmpPr() {
		return empPr;
	}

	public void setEmpPr(String empPr) {
		this.empPr = empPr;
	}

	public String getEmpImg() {
		return empImg;
	}

	public void setEmpImg(String empImg) {
		this.empImg = empImg;
	}

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empPw=" + empPw + ", empName=" + empName + ", empNo=" + empNo
				+ ", email=" + email + ", phone=" + phone + ", addr=" + addr + ", deptCode=" + deptCode + ", deptName="
				+ deptName + ", jobCode=" + jobCode + ", jobName=" + jobName + ", adminCode=" + adminCode
				+ ", adminName=" + adminName + ", managerId=" + managerId + ", hireDate=" + hireDate + ", entDate="
				+ entDate + ", entYn=" + entYn + ", empPr=" + empPr + ", empImg=" + empImg + "]";
	}

	
	
}
