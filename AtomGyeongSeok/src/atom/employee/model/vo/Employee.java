package atom.employee.model.vo;

import java.sql.Date;

public class Employee {
   private String empId;
   private String empPw;
   private String empName;	//이름
   private String empRrn;	//주민등록번호
   private String email;	//이메일
   private String phone;
   private String addr;		//주소
   private String deptCode;		//부서코드
   private String jobCode;		//잡코드
   private String managerId;	//매니저아이디
   private String adminCode;	//관리자여부
   private Date hireDate;		
   private Date entDate;
   private String entYn;
   private String empPr;
   private String empImg;
   
   public Employee() {}

   public Employee(String empId, String empPw, String empName, String empRrn, String email, String phone, String addr,
         String deptCode, String jobCode, String managerId, String adminCode, Date hireDate, Date entDate, String entYn, String empPr,
         String empImg) {
      super();
      this.empId = empId;
      this.empPw = empPw;
      this.empName = empName;
      this.empRrn = empRrn;
      this.email = email;
      this.phone = phone;
      this.addr = addr;
      this.deptCode = deptCode;
      this.jobCode = jobCode;
      this.managerId = managerId;
      this.adminCode = adminCode;
      this.hireDate = hireDate;
      this.entDate = entDate;
      this.entYn = entYn;
      this.empPr = empPr;
      this.empImg = empImg;
   }

   	
   
   //사원 추가
   public Employee(String empId, String empPw, String empName, String empRrn, String email, String phone, String addr,
		String deptCode, String jobCode, String managerId, String empPr,Date hireDate) {
	super();
	this.empId = empId;
	this.empPw = empPw;
	this.empName = empName;
	this.empRrn = empRrn;
	this.email = email;
	this.phone = phone;
	this.addr = addr;
	this.deptCode = deptCode;
	this.jobCode = jobCode;
	this.managerId = managerId;
	this.empPr = empPr;
	this.hireDate =hireDate;
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

   public String getEmpRrn() {
      return empRrn;
   }

   public void setEmpRrn(String empRrn) {
      this.empRrn = empRrn;
   }

   public String getAdminCode() {
      return adminCode;
   }

   public void setAdminCode(String adminCode) {
      this.adminCode = adminCode;
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
      return "Employee [empId=" + empId + ", empPw=" + empPw + ", empName=" + empName + ", empRrn=" + empRrn
            + ", email=" + email + ", phone=" + phone + ", addr=" + addr + ", deptCode=" + deptCode + ", jobCode="
            + jobCode + ", managerId=" + managerId + ", adminCode=" + adminCode + ", hireDate=" + hireDate
            + ", entDate=" + entDate + ", entYn=" + entYn + ", empPr=" + empPr + ", empImg=" + empImg + "]";
   }
   
}