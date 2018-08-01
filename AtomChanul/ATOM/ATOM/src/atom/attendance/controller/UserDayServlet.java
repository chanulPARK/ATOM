package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.service.TimeService;
import atom.attendance.model.vo.Attendance;
import atom.attendance.model.vo.Time;
import atom.employee.model.vo.Employee;
import common.DateFormat;

/**
 * Servlet implementation class UserDayServlet
 */
@WebServlet("/attendance/userDay")
public class UserDayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 한 정보 가져옴
		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		
		// 현재 날짜에 대한 출근 정보 가져옴
		Attendance a = new AttendanceService().selectUserAtt(e.getEmpId());
		
		// 현재 날짜에 대한 기준 시간 가져옴 (현재 날짜에 맞는 최신정보만)
		Time t = new TimeService().selectTime();
		
		DateFormat df = new DateFormat();
		String todate = df.today();
		String today = df.today();
		String dayofweek;
		String add="00:00";
		String late="00:00";
		try {
			dayofweek = df.dayOfWeek(todate);
			request.setAttribute("dayofweek", dayofweek);
			String dday = df.dayOfWeek(today);
			request.setAttribute("dday", dday);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		// 근태 데이터가 있는 경우
		if(a!=null) {
			// 근무시간이 존재하면 00:00 형태를 00시간00분 형태로 변경
			if(a.getWorkTime()!=null)
				a.setWorkTime(df.timeType(a.getWorkTime()));
			// 지각 했으면 지각시간을 기준시간과 비교하여 출력
			if(a.getAttTime()!=null) {
				if(a.getAttType().contains("지각"))
					late = df.timeGap(t.getStAtt(), a.getAttTime());
			}
			// 조퇴 안했으면(정상퇴근했으면) 연장시간을 기준시간과 비교하여 출력
			if(a.getLeaveTime()!=null) {
				if(!a.getAttType().contains("조퇴"))
					add = df.timeGap(t.getStLeave(), a.getLeaveTime());
			}
		}

		request.setAttribute("time", t);
		request.setAttribute("attendance", a);
		request.setAttribute("todate", todate);
		request.setAttribute("today", today);
		request.setAttribute("late", df.timeType(late));
		request.setAttribute("add", df.timeType(add));
		String view="/views/attendance/user_day.jsp";
		request.getRequestDispatcher(view).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
