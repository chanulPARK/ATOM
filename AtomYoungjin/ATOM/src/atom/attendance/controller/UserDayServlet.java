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
		
		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		
		Attendance a = new AttendanceService().selectUserAtt(e.getEmpId());
		System.out.println("att : " +a);
		
		DateFormat df = new DateFormat();
		String todate = df.today();
		String today = df.today();
		String dayofweek;
		try {
			dayofweek = df.dayOfWeek(todate);
			request.setAttribute("dayofweek", dayofweek);
			String dday = df.dayOfWeek(today);
			request.setAttribute("dday", dday);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		request.setAttribute("todate", todate);
		request.setAttribute("attendance", a);
		request.setAttribute("today", today);
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
