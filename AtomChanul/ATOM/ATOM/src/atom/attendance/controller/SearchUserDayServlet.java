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
 * Servlet implementation class SearchUserDayServlet
 */
@WebServlet("/attendance/searchUserDay")
public class SearchUserDayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUserDayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		// 입력한 날짜 데이터
		String searchDay = request.getParameter("searchDay");
		// 입력한 데이터의 기준 시간 가져옴
		Time t = new TimeService().searchTime(searchDay);
		
		DateFormat df = new DateFormat();
		String today = df.today();
		String dayofweek="";
		String view="";
		String late="00:00";
		String add="00:00";
		
		// 입력된 데이터가 있는 경우 (유효성 검사로 인해 무조건 넘어옴)
		if(!searchDay.trim().equals("")) {
			// 해당 날짜에 맞는 근태 정보 가져옴
			Attendance a = new AttendanceService().searchUserAtt(e.getEmpId(),searchDay);
			
			try {
				dayofweek = df.dayOfWeek(searchDay); // 입력일에 대한 요일
				request.setAttribute("dayofweek", dayofweek);
				String dday = df.dayOfWeek(today);
				request.setAttribute("dday", dday);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			// 근태 정보의 결과값, 지각/연장 시간 구해줌
			if(a!=null) {
				if(a.getWorkTime()!=null)
					a.setWorkTime(df.timeType(a.getWorkTime()));
				if(a.getAttTime()!=null) {
					if(a.getAttType().contains("지각"))
						late = df.timeGap(t.getStAtt(), a.getAttTime());
				}
				if(a.getLeaveTime()!=null) {
					if(!a.getAttType().contains("조퇴"))
						add = df.timeGap(t.getStLeave(), a.getLeaveTime());
				}
			}
			request.setAttribute("late", df.timeType(late));
			request.setAttribute("add", df.timeType(add));
			request.setAttribute("today", today);
			request.setAttribute("todate", searchDay);
			request.setAttribute("attendance", a);
			request.setAttribute("time", t);
			view="/views/attendance/user_day.jsp";
		} else {
			// 검색어 입력 x
			view = "/attendance/userDay";
		}
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
