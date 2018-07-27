package atom.dept.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.dept.model.service.DeptService;
import atom.dept.model.vo.Dept;

/**
 * Servlet implementation class DeptInsertServlet
 */
@WebServlet("/deptInsert")
public class DeptInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String deptName = (String)request.getParameter("deptName");	//이거는 jsp에서 연결고리
		System.out.println("부서명 : "+deptName);
		
		
		int result=new DeptService().insertDept(deptName);
		
		String msg="";
		String loc="/views/main.jsp";	//일단 메인으로
		String view="/views/common/msg.jsp";
		
		if(result>0)
		{
			msg="부서 추가을 완료하였습니다.";
		}
		else
		{
			msg="부서 추가을 실패하였습니다.";
			
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
