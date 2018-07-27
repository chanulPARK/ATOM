package atom.calendar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.calendar.model.service.CalendarService;
import atom.calendar.model.vo.Calendar;
import atom.employee.model.vo.Employee;

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
		HttpSession session = request.getSession();
		Employee e = (Employee)session.getAttribute("empLoggedIn");
		List<Calendar> lists = new CalendarService().selectEmpId(e.getEmpId());
		List<Calendar> noticeLists = new CalendarService().selectAdminCode();
		List<Calendar> deptLists = new CalendarService().selectDeptCode(e.getDeptCode(), e.getEmpId());
		
		request.setAttribute("list", lists);
		request.setAttribute("noticeLists", noticeLists);
		request.setAttribute("deptLists", deptLists);
		
		
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
