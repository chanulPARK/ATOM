package atom.resource.emp.reservation.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import atom.resource.emp.reservation.model.service.ReservationService;
import atom.resource.emp.reservation.model.vo.ResourceList;
import common.PageBar;

/**
 * Servlet implementation class UserResourceSearchServlet
 */
@WebServlet("/user/resourceFinder")
public class UserResourceSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserResourceSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchResource = request.getParameter("searchResource");
	/*	
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		int numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		String pageBar = PageBar.getPageBar(request, cPage, numPerPage);*/
		
		List<ResourceList> list = null;
		list = new ReservationService().selectSearchResource(searchResource);
		
		//페이지바 변수 저장
	/*	request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);*/
		request.setAttribute("list", list);
		request.setAttribute("searchResource", searchResource);
		
		//페이지 이동
		request.getRequestDispatcher("/views/rsc_user_search.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
