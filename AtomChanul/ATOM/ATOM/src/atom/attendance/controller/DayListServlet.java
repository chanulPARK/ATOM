package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.vo.Attendance;
import common.DateFormat;

/**
 * Servlet implementation class AttDayServlet
 */
@WebServlet("/attendance/dayList")
public class DayListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DayListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Attendance> list = new AttendanceService().selectDayList();

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
		for(Attendance a : list) {
			if(a!=null && a.getWorkTime()!=null)
				a.setWorkTime(df.timeType(a.getWorkTime()));
		}
		System.out.println(list);

		request.setAttribute("list", list);
		request.setAttribute("todate", todate);
		request.setAttribute("today", today);
		String view="/views/attendance/att_day.jsp";
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
