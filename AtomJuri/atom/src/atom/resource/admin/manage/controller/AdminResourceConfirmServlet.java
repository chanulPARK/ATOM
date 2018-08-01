package atom.resource.admin.manage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.resource.admin.manage.model.service.AdminResourceService;
import atom.resource.emp.reservation.model.vo.ResourceList;

/**
 * Servlet implementation class AdminResourceConfirmServlet
 */
@WebServlet("/admin/accept")
public class AdminResourceConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminResourceConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
				
		String empId = request.getParameter("adminEmpId");
		String startTime = request.getParameter("adminStartTime");
		
		System.out.println(empId+startTime);
		
		ResourceList rl = new ResourceList();
		
		rl.setEmpId(empId);
		rl.setStartTime(startTime);

		int result = new AdminResourceService().updateAccept(rl);
		
		System.out.println(result + "result 값임당");
		
		//DAO 다녀왔따
		String msg = "";
		String loc = "/admin/resourceAcceptList";
				
		if(result>0)
		{
			msg = "승인 처리 성공";
		}
		else
		{
			msg = "승인 처리 실패";
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
