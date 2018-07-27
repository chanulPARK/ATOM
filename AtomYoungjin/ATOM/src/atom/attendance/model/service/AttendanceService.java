package atom.attendance.model.service;

import atom.attendance.model.dao.AttendanceDAO;
import atom.attendance.model.vo.Attendance;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.Calendar;
import java.util.Date;

public class AttendanceService {

	public Attendance selectUserAtt(String id) {
		Connection conn = getConnection();
		Attendance a = new AttendanceDAO().selectUserAtt(conn, id);
		close(conn);
		return a;
	}

	public Attendance searchUserAtt(String empId, String searchDay) {
		Connection conn = getConnection();
		Attendance a = new AttendanceDAO().searchUserAtt(conn, empId, searchDay);
		close(conn);
		return a;
	}

	public int insertAtt(Attendance att) {
		Connection conn = getConnection();
		int result = new AttendanceDAO().insertAtt(conn, att);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updateAtt(Attendance att) {
		Connection conn = getConnection();
		int result = new AttendanceDAO().updateAtt(conn, att);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int insertAbAtt(String date, Attendance att) {
		Connection conn = getConnection();
		int result = new AttendanceDAO().insertAbAtt(conn, date, att);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
