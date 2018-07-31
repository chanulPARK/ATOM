package atom.task.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.task.model.service.TaskService;
import atom.task.model.vo.Task;
import atom.task.model.vo.TaskProcess;

/**
 * Servlet implementation class TaskCommemtInsertServlet
 */
@WebServlet("/processInsert")
public class ProcessInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcessInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int taskNo = Integer.parseInt(request.getParameter("taskNo"));
//		int processNo = Integer.parseInt(request.getParameter("processNo"));
		String processWriter = request.getParameter("processWriter");
		String processContent = request.getParameter("processContent");
		String progress = request.getParameter("progress2");
//		Date lastReformDate = Date.valueOf(request.getParameter("lastReformDate"));
		
		TaskProcess tp = new TaskProcess();
		tp.setTaskNo(taskNo);
//		tp.setProcessNo(processNo);
		tp.setProcessWriter(processWriter);
		tp.setProcessContent(processContent);
		tp.setProgress(progress);
//		tp.setLastReformDate(lastReformDate);
		
		int result = new TaskService().processInsert(tp);
		
		String msg = "";
		String loc = "";
		String view = "/views/common/msg.jsp";
		
		if(result>0)
		{
			msg="프로세스 등록 성공!";
		}
		else {
			msg="프로세스 등록 실패!";
		}
		
		Task task = new TaskService().selectTask(taskNo);
		
		loc="/task/taskView?taskNo="+taskNo;
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
