package atom.board.model.vo;
import java.sql.*;
import java.text.SimpleDateFormat;

public class Board {
	private int boardNo;		// 게시글 번호
	private String title;		// 글 제목
	private String content;		// 내용
	private String writer;		// 작성자
	private Date writeDate;		// 작성일
	private int visits;			// 조회수
	private String boardCode;	// 게시판 코드
	private String boardName;  // 게시판 이름
	
	public Board() {
		
	}
	


	public Board(int boardNo, String title, String content, String writer, Date writeDate, int visits, String boardCode,
			String boardName) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
		this.visits = visits;
		this.boardCode = boardCode;
		this.boardName = boardName;
	}



	public String getBoardName() {
		return boardName;
	}



	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}



	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getVisits() {
		return visits;
	}

	public void setVisits(int visits) {
		this.visits = visits;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}



	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", writeDate=" + writeDate + ", visits=" + visits + ", boardCode=" + boardCode + ", boardName="
				+ boardName + "]";
	}


}
