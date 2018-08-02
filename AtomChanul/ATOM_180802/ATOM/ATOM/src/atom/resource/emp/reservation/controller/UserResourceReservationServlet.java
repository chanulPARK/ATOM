package atom.resource.emp.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.PageBar;
import atom.employee.model.vo.Employee;
import atom.resource.emp.reservation.model.service.ReservationService;
import atom.resource.emp.reservation.model.vo.ResourceList;

/**
 * Servlet implementation class UserResourceReservationServlet
 */
@WebServlet("/user/reservationList")
public class UserResourceReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserResourceReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*//회원 아이디 값 불러오기 
		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		String empId = e.getEmpId(); */
		
		String empId = "user";//이거 아니니까 나중에 바꾸기
		
	  //페이징 처리 로직
		int numPerPage = 4;
		int cPage;
		
		try
		{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e1)
		{
			cPage = 1;
		}
		
		//게시판 출력 로직 + 매개변수로 페이지 처리변수 넘겨줌
		List<ResourceList> list = new ReservationService().selectMyReservationList(empId,cPage,numPerPage);
		
		//전체 자료수 구하기
		int totalContent = new ReservationService().selectResourceCount();
		
		//전체 page 수 
		int totalPage = (int)Math.ceil((double)totalContent/numPerPage);
		
		//barsize 설정
		int barSize = 5;
		
		String pageBar = "";
		
		int pageNo = ((cPage-1)/barSize)*barSize+1;
		int pageEnd = pageNo+barSize-1;
		
		//pagebar 만들기
		
		//이전
		if(pageNo==1) //> 페이지가 1페이지면 이동할 필요가 없음
		{
			pageBar += "<li><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
		}
		else
		{
			pageBar += "<li><a href='"+request.getContextPath()+"/user/reservationList?cPage="+(pageNo-1)+"'aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
		}	
		
		//페이지 번호 
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar += "<li><a href='#'>"+pageNo+"</a></li>";
			}
			else
			{
				pageBar += "<li><a href='"+request.getContextPath()+"/user/reservationList?cPage="+pageNo+"'aria-label='Previous'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
			}
			pageNo++;
		}
		
		//다음 
		if(pageNo>totalPage) 
		{
			pageBar += "<li><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
		}
		else
		{
			pageBar += "<li><a href='"+request.getContextPath()+"/user/reservationList?cPage="+(pageNo-1)+"'aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
		}	
		
		if(!list.isEmpty())
		{
			System.out.println("여기 서블릿인데 list에 값이 있어요 ");
		}
		else
		{
			System.out.println("여기 서블릿인데 list가 null인데요 ");
		}
		
		System.out.println(list.get(0).getRscCondition());
		
		
		//페이지바 변수 저장
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);	
		request.setAttribute("list", list);
		request.setAttribute("empId",empId );
		
		
		request.getRequestDispatcher("/views/resource/rsc_user_reservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
