package atom.attendance.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.attendance.model.vo.Holiday;

import static common.JDBCTemplate.*;

public class HolidayDAO {
	private Properties prop;
	
	public HolidayDAO() {
		prop = new Properties();
		try {
			String file = HolidayDAO.class.getResource("/sql/attendance/holiday-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<Holiday> selectHoli(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("selectHoli");
		Holiday h = null;
		List<Holiday> list = new ArrayList<Holiday>();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				h = new Holiday();
				h.setHoliDate(rs.getString("holi_date"));
				h.setHoliYn(rs.getString("holi_yn"));
				h.setHoliName(rs.getString("holi_name"));
				h.setHoliNote(rs.getString("holi_note"));
				list.add(h);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	public Holiday searchHoli(Connection conn, String date) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("searchHoli");
		Holiday h = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, date);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				h = new Holiday();
				h.setHoliDate(rs.getString("holi_date"));
				h.setHoliYn(rs.getString("holi_yn"));
				h.setHoliName(rs.getString("holi_name"));
				h.setHoliNote(rs.getString("holi_note"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return h;
	}

	public int insertHoli(Connection conn, Holiday h) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("insertHoli");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, h.getHoliDate());
			pstmt.setString(2, h.getHoliYn());
			pstmt.setString(3, h.getHoliName());
			pstmt.setString(4, h.getHoliNote());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	// 주말을 제외한 현재 월의 일 수
	public int getCnt(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("monthCnt");
		int cnt = 0;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return cnt;
	}
	// 관리자가 지정한 휴일 일 수 (holi_yn이 'y'인 경우)
	public int holiCnt(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("holiCnt");
		int cnt = 0;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return cnt;
	}

	public int getMonthCnt(Connection conn, String month) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("searchMonthCnt");
		int cnt = 0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, month);
			pstmt.setString(2, month);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return cnt;
	}

	public int holiMonthCnt(Connection conn, String month) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("searchHoliCnt");
		int cnt = 0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, month);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return cnt;
	}

	public int deleteHoli(Connection conn, String date) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("deleteHoli");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, date);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public List<Holiday> searchHoliMonth(Connection conn, String month) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("searchHoliMonth");
		Holiday h = null;
		List<Holiday> list = new ArrayList<Holiday>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, month);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				h = new Holiday();
				h.setHoliDate(rs.getString("holi_date"));
				h.setHoliYn(rs.getString("holi_yn"));
				h.setHoliName(rs.getString("holi_name"));
				h.setHoliNote(rs.getString("holi_note"));
				list.add(h);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}
	
}
