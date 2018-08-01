package atom.resource.emp.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.resource.admin.manage.model.service.AdminResourceService;
import atom.resource.emp.reservation.model.service.ReservationService;
import atom.resource.emp.reservation.model.vo.ResourceList;
import common.PageBar;

/**
 * Servlet implementation class UserResourceReservationViewServlet
 */
@WebServlet("/user/reservationView")
public class UserResourceReservationViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserResourceReservationViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rscCode = Integer.parseInt(request.getParameter("rscCode"));
		System.out.println(rscCode);

		List<ResourceList> list = new ReservationService().selectReservationView(rscCode);
		List<ResourceList> timelist = new ReservationService().selectTimeView(rscCode);
		
		//페이징 처리 로직
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
		//====== 페이징 처리 다시

		//======
		
		String pageBar = PageBar.getPageBar(request,cPage,numPerPage);
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("rscCode", rscCode);
		request.setAttribute("list", list);
		request.setAttribute("timelist", timelist);
	
		if(list.isEmpty())
		{
			System.out.println("여기 서블릿인데 오류나요");
		}
		
		
			//페이지 이동
		request.getRequestDispatcher("/views/resource/rsc_user_reservationView.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
