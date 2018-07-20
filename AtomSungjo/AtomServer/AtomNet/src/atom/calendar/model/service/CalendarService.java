package atom.calendar.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import atom.calendar.model.dao.CalendarDAO;
import atom.calendar.model.vo.Calendar;

public class CalendarService {

	public int insertSchedule(Calendar s) {
		Connection conn =getConnection();
		int result = new CalendarDAO().insertSchedule(conn,s);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<Calendar> selectEmpId(String empId) {
		Connection conn = getConnection();
		List<Calendar> lists = new CalendarDAO().selectEmpId(conn, empId);
		close(conn);
		return lists;
	}

	public Calendar selectScheduleId(int scheduleId) {
		Connection conn = getConnection();
		Calendar s = new CalendarDAO().selectScheduleId(conn, scheduleId);
		close(conn);
		return s;
	}

	public int updateSchedule(Calendar s) {
		Connection conn =getConnection();
		int result = new CalendarDAO().updateSchedule(conn,s);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteSchedule(int scheduleId) {
		Connection conn = getConnection();
		int result = new CalendarDAO().deleteSchedule(conn,scheduleId);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}

}
