package atom.attendance.model.vo;

public class Holiday {
	private String holiDate;
	private String holiYn;
	private String holiName;
	private String holiNote;
	
	public Holiday() {}

	public Holiday(String holiDate, String holiYn, String holiName, String holiNote) {
		super();
		this.holiDate = holiDate;
		this.holiYn = holiYn;
		this.holiName = holiName;
		this.holiNote = holiNote;
	}

	public String getHoliDate() {
		return holiDate;
	}

	public void setHoliDate(String holiDate) {
		this.holiDate = holiDate;
	}

	public String getHoliYn() {
		return holiYn;
	}

	public void setHoliYn(String holiYn) {
		this.holiYn = holiYn;
	}

	public String getHoliName() {
		return holiName;
	}

	public void setHoliName(String holiName) {
		this.holiName = holiName;
	}

	public String getHoliNote() {
		return holiNote;
	}

	public void setHoliNote(String holiNote) {
		this.holiNote = holiNote;
	}

	@Override
	public String toString() {
		return "Holiday [holiDate=" + holiDate + ", holiYn=" + holiYn + ", holiName=" + holiName + ", holiNote="
				+ holiNote + "]";
	}
	
}
