package atom.task.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.task.model.service.TaskService;

/**
 * Servlet implementation class TaskDeleteServlet
 */
@WebServlet("/task/taskDelete")
public class TaskDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int taskNo = 0;
		int result = 0;
		
		// 체크박스로 taskNos배열이 들어온 경우 분기처리
		if(request.getParameter("taskNos")!=null) {
			String taskNos = request.getParameter("taskNos");
			String[] tempArr = taskNos.toString().split(",");
			int[] taskArr = {};
			for (int i=0; i<tempArr.length; i++) {
				taskNo = Integer.parseInt(tempArr[i]);
				result += new TaskService().deleteTask(taskNo);
			}
		}
		else {
			taskNo = Integer.parseInt(request.getParameter("taskNo"));
			result = new TaskService().deleteTask(taskNo);
		}
		
		String msg = "";
		String loc = "/";
		String view  ="/views/common/msg.jsp";
		
		if(result>0)
		{
			if(result>1) {
				msg = result+"개의 업무가 삭제되었습니다.";
				loc = "/task/taskList";
			}
			else {
				msg = "업무가 삭제되었습니다.";
				loc = "/task/taskList";
			}
		}
		else
		{
			msg = "업무 삭제에 실패하였습니다.";
			loc = "/task/taskView?taskNo="+taskNo;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
