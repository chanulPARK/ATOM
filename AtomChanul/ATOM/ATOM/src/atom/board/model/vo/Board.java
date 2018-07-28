package atom.board.model.vo;
import java.sql.*;

public class Board {
	private int boardNo;		// 게시글 번호
	private String title;		// 글 제목
	private String content;		// 내용
	private String writer;		// 작성자
	private Date writeDate;		// 작성일
	private int visits;			// 조회수
	
	public Board() {
		
	}
	
	public Board(int boardNo, String title, String content,
			String writer, Date writeDate, int visits) {
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
		this.visits = visits;
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

	@Override
	public String toString() {
		return "번호:" + boardNo + ", 제목:" + title
			+ ", 내용: " + content + ", 작성자:" + writer
			+ ", 작성일:" + writeDate + ", 조회수:" + visits;
	}
}
