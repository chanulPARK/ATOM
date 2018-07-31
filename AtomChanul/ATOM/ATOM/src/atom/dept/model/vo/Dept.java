package atom.dept.model.vo;

public class Dept {
	private int deptCode;
	private String deptName;
	
	public Dept(){}	//디폴트 생성

	public Dept(int deptCode, String deptName) {
		super();
		this.deptCode = deptCode;
		this.deptName = deptName;
	}

	public int getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(int deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Override
	public String toString() {
		return "Dept [deptCode=" + deptCode + ", deptName=" + deptName + "]";
	}
	
	
	
	
}
