package atom.attendance.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import atom.attendance.model.vo.Attendance;

import static common.JDBCTemplate.*;

public class AttendanceDAO {
	private Properties prop;
	
	public AttendanceDAO() {
		prop = new Properties();
		try {
			String file = AttendanceDAO.class.getResource("/sql/attendance-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Attendance selectUserAtt(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("selectUserAtt");
		Attendance a = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				a = new Attendance();
				a.setEmpId(rs.getString("emp_id"));
				a.setAttDate(rs.getDate("att_date"));
				a.setAttYn(rs.getString("att_yn"));
				a.setAttTime(rs.getString("att_time"));
				a.setLeaveTime(rs.getString("leave_time"));
				a.setWorkTime(rs.getString("work_time"));
				a.setAttNote(rs.getString("att_note"));
				a.setAttType(rs.getString("att_type"));
				a.setHoliCnt(rs.getInt("holi_cnt"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return a;
	}

	public Attendance searchUserAtt(Connection conn, String empId, String searchDay) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("searchUserAtt");
		Attendance a = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, searchDay);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				a = new Attendance();
				a.setEmpId(rs.getString("emp_id"));
				a.setAttDate(rs.getDate("att_date"));
				a.setAttYn(rs.getString("att_yn"));
				a.setAttTime(rs.getString("att_time"));
				a.setLeaveTime(rs.getString("leave_time"));
				a.setWorkTime(rs.getString("work_time"));
				a.setAttNote(rs.getString("att_note"));
				a.setAttType(rs.getString("att_type"));
				a.setHoliCnt(rs.getInt("holi_cnt"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return a;
	}

	public int insertAtt(Connection conn, Attendance att) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("insertAtt");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, att.getEmpId());
			pstmt.setString(2, att.getAttTime());
			pstmt.setString(3, att.getAttNote());
			pstmt.setString(4, att.getAttType());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int updateAtt(Connection conn, Attendance att) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("updateAtt");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, att.getLeaveTime());
			pstmt.setString(2, att.getWorkTime());
			pstmt.setString(3, att.getAttNote());
			pstmt.setString(4, att.getAttType());
			pstmt.setString(5, att.getEmpId());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int insertAbAtt(Connection conn, String date, Attendance att) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("insertAbAtt");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, att.getEmpId());
			pstmt.setString(2, date);
			pstmt.setString(3, att.getAttNote());
			pstmt.setString(4, att.getAttType());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

}
