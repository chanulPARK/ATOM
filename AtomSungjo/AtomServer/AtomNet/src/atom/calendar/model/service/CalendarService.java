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
		if(result>0) { commit(conn); System.out.println("커밋함");}
		else { rollback(conn); System.out.println("롤백함");}
		close(conn);
		return result;
	}

	public List<Calendar> selectEmpId(String empId) {
		Connection conn = getConnection();
		List<Calendar> lists = new CalendarDAO().selectEmpId(conn, empId);
		close(conn);
		return lists;
	}

}
