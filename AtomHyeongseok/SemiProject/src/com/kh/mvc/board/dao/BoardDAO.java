package com.kh.mvc.board.dao;
import java.sql.*;
import java.util.Properties;
import com.kh.mvc.board.vo.Board;
import static common.JDBCTemplate.*;

public class BoardDAO {
	private	PreparedStatement pstmt = null;
	private ResultSet rset = null;
	private Board b = null;
	private Properties prop = new Properties();
	private static Connection conn = null;
	
	public BoardDAO() {
		try {
			Class.forName(prop.getProperty("driver"));
			conn = DriverManager
					.getConnection(prop.getProperty("url"),
								   prop.getProperty("user"),
								   prop.getProperty("pwd"));
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
				b.setWriteDate(rset.getDate("date"));
				b.setContent(rset.getString("content"));
				b.setWriter(rset.getString("writer"));
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
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardNo());
			pstmt.setString(2, b.getTitle());
			pstmt.setDate(3, b.getWriteDate());
			pstmt.setString(4, b.getContent());
			pstmt.setString(5, b.getWriter());
			pstmt.setInt(6, b.getVisits());
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
		int result = 0;
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
		int result = 0;
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
}
