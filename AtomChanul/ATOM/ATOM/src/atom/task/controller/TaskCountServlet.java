package atom.task.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.electronic.model.service.ElectronicService;
import atom.employee.model.vo.Employee;
import atom.task.model.service.TaskService;

/**
 * Servlet implementation class TaskCountServlet
 */
@WebServlet("/task/taskCount")
public class TaskCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Employee e = (Employee)session.getAttribute("empLoggedIn");
		int requestCount = new TaskService().requestCount(e.getEmpId());
//		int requestReceiveCount = new TaskService().requestReceiveCount(e.getEmpId());
//		int reportCount = new TaskService().reportCount(e.getEmpId());
//		int reportReceiveCount = new TaskService().reportReceiveCount(e.getEmpId());
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(requestCount);
//		response.getWriter().print(" "+requestReceiveCount);
//		response.getWriter().print(" "+reportCount);
//		response.getWriter().print(" "+reportReceiveCount);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
