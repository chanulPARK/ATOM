package atom.electronic.model.vo;

import java.util.Date;

public class MaterialLine {
	private String draftNo;
	private String empId;
	private String empName;
	private int materialSquence;
	private String materialState;
	private Date materialDate;
	
	
	public MaterialLine() {}
	public MaterialLine(String draftNo, String empId, int materialSquence, String materialState) {
		super();
		this.draftNo = draftNo;
		this.empId = empId;
		this.materialSquence = materialSquence;
		this.materialState = materialState;
	}
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDraftNo() {
		return draftNo;
	}
	public void setDraftNo(String draftNo) {
		this.draftNo = draftNo;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public int getMaterialSquence() {
		return materialSquence;
	}
	public void setMaterialSquence(int materialSquence) {
		this.materialSquence = materialSquence;
	}
	public String getMaterialState() {
		return materialState;
	}
	public void setMaterialState(String materialState) {
		this.materialState = materialState;
	}
	public Date getMaterialDate() {
		return materialDate;
	}
	public void setMaterialDate(Date materialDate) {
		this.materialDate = materialDate;
	}
	
	@Override
	public String toString() {
		return "MaterialLine [draftNo=" + draftNo + ", empId=" + empId + ", materialSquence=" + materialSquence
				+ ", materialState=" + materialState + "]";
	}
	
	
	
}
