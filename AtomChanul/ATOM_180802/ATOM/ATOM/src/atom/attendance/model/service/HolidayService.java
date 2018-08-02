package atom.attendance.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import atom.attendance.model.dao.HolidayDAO;
import atom.attendance.model.vo.Holiday;

public class HolidayService {

	public List<Holiday> selectHoli() {
		Connection conn = getConnection();
		List<Holiday> list = new HolidayDAO().selectHoli(conn);
		close(conn);
		return list;
	}

	public Holiday searchHoli(String date) {
		Connection conn = getConnection();
		Holiday h = new HolidayDAO().searchHoli(conn, date);
		close(conn);
		return h;
	}

	public int insertHoli(Holiday h) {
		Connection conn = getConnection();
		int result = new HolidayDAO().insertHoli(conn, h);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	// 주말을 제외한 현재 월의 일 수
	public int getCnt() {
		Connection conn = getConnection();
		int cnt = new HolidayDAO().getCnt(conn);
		close(conn);
		return cnt;
	}
	// 관리자가 지정한 휴일 일 수
	public int holiCnt() {
		Connection conn = getConnection();
		int cnt = new HolidayDAO().holiCnt(conn);
		close(conn);
		return cnt;
	}

	public int getMonthCnt(String month) {
		Connection conn = getConnection();
		int cnt = new HolidayDAO().getMonthCnt(conn, month);
		close(conn);
		return cnt;
	}

	public int holiMonthCnt(String month) {
		Connection conn = getConnection();
		int cnt = new HolidayDAO().holiMonthCnt(conn, month);
		close(conn);
		return cnt;
	}

	public int deleteHoli(String date) {
		Connection conn = getConnection();
		int result = new HolidayDAO().deleteHoli(conn, date);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	// 관리자 휴일 월별 검색
	public List<Holiday> searchHoliMonth(String month) {
		Connection conn = getConnection();
		List<Holiday> list = new HolidayDAO().searchHoliMonth(conn, month);
		close(conn);
		return list;
	}

}
