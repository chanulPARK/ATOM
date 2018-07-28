package atom.board.model.dao;
import java.io.FileReader;
import java.sql.*;
import java.util.*;

import atom.board.model.vo.Board;

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
		b = new Board();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				b.setBoardNo(rset.getInt("board_no"));
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setWriter(rset.getString("writer"));
				b.setWriteDate(rset.getDate("write_date"));
				b.setVisits(rset.getInt("visits"));
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
			result = pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		System.out.println("insertBoard 결과 : "+result);
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
		System.out.println("updateBoard 결과 : "+result);
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
		System.out.println("deleteBoard 결과 : "+result);
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
				list.add(b);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(rset);
		close(pstmt);
		System.out.println("selectBoardList 결과:"+list);
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
		System.out.println("selectBoardCount 결과 : "+result);
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
		System.out.println("insertBoardCount 결과 : "+result);
		return result;
	}
}
