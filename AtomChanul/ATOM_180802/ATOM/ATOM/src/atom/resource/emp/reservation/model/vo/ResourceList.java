package atom.resource.emp.reservation.model.vo;

import java.sql.Date;

public class ResourceList {
	
	private String empId;
	private String empName;
	private String rscCatecode;
	private String rscCatename;
	private int rscCode;
	private String rscName;
	private String rscCondition;
	private String rscRent;
	private String startTime;
	private String endTime;
	private String rscReturn;
	private String returnMsg;
	private Date requestDate;
	
	public ResourceList() {}

	public ResourceList(int rscCode,String startTime)
	{
		super();
		this.rscCode = rscCode;
		this.startTime = startTime;
	}
	
	public ResourceList(String rscCatecode, String rscName, String rscCondition)
	{
		super();
		this.rscCatecode = rscCatecode;
		this.rscName = rscName;
		this.rscCondition = rscCondition;
	}
	
	public ResourceList(int rscCode,String rscName, String rscCondition)
	{
		super();
		this.rscCode = rscCode;
		this.rscName = rscName;
		this.rscCondition = rscCondition;
	}
	
	public ResourceList(String empId,String rscCatecode,int rscCode,String startTime,String endTime)
	{
		super();
		this.empId = empId;
		this.rscCatecode = rscCatecode;
		this.rscCode = rscCode;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	public ResourceList(String empId, String rscCatename, int rscCode, String rscName, String startTime, String endTime) 
	{
		super();
		this.empId = empId;
		this.rscCatename = rscCatename;
		this.rscCode = rscCode;
		this.rscName = rscName;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	

	public ResourceList(String empId, String empName, String rscCatecode, String rscCatename, int rscCode,
			String rscName, String rscCondition, String rscRent, String startTime, String endTime, String rscReturn,
			String returnMsg, Date requestDate) 
	{
		super();
		this.empId = empId;
		this.empName = empName;
		this.rscCatecode = rscCatecode;
		this.rscCatename = rscCatename;
		this.rscCode = rscCode;
		this.rscName = rscName;
		this.rscCondition = rscCondition;
		this.rscRent = rscRent;
		this.startTime = startTime;
		this.endTime = endTime;
		this.rscReturn = rscReturn;
		this.returnMsg = returnMsg;
		this.requestDate = requestDate;
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

	public String getRscCatecode() {
		return rscCatecode;
	}

	public void setRscCatecode(String rscCatecode) {
		this.rscCatecode = rscCatecode;
	}

	public String getRscCatename() {
		return rscCatename;
	}

	public void setRscCatename(String rscCatename) {
		this.rscCatename = rscCatename;
	}

	public int getRscCode() {
		return rscCode;
	}

	public void setRscCode(int rscCode) {
		this.rscCode = rscCode;
	}

	public String getRscName() {
		return rscName;
	}

	public void setRscName(String rscName) {
		this.rscName = rscName;
	}

	public String getRscCondition() {
		return rscCondition;
	}

	public void setRscCondition(String rscCondition) {
		this.rscCondition = rscCondition;
	}

	public String getRscRent() {
		return rscRent;
	}

	public void setRscRent(String rscRent) {
		this.rscRent = rscRent;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getRscReturn() {
		return rscReturn;
	}

	public void setRscReturn(String rscReturn) {
		this.rscReturn = rscReturn;
	}

	public String getReturnMsg() {
		return returnMsg;
	}

	public void setReturnMsg(String returnMsg) {
		this.returnMsg = returnMsg;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	@Override
	public String toString() {
		return "ResourceList [empId=" + empId + ", empName=" + empName + ", rscCatecode=" + rscCatecode
				+ ", rscCatename=" + rscCatename + ", rscCode=" + rscCode + ", rscName=" + rscName + ", rscCondition="
				+ rscCondition + ", rscRent=" + rscRent + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", rscReturn=" + rscReturn + ", returnMsg=" + returnMsg + ", requestDate=" + requestDate + "]";
	}

	
	
	
	

}
