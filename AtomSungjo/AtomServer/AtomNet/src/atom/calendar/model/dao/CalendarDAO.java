package atom.calendar.model.dao;

import static common.JDBCTemplate.*;
import java.io.FileReader;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.calendar.model.vo.Calendar;

public class CalendarDAO {
	private Properties prop;
	public CalendarDAO() {
		prop = new Properties();
		try {
			String file = CalendarDAO.class.getResource("/sql/calendar/calendar-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int insertSchedule(Connection conn, Calendar s) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertSchedule");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getScheduleName());
			pstmt.setString(2, s.getStartDate());
			pstmt.setString(3, s.getEndDate());
			pstmt.setString(4, s.getEmpId());
			pstmt.setString(5, s.getCategory());
			pstmt.setString(6, s.getContent());
			pstmt.setString(7, s.getPlace());
			pstmt.setString(8, String.valueOf(s.getRepeatYN()));
			pstmt.setString(9, s.getRepeatCategory());
			pstmt.setInt(10, s.getRepeatCycle());
			pstmt.setDate(11, s.getRepeatEndDate());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	
	public List<Calendar> selectEmpId(Connection conn, String empId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectEmpId");
		Calendar s = null;
		ArrayList<Calendar> lists = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				s = new Calendar();
				s.setScheduleName(rs.getString("schedule_name"));
				s.setStartDate(String.valueOf(rs.getDate("start_date")));
				s.setEndDate(String.valueOf(rs.getDate("end_date")));
				s.setEmpId(rs.getString("emp_id"));
				s.setCategory(rs.getString("category"));
				s.setContent(rs.getString("content"));
				s.setPlace(rs.getString("place"));
				s.setRepeatYN(rs.getString("repeat_yn").charAt(0));
				s.setRepeatCategory(rs.getString("repeat_category"));
				s.setRepeatCycle(rs.getInt("repeat_cycle"));
				s.setRepeatEndDate(rs.getDate("repeat_end_date"));
				lists.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return lists;
	}
}
