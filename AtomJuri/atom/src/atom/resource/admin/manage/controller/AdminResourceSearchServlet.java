package atom.resource.admin.manage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.resource.admin.manage.model.dao.AdminReservationDAO;
import atom.resource.admin.manage.model.service.AdminResourceService;
import atom.resource.emp.reservation.model.service.ReservationService;
import atom.resource.emp.reservation.model.vo.ResourceList;
import common.PageBar;

/**
 * Servlet implementation class AdminResourceSearchServlet
 */
@WebServlet("/admin/resourceFinder")
public class AdminResourceSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminResourceSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminSearchResource = request.getParameter("adminSearchResource");
		
		List<ResourceList> list = null;
		list = new AdminResourceService().selectAdminSearchResource(adminSearchResource);
		
		int numPerPage = 4;
		int cPage;
		
		try
		{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e)
		{
			cPage = 1;
		}
		
		
		String pageBar = PageBar.getPageBar(request,cPage,numPerPage);
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("adminSearchResource", adminSearchResource);
		request.setAttribute("list", list);
		
		
		if(list==null)
		{
			System.out.println("search서블릿인데 list가 null입니당");
		}
		
		//페이지 이동
		request.getRequestDispatcher("/views/rsc_admin_home.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
