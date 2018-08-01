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
 * Servlet implementation class UserResourceConfirmServlet
 */
@WebServlet("/user/reservationConfirm")
public class UserResourceConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserResourceConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
//		String empId = request.getParameter("empId");
		String empId = "user";
		String rscCatecode = request.getParameter("catecode");
		String rscCateName = request.getParameter("category");
		int rscCode = Integer.parseInt(request.getParameter("code"));
		String rscName = request.getParameter("name");
		String startTime = request.getParameter("start_time");
		String endTime = request.getParameter("end_time");
		
		System.out.println(startTime);
		
		ResourceList rl = new ResourceList();
		
		rl.setEmpId(empId);
		rl.setRscCatecode(rscCatecode);
	//	rl.setRscCatename(rscCateName);
		rl.setRscCode(rscCode);
	//	rl.setRscName(rscName);
		rl.setStartTime(startTime);
		rl.setEndTime(endTime);
		
		int result = new ReservationService().insertRent(rl);
		
		String msg="";
		String loc="/user/resourseHome";
		
		String view = "/views/common/msg.jsp";
		
		if(result>0)
		{
			msg="예약이 성공적으로 완료되었습니다.";
		}
		else
		{
			msg ="예약이 실패하였습니다.";
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
