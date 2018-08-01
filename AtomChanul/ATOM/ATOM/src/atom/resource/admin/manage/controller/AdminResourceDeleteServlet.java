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
 * Servlet implementation class AdminResourceDeleteServlet
 */
@WebServlet("/admin/del")
public class AdminResourceDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminResourceDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		int rscCode = Integer.parseInt(request.getParameter("delRscCode"));
		String delRscName = request.getParameter("delRscName");
		
//		System.out.println(rscCode+delRscName);
		
		int result = new AdminResourceService().deleteResource(rscCode);
	
		String msg = "";
		String loc = "/admin/resourcehome";
		String view = "/views/common/msg.jsp";
		
		if(result>0)
		{
			msg="선택하신 자원이 삭제 되었습니다.";
		}
		else
		{
			msg="자원이 삭제 실패하였습니다.";
			
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
