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
 * Servlet implementation class AdminResourceAddServlet
 */
@WebServlet("/admin/addRsc")
public class AdminResourceAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminResourceAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String rscCatecode = request.getParameter("sel1");
		String rscName = request.getParameter("rsc_name");
		String rscCondition = request.getParameter("rsc_condition");
		
//		System.out.println(rscCatecode+rscName+rscCondition+"여기 서블릿입니당");
		
		ResourceList rl = new ResourceList(rscCatecode,rscName,rscCondition);
		
		int result = new AdminResourceService().insertResource(rl);
		
		String msg = "";
		String loc = "/admin/resourcehome";
		String view = "/views/common/msg.jsp";
		
		if(result>0)
		{
			msg="새로운 자원이 추가되었습니다.";
		}
		else
		{
			msg="자원 추가를 실패하였습니다.";
			
		}
		
    	request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
//		System.out.println(rscCatecode+rscName+rscCondition);
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
