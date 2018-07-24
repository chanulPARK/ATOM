package atom.task.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import atom.employee.model.vo.Employee;
import atom.task.model.service.TaskService;
import atom.task.model.vo.Task;

/**
 * Servlet implementation class TaskWriteEndServlet
 */
@WebServlet("/task/taskWriteEnd22")
public class TaskWriteEndServlet22 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskWriteEndServlet22() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 비즈니스 로직
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String deptCode = request.getParameter("deptCode");
		String title = request.getParameter("title");
		String taskType = request.getParameter("taskType");
		String content = request.getParameter("area2");
		
		
		Task task = new Task();
		task.setEmpId(userId);
		task.setEmpName(userName);
		task.setDeptName(deptCode);
		task.setTaskTitle(title);
		task.setCategoryName(taskType);
		task.setTaskContent(content);
		
		int result = new TaskService().insertTask(task);
		String msg = "";
		String loc = "/task/taskList";
		
		if(result>0) {
			msg = "업무 등록 성공";
		}
		else {
			msg = "업무 등록 실패";
		}
				
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
