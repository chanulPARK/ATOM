package atom.calendar.model.dao;

import static common.JDBCTemplate.*;
import java.io.FileReader;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
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
			System.out.println("startDate : "+ s.getStartDate());

			pstmt.setString(2, s.getStartDate());
			pstmt.setString(3, s.getEndDate());
			pstmt.setString(4, s.getEmpId());
			pstmt.setString(5, s.getCategory());
			pstmt.setString(6, s.getContent());
			pstmt.setString(7, s.getPlace());
			pstmt.setString(8, String.valueOf(s.getRepeatYN()));
			pstmt.setString(9, s.getRepeatCategory());
			pstmt.setString(10, s.getDayOfWeek());
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
				s.setScheduleId(rs.getInt("schedule_id"));
				s.setScheduleName(rs.getString("schedule_name"));
				
				String[] Dates = null;
				if(!rs.getString("repeat_category").equals("주중")){
					Dates = alldayChk(rs.getString("start_date"), rs.getString("end_date"));
				}
				
				if(Dates == null) {
					s.setStartDate(rs.getString("start_date"));
					s.setEndDate(rs.getString("end_date"));
				}else {
					s.setStartDate(Dates[0]);
					s.setEndDate(Dates[1]);
				}
				s.setEmpId(rs.getString("emp_id"));
				s.setCategory(rs.getString("category"));
				s.setContent(rs.getString("content"));
				s.setPlace(rs.getString("place"));
				s.setRepeatYN(rs.getString("repeat_yn").charAt(0));
				s.setRepeatCategory(rs.getString("repeat_category"));
				s.setDayOfWeek(rs.getString("REPEAT_CYCLE"));
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
	public Calendar selectScheduleId(Connection conn, int scheduleId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectScheduleId");
		Calendar s = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scheduleId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				s = new Calendar();
				s.setScheduleId(rs.getInt("schedule_id"));
				s.setScheduleName(rs.getString("schedule_name"));
				s.setStartDate(rs.getString("start_date"));
				s.setEndDate(rs.getString("end_date"));
				s.setEmpId(rs.getString("emp_id"));
				s.setCategory(rs.getString("category"));
				s.setContent(rs.getString("content"));
				s.setPlace(rs.getString("place"));
				s.setRepeatYN(rs.getString("repeat_yn").charAt(0));
				s.setRepeatCategory(rs.getString("repeat_category"));
				s.setDayOfWeek(rs.getString("REPEAT_CYCLE"));
				s.setRepeatEndDate(rs.getDate("repeat_end_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return s;
	}
	public int updateSchedule(Connection conn, Calendar s) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateSchedule");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getScheduleName());
			pstmt.setString(2, s.getStartDate());
			pstmt.setString(3, s.getEndDate());
			pstmt.setString(4, s.getCategory());
			pstmt.setString(5, s.getContent());
			pstmt.setString(6, s.getPlace());
			pstmt.setString(7, String.valueOf(s.getRepeatYN()));
			pstmt.setString(8, s.getRepeatCategory());
			pstmt.setString(9, s.getDayOfWeek());
			pstmt.setDate(10, s.getRepeatEndDate());
			pstmt.setInt(11, s.getScheduleId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	public int deleteSchedule(Connection conn, int scheduleId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scheduleId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	
	public String[] alldayChk(String startDate, String endDate) {
		String[] startDates = startDate.split(" ");
		String[] endDates = endDate.split(" ");
		String[] rtDate = null;
		String[] temp = null;
		if(startDates[1].equals("12:00")&& startDates[2].equals("AM") && endDates[1].equals("11:59") && endDates[2].equals("PM")) {
			rtDate = new String[2];
			temp = new String[3];
			temp = startDates[0].split("/");
			rtDate[0] = temp[2] +"-" + temp[0] + "-" + temp[1];
			temp = endDates[0].split("/");
			rtDate[1] = temp[2] +"-" + temp[0] + "-" + temp[1];
		}
		return rtDate;
	}
	
}
