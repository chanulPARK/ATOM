package atom.electronic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atom.electronic.model.service.ElectronicService;
import atom.electronic.model.vo.ElectronicApproval;
import atom.employee.model.vo.Employee;

/**
 * Servlet implementation class ElectonicRequesetFinderServlet
 */
@WebServlet("/electronic/electonicRequesetFinder")
public class ElectonicRequesetFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElectonicRequesetFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String searchWord=request.getParameter("searchWord");
		
		
		HttpSession session = request.getSession();
		Employee e = (Employee)session.getAttribute("empLoggedIn");
		
		//페이징 처리
		int numPerPage;
		int cPage;
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}
		catch (NumberFormatException e1) {
			cPage=1;
			numPerPage = 10;
		}
		

		String FromDate = request.getParameter("FromDate");
		String ToDate = request.getParameter("ToDate");
		
		List<ElectronicApproval> list = new ElectronicService().selectRequestApproval(e.getEmpId(),searchType, searchWord, cPage, numPerPage, FromDate, ToDate);

		
		
		
		//pageBar만들기!! 만들어 볼까요?!
				//전체 자료수
				int totalContent=new ElectronicService().selectRequestApprovalCount(e.getEmpId());
				String pageBar="";

				//전체 page수
				if(totalContent != 0) {
					int totalPage=(int)Math.ceil((double)totalContent/numPerPage);
					int barSize=5;
					int pageNo=(cPage-1)/barSize*barSize+1;
					
					int pageEnd=pageNo+barSize-1;
					
					//pagebar만들기!!
					if(pageNo==1)
					{
						pageBar+="<li>\r\n" + 
								"<a href=\"#\" aria-label=\"Previous\">\r\n" + 
								"<span aria-hidden=\"true\">&lsaquo;</span>\r\n" + 
								"</a>\r\n" + 
								"</li>"; //이거
					}
					else
					{
//						pageBar+="<a href='"+request.getContextPath()+"/electronic/electronicWaitingBox?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>[이전]</a>";
						pageBar+="<li>\r\n" + 
									"<a href='"+request.getContextPath()+"/electronic/electronicRequestBox?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"' aria-label='Previous'>" + 
										"<span aria-hidden='true'>&lsaquo;</span>" + 
									"</a>" + 
								"</li>";
	//					pageBar+="<a href='"+request.getContextPath()+"/admin/memberList?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>[이전]</a>";
					}
					//페이지 번호구성
					while(!(pageNo>pageEnd||pageNo>totalPage))
					{
						if(cPage==pageNo)
						{
							pageBar+= "<li class='active'><a href=''>"+pageNo+"</a></li>";
						}
						else
						{
//							pageBar+="<a href='"+request.getContextPath()+"/electronic/electronicWaitingBox?cPage="+pageNo+"'>["+pageNo+"]</a>";
							pageBar+="<li><a href='"+request.getContextPath()+"/electronic/electronicRequestBox?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
	
						}
						pageNo++;
					}
					//다음만들기
					if(pageNo>totalPage)
					{
						pageBar+="<li>\r\n" + 
								"			      <a href=\"#\" aria-label=\"Next\">\r\n" + 
								"			        <span aria-hidden=\"true\">&rsaquo;</span>\r\n" + 
								"			      </a>\r\n" + 
								"			    </li>"; // 이거
					}
					else
					{
//						pageBar+="<a href='"+request.getContextPath()+"/electronic/electronicWaitingBox?cPage="+pageNo+"'>[다음]</a>";
						pageBar+="<li>\r\n" + 
								"<a href='"+request.getContextPath()+"/electronic/electronicRequestBox?cPage="+pageNo+"&numPerPage="+numPerPage+"' aria-label='Next'>" + 
									"<span aria-hidden='true'>&rsaquo;</span>" + 
								"</a>" + 
							"</li>";
						
					}
				}
				//페이지바 구성끝!
				
				request.setAttribute("cPage", cPage);
				request.setAttribute("numPerPage", numPerPage);
				request.setAttribute("pageBar", pageBar);
				request.setAttribute("totalContent", totalContent);
		
		request.setAttribute("list", list);		
		
		request.getRequestDispatcher("/views/ElectronicApprovalManagement/electronicRequestBox.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
