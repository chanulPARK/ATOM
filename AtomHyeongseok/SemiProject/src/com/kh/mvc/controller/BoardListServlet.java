package com.kh.mvc.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.kh.mvc.board.service.BoardService;
import com.kh.mvc.board.vo.Board;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boardList.jsp")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardListServlet 실행");
		// 페이징 처리
		int numPerPage = 5;		// 한 페이지당 필요한 페이지 바 노드 개수를 5개로 고정
		int cPage;				// 현재 위치한 페이지
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e) {
			cPage = 1;			// 현재 페이지를 구할 수 없으면 1페이지 시작
		}
		
		List<Board> list = new BoardService().selectBoardList(cPage, numPerPage);
		// pageBar를 만들기 위해 전체 자료수를 먼저 가져온다.
		int totalContent = new BoardService().selectBoardCount();
		// 전체 페이지 수
		int totalPage = (int)Math.ceil((double)totalContent / numPerPage);
		int barSize = 5;		// 페이지 바의 크기는 노드 개수와 동일
		String pageBar = "";	// 페이지 바 만들기
		int pageNo = ((cPage-1)/barSize)*barSize+1;	// 각 페이지의 첫 노드. barSize로 나눈 나머지가 항상 1이다.
		int pageEnd = pageNo+barSize-1; // 각 페이지의 마지막 노드 번호
		// pageBar 설정하기
		if(pageNo==1)			// 페이지 번호가 1이면
			pageBar += "<li><span aria-hidden='false'>"
					+"&laquo;</span></li>";		// 이전 클릭이 눌러지지 않기 위함이다.
		else					// 그 외의 숫자면
			pageBar += "<a href='"+request.getContextPath()
						+"/board/boardView?cPage="
						+(pageNo-1)+"' aria-label='Previous'>"
						+"<span aria-hidden='true'>&laquo;</span></a>";
		// 페이지 번호를 부여한다.
		while(pageNo<=pageEnd && pageNo<=totalPage) {
			if(cPage==pageNo)		// 현재 페이지에 있으면
				pageBar += "<li><span>"+pageNo+"</span></li>";
			else					// 그렇지 않으면
				pageBar += "<a href='"+request.getContextPath()
				+"/board/boardView?cPage="+pageNo+"'>"+pageNo+"</a>";
			pageNo++;		// 페이지 범위를 정하지 않으면 무한반복하기 때문에 반드시 증감식을 넣어야 한다.
		}
		if(cPage>=totalPage)				// 현재 페이지가 전체의 마지막 페이지에 도달하면
			pageBar += "<li><span aria-hidden='false'>&raquo;</span></li>";
		else								// 현재 페이지가 아직 전체의 마지막 페이지에 가지 않았다면
			pageBar += "<a href="+request.getContextPath()
					+"/board/boardView?cPage="
					+pageNo+" aria-label='Next'>"
					+"<span aria-hidden='true'>&raquo;</span></a>";
		// 페이지 바 구성 종료 후
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
