package atom.attendance.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import atom.attendance.model.dao.TimeDAO;
import atom.attendance.model.vo.Time;

public class TimeService {
	// 현재 날짜에 대한 기준시간을 최근 순으로 가져옴
	public Time selectTime() {
		Connection conn = getConnection();
		Time t = new TimeDAO().selectTime(conn);
		close(conn);
		return t;
	}

	public List<Time> selectTimeList() {
		Connection conn = getConnection();
		List<Time> list = new TimeDAO().selectTimeList(conn);
		close(conn);
		return list;
	}

	public int insertTime(Time t) {
		Connection conn = getConnection();
		int result = new TimeDAO().insertTime(conn, t);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteTime(String date) {
		Connection conn = getConnection();
		int result = new TimeDAO().deleteTime(conn, date);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	// 입력 날짜에 대한 기준시간 가져옴
	public Time searchTime(String searchDay) {
		Connection conn = getConnection();
		Time t = new TimeDAO().searchtTime(conn, searchDay);
		close(conn);
		return t;
	}

}
