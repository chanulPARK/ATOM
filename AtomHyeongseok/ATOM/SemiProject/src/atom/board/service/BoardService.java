package atom.board.service;
import java.sql.Connection;
import java.util.List;

import atom.board.dao.BoardDAO;
import atom.board.vo.Board;

import static common.JDBCTemplate.*;

public class BoardService {
	private Connection conn;
	
	public Board selectOne(int boardNo, boolean hasRead) {
		conn = getConnection();
		Board b = new BoardDAO().selectOne(conn, boardNo);
		int result = 0;
		if(b!=null) {
			if(!hasRead) {
				result = new BoardDAO()
						.insertBoardCount(conn, boardNo);
				if(result>0)
					commit(conn);
				else
					rollback(conn);
			}
		}
		close(conn);
		return b;
	}
	
	public int insertBoard(Board b) {
		conn = getConnection();
		int result = new BoardDAO().insertBoard(conn, b);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateBoard(Board b) {
		conn = getConnection();
		int result = new BoardDAO().updateBoard(conn, b);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteBoard(Board b) {
		conn = getConnection();
		int result = new BoardDAO().deleteBoard(conn, b);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Board> selectBoardList(int cPage, int numPerPage){
		conn = getConnection();
		List<Board> list = new BoardDAO()
				.selectBoardList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int selectBoardCount() {
		conn = getConnection();
		int result = new BoardDAO().selectBoardCount(conn);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
}
