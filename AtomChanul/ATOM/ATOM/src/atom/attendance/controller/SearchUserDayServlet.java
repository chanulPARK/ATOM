package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.vo.Attendance;
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
		String searchDay = request.getParameter("searchDay");
		DateFormat df = new DateFormat();
		String today = df.today();
		String dayofweek;
		try {
			dayofweek = df.dayOfWeek(searchDay);
			request.setAttribute("dayofweek", dayofweek);
			String dday = df.dayOfWeek(today);
			request.setAttribute("dday", dday);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		String view="";
		
		if(!searchDay.trim().equals("")) {
			Attendance a = new AttendanceService().searchUserAtt(e.getEmpId(),searchDay);

			request.setAttribute("today", today);
			request.setAttribute("todate", searchDay);
			request.setAttribute("attendance", a);
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
