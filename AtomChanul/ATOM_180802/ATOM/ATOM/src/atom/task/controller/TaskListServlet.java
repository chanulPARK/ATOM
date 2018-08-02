package atom.task.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.employee.model.vo.Employee;
import atom.task.model.service.TaskService;
import atom.task.model.vo.Task;
import common.PageBar;

/**
 * Servlet implementation class taskListServlet
 */
@WebServlet("/task/taskList")
public class TaskListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee emp = (Employee)request.getSession().getAttribute("empLoggedIn");
		String empId = request.getParameter("empId");
		
		System.out.println(emp);
		System.out.println(empId);
		
		String taskType = request.getParameter("taskType");
		
		// 페이징 처리
		int cPage;
		int numPerPage;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage")); 
		}
		catch (NumberFormatException e) {
			cPage = 1;
		}
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch(NumberFormatException e) {
			numPerPage = 10;
		}
		
		List<Task> list = null;
		int totalContent = 0;
		if(taskType==null) {
			list = new TaskService().selectTaskList(empId, cPage, numPerPage);
			totalContent = new TaskService().selectTaskCount(empId);
		}
		else {
			if(taskType=="1" || taskType=="2") {
				list = new TaskService().selectTaskList(empId, cPage, numPerPage, taskType);	
				totalContent = new TaskService().selectTaskCount(empId, taskType);
			}
			else if(taskType=="1-1" || taskType=="2-1") {
				list = new TaskService().selectTaskListReceiver(empId, cPage, numPerPage, taskType);	
				totalContent = new TaskService().selectTaskCountReceiver(empId, taskType);
			}
			else {
				list = new TaskService().selectTaskList(empId, cPage, numPerPage, taskType);	
				totalContent = new TaskService().selectTaskCount(empId, taskType);
			}
		}
		
		// 전체 page
		int totalPage =  (int)Math.ceil((double)totalContent/numPerPage);
		int barSiza = 3;
		String pageBar = "";
		int pageNo = ((cPage-1)/barSiza)*barSiza+1;
		int pageEnd = pageNo+barSiza-1;
		
		// page bar
		pageBar += "<ul class='pagination pagination-sm'><li>";
		
		// 이전
		if(pageNo==1) {
			pageBar += "<span aria-hidden='true'>&laquo;</span>";
		}
		else {
			pageBar += "<a href='"+request.getContextPath()+"/task/taskList?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'><span aria-hidden='true'>&laquo;</span></a>";
		}
		pageBar += "</li>";
		
		// 이동할 숫자
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar += "<li class='active'><a href='#'>"+pageNo+"</a></li>";
			}
			else {
				pageBar += "<li><a href='"+request.getContextPath()+"/task/taskList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		pageBar += "<li>";
		
		// 다음
		if(pageNo>totalPage) {
			pageBar += "<span aria-hidden='true'>&raquo</span>";
		}
		else {
			pageBar += "<a href='"+request.getContextPath()+"/task/taskList?cPage="+pageNo+"&numPerPage="+numPerPage+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
		}
		pageBar += "</li></ul>";
		
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("totalContent", totalContent);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("taskType", taskType);
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
