package atom.resource.emp.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.employee.model.vo.Employee;
import atom.resource.emp.reservation.model.service.ReservationService;
import atom.resource.emp.reservation.model.vo.ResourceList;

/**
 * Servlet implementation class UserResourceReturnServlet
 */
@WebServlet("/user/return")
public class UserResourceReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserResourceReturnServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int rscCode = Integer.parseInt(request.getParameter("userInputCode"));
		String startTime = request.getParameter("returnStartTime");
		
		System.out.println(rscCode+startTime+"여기 서블릿인데");
		
		ResourceList rl = new ResourceList(rscCode,startTime);
		int result = new ReservationService().returnResource(rl);
		
	   	
		String msg = "";
		String loc = "/user/reservationList";
		String view = "/views/common/msg.jsp";
		
		if(result>0)
		{
			msg="선택한 자원이 반납 되었습니다.";
		}
		else
		{
			msg="자원 반납이 실패하였습니다.";
			
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
