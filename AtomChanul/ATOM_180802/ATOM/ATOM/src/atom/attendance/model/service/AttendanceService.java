package atom.attendance.model.service;

import atom.attendance.model.dao.AttendanceDAO;
import atom.attendance.model.vo.Attendance;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

public class AttendanceService {
	// 사용자 일별 - 현재 날짜에 따른 근태 현황
	public Attendance selectUserAtt(String id) {
		Connection conn = getConnection();
		Attendance a = new AttendanceDAO().selectUserAtt(conn, id);
		close(conn);
		return a;
	}
	// 사용자 일별 - 입력 날짜에 대한 근태 정보
	public Attendance searchUserAtt(String empId, String searchDay) {
		Connection conn = getConnection();
		Attendance a = new AttendanceDAO().searchUserAtt(conn, empId, searchDay);
		close(conn);
		return a;
	}
	// 사용자 일별 - 출근 버튼 클릭시 출근 정보 추가
	public int insertAtt(Attendance att) {
		Connection conn = getConnection();
		int result = new AttendanceDAO().insertAtt(conn, att);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	// 사용자 일별 - 퇴근 버튼 클릭시 출근 정보 수정
	public int updateAtt(Attendance att) {
		Connection conn = getConnection();
		int result = new AttendanceDAO().updateAtt(conn, att);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	// 사용자 일별 - 부재 버튼 클릭시 부재 추가
	public int insertAbAtt(String date, Attendance att) {
		Connection conn = getConnection();
		int result = new AttendanceDAO().insertAbAtt(conn, date, att);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	// 사용자 월별 - 현재 월에 대한 근태정보 담아옴
	public List<Attendance> selectUserMonthAtt(String empId) {
		Connection conn = getConnection();
		List<Attendance> list = new AttendanceDAO().selectUserMonthAtt(conn, empId);
		close(conn);
		return list;
	}
	// 사용자 월별 - 입력한 월에 대한 근태 정보 담아옴
	public List<Attendance> searchUserMonthAtt(String empId, String searchMonth) {
		Connection conn = getConnection();
		List<Attendance> list = new AttendanceDAO().searchUserMonthAtt(conn, empId, searchMonth);
		close(conn);
		return list;
	}

	public List<Attendance> selectDayList() {
		Connection conn = getConnection();
		List<Attendance> list = new AttendanceDAO().selectDayList(conn);
		close(conn);
		return list;
	}

	public List<Attendance> searchDayList(String searchDate) {
		Connection conn = getConnection();
		List<Attendance> list = new AttendanceDAO().searchDayList(conn, searchDate);
		close(conn);
		return list;
	}

	public Attendance searchEmpAtt(String searchEmp) {
		Connection conn = getConnection();
		Attendance a = new AttendanceDAO().searchEmpAtt(conn, searchEmp);
		close(conn);
		return a;
	}

	public List<Attendance> selectEmpList(String empId) {
		Connection conn = getConnection();
		List<Attendance> list = new AttendanceDAO().selectEmpList(conn, empId);
		close(conn);
		return list;
	}
	// 사용자 월별 - 사용자의 모든 근태정보를 받아옴 (캘린더용)
	public List<Attendance> selectAtt(String empId) {
		Connection conn = getConnection();
		List<Attendance> list = new AttendanceDAO().selectAtt(conn, empId);
		close(conn);
		return list;
	}

	// 관리자 월별 날짜 검색
	public List<Attendance> searchMonthList(String empId, String searchMonth) {
		Connection conn = getConnection();
		List<Attendance> list = new AttendanceDAO().searchMonthList(conn, empId, searchMonth);
		close(conn);
		return list;
	}

	public Attendance searchDeptAtt(String searchDept) {
		Connection conn = getConnection();
		Attendance a = new AttendanceDAO().searchDeptAtt(conn, searchDept);
		close(conn);
		return a;
	}

	public List<Attendance> selectDeptList(String deptName) {
		Connection conn = getConnection();
		List<Attendance> list = new AttendanceDAO().selectDeptList(conn, deptName);
		close(conn);
		return list;
	}
	// 관리자 일별 - 사원 근태정보 수정
	public int updateUserAtt(String empId, String attDate, String attTime, String leaveTime, String type, String note) {
		Connection conn = getConnection();
		int result = new AttendanceDAO().updateUserAtt(conn, empId, attDate, attTime, leaveTime, type, note);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
