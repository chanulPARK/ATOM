package atom.resource.emp.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.resource.emp.reservation.model.service.ReservationService;
import atom.resource.emp.reservation.model.vo.ResourceList;

/**
 * Servlet implementation class UserResourceReturnServlet
 */
@WebServlet("/checkRscCodeDuplicateFrm")
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
		
		//유저 아이디 가져오기
		String empId = request.getParameter("empId");
		
		//사용자가 입력한 코드 받아오기
		int recheckCode = Integer.parseInt(request.getParameter("recheckCode"));
		
		boolean istrue = new ReservationService().checkReturn(empId,recheckCode);
		
		request.setAttribute("istrue", istrue);
		request.setAttribute("empId", empId);
		request.setAttribute("recheckCode", recheckCode);
		
		request.getRequestDispatcher("/views/resource/rsc_user_checkReturn").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
