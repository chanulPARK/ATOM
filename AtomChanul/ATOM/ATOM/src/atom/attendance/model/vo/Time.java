package atom.attendance.model.vo;

public class Time {
	private String stDate;
	private String stAtt;
	private String stLeave;
	private String stLunch;
	
	public Time() {}

	public Time(String stDate, String stAtt, String stLeave, String stLunch) {
		super();
		this.stDate = stDate;
		this.stAtt = stAtt;
		this.stLeave = stLeave;
		this.stLunch = stLunch;
	}

	public String getStDate() {
		return stDate;
	}

	public void setStDate(String stDate) {
		this.stDate = stDate;
	}

	public String getStAtt() {
		return stAtt;
	}

	public void setStAtt(String stAtt) {
		this.stAtt = stAtt;
	}

	public String getStLeave() {
		return stLeave;
	}

	public void setStLeave(String stLeave) {
		this.stLeave = stLeave;
	}

	public String getStLunch() {
		return stLunch;
	}

	public void setStLunch(String stLunch) {
		this.stLunch = stLunch;
	}

	@Override
	public String toString() {
		return "Time [stDate=" + stDate + ", stAtt=" + stAtt + ", stLeave=" + stLeave + ", stLunch=" + stLunch + "]";
	}
	
}
