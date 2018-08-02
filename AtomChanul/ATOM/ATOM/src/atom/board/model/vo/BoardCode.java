package atom.board.model.vo;

public class BoardCode {
	
	private String boardCode;
	private String boardName;

	public BoardCode() {
		
	}
	
	public BoardCode(String boardCode, String boardName) {
		this.boardCode = boardCode;
		this.boardName = boardName;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	@Override
	public String toString() {
		return "BoardCode [boardCode=" + boardCode + ", boardName=" + boardName + "]";
	}
}
