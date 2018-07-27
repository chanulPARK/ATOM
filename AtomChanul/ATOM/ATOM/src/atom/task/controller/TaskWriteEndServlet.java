package atom.task.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
@WebServlet("/task/taskWriteEnd")
public class TaskWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Employee emp = (Employee)request.getSession().getAttribute("empLoggedIn");
		
		// 1. 파일 정상적으로 업로드된지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "업무보고 작성 오류[form ictype]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		// 2.저장 디렉토리 설정
		String root = getServletContext().getRealPath("/");
		System.out.println(root);
		String saveDir = root+"upload"+File.separator+"task";
		
		// 3. 파일 크기 설정
		int maxSize = 1024*1024*10; // 10MB
		
		// 4. 파일업로드 객체 생성 - 생성과 동시에 업로드됨
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		// 5. 비즈니스 로직
		String empId = mr.getParameter("userId");
		String empName = mr.getParameter("userName");
		String deptCode = mr.getParameter("deptCode");
		String jopCode = mr.getParameter("jopCode");
		
		String taskType = mr.getParameter("taskType");
		String title = mr.getParameter("title");
		String content = mr.getParameter("area2");
		
		String receiver = mr.getParameter("receiver");
		String origin = mr.getOriginalFileName("up_file");
		String rename = mr.getFilesystemName("up_file");
		Date deadline = Date.valueOf(mr.getParameter("deadline"));
		System.out.println(deadline);

		
		// String을 Date로 변환하는 과정
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//
//		java.util.Date transDate = null;
//		try {
//			transDate = transFormat.parse(deadline);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
		Task task = new Task();
		task.setEmpId(empId);
		task.setEmpName(empName);
		task.setDeptName(deptCode);
		task.setJobName(jopCode);
		// task_no는 시퀀스처리
		task.setTaskType(taskType);
		task.setTaskTitle(title);
		task.setTaskContent(content);
		task.setReceiver(receiver);
		task.setOriginalFile(origin);
		task.setRenamedFile(rename);
		// ENROLL_DATE는 db저장할때 sysdate처리
		task.setDeadline(deadline);

		
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
