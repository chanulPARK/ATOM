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
import common.PageBar;


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
		
		System.out.println("ser"+searchFrom);
		System.out.println("ser"+searchTo);
		System.out.println("ser"+searchOption);
		System.out.println("ser"+searchKeyword);
		List<Task> list = null;
		if(searchKeyword=="") {
			System.out.println("공백");
			list = new TaskService().searchTask(searchFrom, searchTo);
		}
		else {
			if(searchOption=="searchUser") {
				list = new TaskService().searchTaskUser(searchFrom, searchTo, searchKeyword);
			}
			else if(searchOption=="searchTitle") {
				list = new TaskService().searchTaskTitle(searchFrom, searchTo, searchKeyword);
			}
		}
		
//		switch(searchOption) {
//		case "searchUser" : temp = new TaskService().selectMemberById(searchKeyword); break;
//		case "searchTitle" : temp = new TaskService().selectMemberByName(searchKeyword); break;
//		}
		
		
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		int numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		
//		String pageBar = PageBar.getPageBar(request, cPage, numPerPage);
		
		int totalContent = 10;
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("totalContent", totalContent);
		
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
