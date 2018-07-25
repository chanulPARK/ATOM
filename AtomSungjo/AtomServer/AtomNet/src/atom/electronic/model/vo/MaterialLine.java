package atom.electronic.model.vo;

import java.util.Arrays;

public class MaterialLine {
	private String draftNo;
	private String empId;
	private int materialSquence;
	private String materialState;
	public MaterialLine() {}
	public MaterialLine(String draftNo, String empId, int materialSquence, String materialState) {
		super();
		this.draftNo = draftNo;
		this.empId = empId;
		this.materialSquence = materialSquence;
		this.materialState = materialState;
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
	@Override
	public String toString() {
		return "MaterialLine [draftNo=" + draftNo + ", empId=" + empId + ", materialSquence=" + materialSquence
				+ ", materialState=" + materialState + "]";
	}
	
	
	
}
