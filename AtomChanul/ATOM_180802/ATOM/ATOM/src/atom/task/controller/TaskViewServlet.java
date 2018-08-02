package atom.task.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import atom.task.model.service.TaskService;
import atom.task.model.vo.Task;
import atom.task.model.vo.TaskProcess;

/**
 * Servlet implementation class TaskViewServlet
 */
@WebServlet("/task/taskView")
public class TaskViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int taskNo = Integer.parseInt(request.getParameter("taskNo"));
		
		Task task = new TaskService().selectTask(taskNo);
		
		String view="";
		if(task!=null) {
			request.setAttribute("task", task);
			List<TaskProcess> list = new TaskService().processList(taskNo);
			System.out.println(list);
			request.setAttribute("list", list);
			view = "/views/task/taskView.jsp";
		}
		else {
			request.setAttribute("msg", "조회한 게시물이 없습니다.");
			request.setAttribute("loc", "/task/taskList");
			view="/views/common/msg.jsp";
		}
		request.setAttribute("task", task);
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
