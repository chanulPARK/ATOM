package atom.task.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.employee.model.vo.Employee;
import atom.task.model.service.TaskService;
import atom.task.model.vo.Task;

/**
 * Servlet implementation class MainTaskListServlet
 * @param <JSONArray>
 */
@WebServlet("/task/mainTaskList")
public class MainTaskListServlet<JSONArray> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainTaskListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String empId = (String) request.getAttribute("empId");
		
		List<Task> demandedlist = new TaskService().mainTaskList("admin", "1-1");
		System.out.println(demandedlist);
		List<Task> reportedlist = new TaskService().mainTaskList("admin", "2-1");
		
		request.setAttribute("demandedlist", demandedlist);
		request.setAttribute("reportedlist", reportedlist);
		request.getRequestDispatcher("/views/main.jsp").forward(request, response);
		
//		JSONArray jsonArray = new JSONArray();
//		JSONObject json = null;
//
//		for(int i=0; i<demandedlist.size();i++) {
//			json = new JSONObject();
//			Task t = (Task)demandedlist.get(i);
//			json.put("title",t.getTaskTitle());
//			json.put("name",t.getEmpName());
//			jsonArray.add(json);
//		}
//
//		PrintWriter out = response.getWriter();
//		out.print(json.toString());
//		out.flush();
//		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
