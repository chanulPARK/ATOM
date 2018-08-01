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

import atom.attendance.model.vo.Time;

import static common.JDBCTemplate.*;

public class TimeDAO {
	private Properties prop;
	
	public TimeDAO() {
		prop = new Properties();
		try {
			String file = TimeDAO.class.getResource("/sql/attendance/time-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	// 현재 날짜에 대한 기준시간을 최근 순으로 가져옴
	public Time selectTime(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("selectTime");
		Time t = null;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				t = new Time();
				t.setStDate(rs.getString("st_date"));
				t.setStAtt(rs.getString("st_att"));
				t.setStLeave(rs.getString("st_leave"));
				t.setStLunch(rs.getString("st_lunch"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return t;
	}

	public List<Time> selectTimeList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("selectTimeList");
		Time t = null;
		List<Time> list = new ArrayList<Time>();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				t = new Time();
				t.setStDate(rs.getString("st_date"));
				t.setStAtt(rs.getString("st_att"));
				t.setStLeave(rs.getString("st_leave"));
				t.setStLunch(rs.getString("st_lunch"));
				list.add(t);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	public int insertTime(Connection conn, Time t) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("insertTime");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, t.getStDate());
			pstmt.setString(2, t.getStAtt());
			pstmt.setString(3, t.getStLeave());
			pstmt.setString(4, t.getStLunch());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int deleteTime(Connection conn, String date) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("deleteTime");
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
	// 입력 날짜에 대한 기준시간 가져옴
	public Time searchtTime(Connection conn, String searchDay) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("searchTime");
		Time t = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchDay);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				t = new Time();
				t.setStDate(rs.getString("st_date"));
				t.setStAtt(rs.getString("st_att"));
				t.setStLeave(rs.getString("st_leave"));
				t.setStLunch(rs.getString("st_lunch"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return t;
	}
	
}
