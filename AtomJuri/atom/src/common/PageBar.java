package common;

import javax.servlet.http.HttpServletRequest;
import atom.resource.emp.reservation.model.service.ReservationService;

public class PageBar 
{
	public static String getPageBar(HttpServletRequest request, int cPage, int numPerPage)
	{
		
		//전체 자료수 구하기
		int totalContent = new ReservationService().selectResourceCount();
		
		//전체 page 수 
		int totalPage=(int)Math.ceil((double)totalContent/numPerPage);
		
		int pageBarSize = 5;
		String pageBar = "";
		
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		//이전
		if(pageNo==1) //> 페이지가 1페이지면 이동할 필요가 없음
		{
			pageBar += "<li><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
		}
		else
		{
			pageBar += "<li><a href='"+request.getContextPath()+"/user/resourceFinder?cPage="+(pageNo-1)+"'aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
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
				pageBar += "<li><a href='"+request.getContextPath()+"/user/resourceFinder?cPage="+pageNo+"'aria-label='Previous'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
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
			pageBar += "<li><a href='"+request.getContextPath()+"/user/resourceFinder?cPage="+(pageNo-1)+"'aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
		}	
		
		return pageBar;
	}
	
	
}

