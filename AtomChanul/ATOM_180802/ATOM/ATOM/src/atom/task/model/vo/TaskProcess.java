package atom.task.model.vo;

import java.sql.Date;

public class TaskProcess {
	private Integer taskNo;
	private Integer processNo;
	private String processWriter;
	private String processContent;
	private String progress;
	private Date lastReformDate;
	
	public TaskProcess() {}

	public TaskProcess(Integer taskNo, Integer processNo, String processWriter, String processContent, String progress,
			Date lastReformDate) {
		super();
		this.taskNo = taskNo;
		this.processNo = processNo;
		this.processWriter = processWriter;
		this.processContent = processContent;
		this.progress = progress;
		this.lastReformDate = lastReformDate;
	}

	public Integer getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(Integer taskNo) {
		this.taskNo = taskNo;
	}

	public Integer getProcessNo() {
		return processNo;
	}

	public void setProcessNo(Integer processNo) {
		this.processNo = processNo;
	}

	public String getProcessWriter() {
		return processWriter;
	}

	public void setProcessWriter(String processWriter) {
		this.processWriter = processWriter;
	}

	public String getProcessContent() {
		return processContent;
	}

	public void setProcessContent(String processContent) {
		this.processContent = processContent;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public Date getLastReformDate() {
		return lastReformDate;
	}

	public void setLastReformDate(Date lastReformDate) {
		this.lastReformDate = lastReformDate;
	}
	
	

}
