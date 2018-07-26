package atom.task.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.task.model.service.TaskService;
import atom.task.model.vo.Task;


/**
 * Servlet implementation class TaskSerchServlet
 */
@WebServlet("/task/taskSearch")
public class TaskSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date searchFrom = Date.valueOf(request.getParameter("searchFrom"));
		Date searchTo = Date.valueOf(request.getParameter("searchTo"));
		String searchOption = request.getParameter("searchOption");
		String searchKeyword = request.getParameter("searchKeyword");
		
		List<Task> list = null;
		switch(searchOption) {
//		case "searchUser" : list = new TaskService().selectMemberById(searchKeyword); break;
//		case "searchTitle" : list = new TaskService().selectMemberByName(searchKeyword); break;
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/task/taskList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
