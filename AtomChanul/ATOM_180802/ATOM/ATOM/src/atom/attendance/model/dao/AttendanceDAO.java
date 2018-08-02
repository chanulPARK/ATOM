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

import atom.attendance.model.vo.Attendance;

import static common.JDBCTemplate.*;

public class AttendanceDAO {
	private Properties prop;
	
	public AttendanceDAO() {
		prop = new Properties();
		try {
			String file = AttendanceDAO.class.getResource("/sql/attendance/attendance-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	// 사용자 일별 - 현재 날짜에 따른 근태 현황
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
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return a;
	}
	// 사용자 일별 - 입력 날짜에 대한 근태 정보
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
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return a;
	}
	// 사용자 일별 - 출근 버튼 클릭시 출근 정보 추가 (att_yn을 'y'로 지정)
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
	// 사용자 일별 - 퇴근 버튼 클릭시 출근 정보 수정
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
	// 사용자 일별 - 부재 버튼 클릭시 부재 추가 (att_yn을 'n'으로 지정)
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
	// 사용자 월별 - 현재 월에 대한 근태정보 담아옴
	public List<Attendance> selectUserMonthAtt(Connection conn, String empId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectUserMonthAtt");
		Attendance att = null;
		ArrayList<Attendance> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				att = new Attendance();
				att.setEmpId(rs.getString("emp_id"));
				att.setAttDate(rs.getDate("att_date"));
				att.setAttYn(rs.getString("att_yn"));
				att.setAttTime(rs.getString("att_time"));
				att.setLeaveTime(rs.getString("leave_time"));
				att.setWorkTime(rs.getString("work_time"));
				att.setAttNote(rs.getString("att_note"));
				att.setAttType(rs.getString("att_type"));
				list.add(att);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}
	// 사용자 월별 - 입력한 월에 대한 근태 정보 담아옴
	public List<Attendance> searchUserMonthAtt(Connection conn, String empId, String searchMonth) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("searchUserMonthAtt");
		Attendance att = null;
		ArrayList<Attendance> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, searchMonth);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				att = new Attendance();
				att.setEmpId(rs.getString("emp_id"));
				att.setAttDate(rs.getDate("att_date"));
				att.setAttYn(rs.getString("att_yn"));
				att.setAttTime(rs.getString("att_time"));
				att.setLeaveTime(rs.getString("leave_time"));
				att.setWorkTime(rs.getString("work_time"));
				att.setAttNote(rs.getString("att_note"));
				att.setAttType(rs.getString("att_type"));
				list.add(att);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	public List<Attendance> selectDayList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectDayList");
		Attendance att = null;
		ArrayList<Attendance> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				att = new Attendance();
				att.setEmpId(rs.getString("emp_id"));
				att.setAttDate(rs.getDate("att_date"));
				att.setAttYn(rs.getString("att_yn"));
				att.setAttTime(rs.getString("att_time"));
				att.setLeaveTime(rs.getString("leave_time"));
				att.setWorkTime(rs.getString("work_time"));
				att.setAttNote(rs.getString("att_note"));
				att.setAttType(rs.getString("att_type"));
				att.setEmpName(rs.getString("emp_name"));
				att.setDeptName(rs.getString("dept_name"));
				att.setJobName(rs.getString("job_name"));
				list.add(att);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	public List<Attendance> searchDayList(Connection conn, String searchDate) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("searchDayList");
		Attendance a = null;
		ArrayList<Attendance> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchDate);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				a = new Attendance();
				a.setEmpId(rs.getString("emp_id"));
				a.setAttDate(rs.getDate("att_date"));
				a.setAttYn(rs.getString("att_yn"));
				a.setAttTime(rs.getString("att_time"));
				a.setLeaveTime(rs.getString("leave_time"));
				a.setWorkTime(rs.getString("work_time"));
				a.setAttNote(rs.getString("att_note"));
				a.setAttType(rs.getString("att_type"));
				a.setEmpName(rs.getString("emp_name"));
				a.setDeptName(rs.getString("dept_name"));
				a.setJobName(rs.getString("job_name"));
				list.add(a);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	public Attendance searchEmpAtt(Connection conn, String searchEmp) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("searchEmpDayAtt");
		Attendance a = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchEmp+"%");
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
				a.setEmpName(rs.getString("emp_name"));
				a.setDeptName(rs.getString("dept_name"));
				a.setJobName(rs.getString("job_name"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return a;
	}

	public List<Attendance> selectEmpList(Connection conn, String empId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectEmpList");
		Attendance att = null;
		ArrayList<Attendance> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				att = new Attendance();
				att.setEmpId(rs.getString("emp_id"));
				att.setAttDate(rs.getDate("att_date"));
				att.setAttYn(rs.getString("att_yn"));
				att.setAttTime(rs.getString("att_time"));
				att.setLeaveTime(rs.getString("leave_time"));
				att.setWorkTime(rs.getString("work_time"));
				att.setAttNote(rs.getString("att_note"));
				att.setAttType(rs.getString("att_type"));
				att.setEmpName(rs.getString("emp_name"));
				att.setDeptName(rs.getString("dept_name"));
				att.setJobName(rs.getString("job_name"));
				list.add(att);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	// 사용자 월별 - 사용자의 모든 근태정보를 받아옴 (캘린더용)
	public List<Attendance> selectAtt(Connection conn, String empId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectAtt");
		Attendance att = null;
		ArrayList<Attendance> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				att = new Attendance();
				att.setEmpId(rs.getString("emp_id"));
				att.setAttDate(rs.getDate("att_date"));
				att.setAttYn(rs.getString("att_yn"));
				att.setAttTime(rs.getString("att_time"));
				att.setLeaveTime(rs.getString("leave_time"));
				att.setWorkTime(rs.getString("work_time"));
				att.setAttNote(rs.getString("att_note"));
				att.setAttType(rs.getString("att_type"));
				list.add(att);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	// 관리자 월별 날짜 검색
	public List<Attendance> searchMonthList(Connection conn, String empId, String searchMonth) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("searchMonthList");
		Attendance att = null;
		ArrayList<Attendance> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchMonth);
			pstmt.setString(2, empId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				att = new Attendance();
				att.setEmpId(rs.getString("emp_id"));
				att.setAttDate(rs.getDate("att_date"));
				att.setAttYn(rs.getString("att_yn"));
				att.setAttTime(rs.getString("att_time"));
				att.setLeaveTime(rs.getString("leave_time"));
				att.setWorkTime(rs.getString("work_time"));
				att.setAttNote(rs.getString("att_note"));
				att.setAttType(rs.getString("att_type"));
				att.setEmpName(rs.getString("emp_name"));
				att.setDeptName(rs.getString("dept_name"));
				att.setJobName(rs.getString("job_name"));
				list.add(att);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	public Attendance searchDeptAtt(Connection conn, String searchDept) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = prop.getProperty("searchDeptDayAtt");
		Attendance a = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchDept+"%");
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
				a.setEmpName(rs.getString("emp_name"));
				a.setDeptName(rs.getString("dept_name"));
				a.setJobName(rs.getString("job_name"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return a;
	}
	
	public List<Attendance> selectDeptList(Connection conn, String deptName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectDeptList");
		Attendance att = null;
		ArrayList<Attendance> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, deptName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				att = new Attendance();
				att.setEmpId(rs.getString("emp_id"));
				att.setAttDate(rs.getDate("att_date"));
				att.setAttYn(rs.getString("att_yn"));
				att.setAttTime(rs.getString("att_time"));
				att.setLeaveTime(rs.getString("leave_time"));
				att.setWorkTime(rs.getString("work_time"));
				att.setAttNote(rs.getString("att_note"));
				att.setAttType(rs.getString("att_type"));
				att.setEmpName(rs.getString("emp_name"));
				att.setDeptName(rs.getString("dept_name"));
				att.setJobName(rs.getString("job_name"));
				list.add(att);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}
	// 관리자 일별 - 사원 근태정보 수정
	public int updateUserAtt(Connection conn, String empId, String attDate, String attTime, String leaveTime, String type, String note) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("updateUserAtt");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, attTime);
			pstmt.setString(2, leaveTime);
			pstmt.setString(3, note);
			pstmt.setString(4, type);
			pstmt.setString(5, empId);
			pstmt.setString(6, attDate);
			result=pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

}
