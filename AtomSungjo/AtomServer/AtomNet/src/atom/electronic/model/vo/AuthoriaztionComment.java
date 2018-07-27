package atom.electronic.model.vo;

import java.util.Date;

public class AuthoriaztionComment {
	private String draftNo;
	private String empId;
	private Date commentDate;
	private String comment;
	
	public AuthoriaztionComment() {}
	
	public AuthoriaztionComment(String draftNo, String empId, Date commentDate, String comment) {
		super();
		this.draftNo = draftNo;
		this.empId = empId;
		this.commentDate = commentDate;
		this.comment = comment;
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

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "AuthoriaztionComment [draftNo=" + draftNo + ", empId=" + empId + ", commentDate=" + commentDate
				+ ", comment=" + comment + "]";
	}
	
	
}
