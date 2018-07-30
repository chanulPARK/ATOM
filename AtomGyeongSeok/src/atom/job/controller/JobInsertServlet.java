package atom.job.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.job.model.service.JobService;

/**
 * Servlet implementation class JobInsertServlet
 */
@WebServlet("/jobInsert")
public class JobInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jobName =request.getParameter("jobName"); //인풋 아이디값?
		
		int result = new JobService().insertJob(jobName);	//위에 선언된 변수를 가지고 감
		
		
		
		String msg="";
		String loc="/views/main.jsp";	//일단 메인으로
		String view="/views/common/msg.jsp";
		
		if(result>0)
		{
			msg="직급 추가을 완료하였습니다.";
		}
		else
		{
			msg="직급 추가을 실패하였습니다.";
			
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
