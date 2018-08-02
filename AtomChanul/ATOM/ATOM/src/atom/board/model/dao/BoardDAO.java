package atom.board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.board.model.vo.Board;
import atom.board.model.vo.BoardCode;

public class BoardDAO {
	private	PreparedStatement pstmt = null;
	private ResultSet rset = null;
	private Board b = null;
	private Properties prop = new Properties();
	private int result;
	
	public BoardDAO() {
		try {
			String file = BoardDAO.class.getResource("/sql/board/board-sql.properties").getPath();
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
				b.setTitle(rset.getString("title"));
				b.setContent(rset.getString("content"));
				b.setWriteDate(rset.getDate("write_date"));
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
	
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerPage, String menu){			// 게시판 공개
		String sql = prop.getProperty("selectBoardList");
		List<Board> list = new ArrayList<Board>();
		System.out.println("menu"+sql);
		System.out.println("menu1"+((cPage-1)*numPerPage+1));
		System.out.println("menu2"+(cPage*numPerPage));
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
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
		System.out.println(list);
		return list;
	}
	
	public int selectBoardCount(Connection conn, String menu) {
		String sql = prop.getProperty("selectBoardCount");
		result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu);
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
		pstmt = null;
		result = 0;
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
	
	public List<BoardCode> selectBoardCodeList(Connection conn, String boardName, String menu)
	{
		String sql = prop.getProperty("selectBoardCodeList");
		ArrayList<BoardCode> list = new ArrayList<BoardCode>();
		BoardCode bc=null;
		try {	
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				bc = new BoardCode();
				menu = rset.getString("board_code");
				boardName = rset.getString("board_name");
				bc.setBoardCode(menu);
				bc.setBoardName(boardName);
				list.add(bc);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(rset);
		close(pstmt);
		return list;
	}
	
	public int insertBoardCodeList(Connection conn, BoardCode bc) {	// 중간에 새로 추가해야할 게시판이 있기 때문에
		pstmt = null;
		result = 0;
		String sql = prop.getProperty("insertBoardCodeList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bc.getBoardCode());
			pstmt.setString(2, bc.getBoardName());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	
	public int deleteBoardCodeList(Connection conn, BoardCode bc) {	// 게시판 자체를 삭제하기 위한 메소드
		pstmt = null;
		result = 0;
		String sql = prop.getProperty("deleteBoardCodeList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bc.getBoardName());
			result = pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
}
