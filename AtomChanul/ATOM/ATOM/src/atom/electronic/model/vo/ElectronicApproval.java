package atom.electronic.model.vo;

import java.util.Date;

public class ElectronicApproval {
	private int pageNo;
	private String draftNo;
	private Date draftDate;
	private Date CompletionDate;
	private String empId;
	private String empName;
	private String draftDept;
	private String draftName;
	private String draftContent;
	private String draftState;
	
	public ElectronicApproval() {}

	@Override
	public String toString() {
		return "ElectronicApproval [pageNo=" + pageNo + ", draftNo=" + draftNo + ", draftDate=" + draftDate + ", empId="
				+ empId + ", draftDept=" + draftDept + ", draftName=" + draftName + ", draftContent=" + draftContent
				+ ", draftState=" + draftState + "]";
	}

	
	
	public Date getCompletionDate() {
		return CompletionDate;
	}

	public void setCompletionDate(Date completionDate) {
		CompletionDate = completionDate;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getDraftNo() {
		return draftNo;
	}

	public void setDraftNo(String draftNo) {
		this.draftNo = draftNo;
	}

	public Date getDraftDate() {
		return draftDate;
	}

	public void setDraftDate(Date draftDate) {
		this.draftDate = draftDate;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getDraftDept() {
		return draftDept;
	}

	public void setDraftDept(String draftDept) {
		this.draftDept = draftDept;
	}

	public String getDraftName() {
		return draftName;
	}

	public void setDraftName(String draftName) {
		this.draftName = draftName;
	}

	public String getDraftContent() {
		return draftContent;
	}

	public void setDraftContent(String draftContent) {
		this.draftContent = draftContent;
	}

	public String getDraftState() {
		return draftState;
	}

	public void setDraftState(String draftState) {
		this.draftState = draftState;
	}

	public ElectronicApproval(String draftNo, Date draftDate, String empId, String draftDept, String draftName,
			String draftContent, String draftState) {
		super();
		this.draftNo = draftNo;
		this.draftDate = draftDate;
		this.empId = empId;
		this.draftDept = draftDept;
		this.draftName = draftName;
		this.draftContent = draftContent;
		this.draftState = draftState;
	}
	
	
	
	
}
