package atom.calendar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.calendar.model.service.CalendarService;
import atom.calendar.model.vo.Calendar;

/**
 * Servlet implementation class ScheduleListServlet
 */
@WebServlet("/schedule/scheduleList")
public class ScheduleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empId = "EMP_ID 01";
		List<Calendar> lists = new CalendarService().selectEmpId(empId);
//		List<Calendar> lists = new CalendarService().selectDeptName();

		for (Calendar s : lists) {
			System.out.println(s);
		}
		request.setAttribute("list", lists);
		
		
		
		request.getRequestDispatcher("/views/ScheduleManagement/schedule.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
