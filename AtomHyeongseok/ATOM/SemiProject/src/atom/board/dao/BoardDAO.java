package atom.board.dao;
import java.io.FileReader;
import java.sql.*;
import java.util.*;

import atom.board.vo.Board;

import static common.JDBCTemplate.*;

public class BoardDAO {
	private	PreparedStatement pstmt = null;
	private ResultSet rset = null;
	private Board b = null;
	private Properties prop = new Properties();
	private int result;
	
	public BoardDAO() {
		try {
			String file = BoardDAO.class.getResource("/sql/common/board-sql.properties").getPath();
			prop.load(new FileReader(file));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Board selectOne(Connection conn, int boardNo) {
		String sql = prop.getProperty("boardSelectOne");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b = new Board();
				pstmt.setInt(1, b.getBoardNo());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		close(rset);
		close(pstmt);
		return b;
	}
	
	public int insertBoard(Connection conn, Board b) {
		String sql = prop.getProperty("boardInsert");
		result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setString(3, b.getWriter());
			pstmt.setString(4, b.getBoardCode());
			result = pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	
	public int updateBoard(Connection conn, Board b) {
		String sql = prop.getProperty("boardUpdate");
		result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getBoardNo());
			result = pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	
	public int deleteBoard(Connection conn, Board b) {
		String sql = prop.getProperty("boardDelete");
		result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardNo());
			result = pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerPage){
		String sql = prop.getProperty("selectBoardList");
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setWriter(rset.getString("writer"));
				b.setWriteDate(rset.getDate("write_date"));
				b.setVisits(rset.getInt("visits"));
				b.setBoardCode(rset.getString("board_code"));
				list.add(b);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(rset);
		close(pstmt);
		return list;
	}
	
	public int selectBoardCount(Connection conn) {
		String sql = prop.getProperty("selectBoardCount");
		result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(rset);
		close(pstmt);
		return result;
	}
	
	public int insertBoardCount(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBoardCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
}
