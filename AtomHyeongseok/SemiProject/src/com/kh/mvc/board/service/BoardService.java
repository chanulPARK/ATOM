package com.kh.mvc.board.service;
import java.sql.Connection;
import com.kh.mvc.board.dao.BoardDAO;
import com.kh.mvc.board.vo.Board;
import static common.JDBCTemplate.*;

public class BoardService {
	private Connection conn;
	
	public Board selectOne(int boardNo) {
		conn = getConnection();
		Board b = new BoardDAO().selectOne(conn, boardNo);
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
}
