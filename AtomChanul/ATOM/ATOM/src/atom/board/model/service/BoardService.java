package atom.board.model.service;
import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.*;
import atom.board.model.dao.BoardDAO;
import atom.board.model.vo.*;

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
	
	public List<Board> selectBoardList(int cPage, int numPerPage, String menu){
		conn = getConnection();
		List<Board> list = new BoardDAO().selectBoardList(conn, cPage, numPerPage, menu);
		close(conn);
		return list;
	}
	
	public int selectBoardCount(String menu) {
		conn = getConnection();
		int result = new BoardDAO().selectBoardCount(conn, menu);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertBoardCount(int boardNo) {
		conn = getConnection();
		int result = new BoardDAO().insertBoardCount(conn, boardNo);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public List<BoardCode> selectBoardCodeList(String boardName, String menu)
	{
		conn = getConnection();
		List<BoardCode> list=new BoardDAO().selectBoardCodeList(conn, boardName, menu);
		close(conn);
		return list;
	}
	
	public int insertBoardCodeList(BoardCode bc) {
		conn = getConnection();
		int result = new BoardDAO().insertBoardCodeList(conn, bc);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteBoardCodeList(BoardCode bc) {
		conn = getConnection();
		int result = new BoardDAO().deleteBoardCodeList(conn, bc);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
}
