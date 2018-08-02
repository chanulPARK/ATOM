package atom.board.controller;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import atom.board.model.service.BoardService;
import atom.board.model.vo.*;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boardList")
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
		String menu=request.getParameter("menu");
		String boardName = request.getParameter("boardName");
		
		List<BoardCode> boardCode=new BoardService().selectBoardCodeList(boardName, menu);
		request.setAttribute("boardCode", boardCode);
		request.setAttribute("boardName", boardName);
		
		// 페이징 처리
		int numPerPage = 10;		// 한 페이지당 필요한 자료의 수를 10개로 고정
		int cPage;				// 현재 위치한 페이지
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e) {
			cPage = 1;			// 현재 페이지를 구할 수 없으면 1페이지 시작
		}
		
		List<Board> list = new BoardService().selectBoardList(cPage, numPerPage, menu);
		// pageBar를 만들기 위해 전체 자료수를 먼저 가져온다.
		int totalContent = new BoardService().selectBoardCount(menu);	// 고유한 게시판 코드를 가진 각 게시판마다 자료의 수를 저장한다.
		// 전체 페이지 수
		int totalPage = (int)Math.ceil((double)totalContent / numPerPage);
		int barSize = 5;		// 페이지 바의 크기 지정
		String pageBar = "";	// 페이지 바 만들기
		int pageNo = ((cPage-1)/barSize)*barSize+1;	// 각 페이지의 첫 노드. barSize로 나눈 나머지가 항상 1이다.
		int pageEnd = pageNo+barSize-1; // 각 페이지의 마지막 노드 번호
		// pageBar 설정하기
		if(totalContent==0) {
			pageBar += "<li><span aria-hidden='false'>&laquo;</span></li>";
			pageBar += "<li class='active'><span>"+pageNo+"</span></li>";
			pageBar += "<li><span aria-hidden='false'>&raquo;</span></li>";
		}
		else if(totalContent>0) {
			if(pageNo==1)			// 페이지 번호가 1이면
				pageBar += "<li><span aria-hidden='false'>&laquo;</span></li>";		// 이전 클릭이 눌러지지 않기 위함이다.
			else					// 그 외의 숫자면
				pageBar += "<li><a href='"+request.getContextPath()+"/board/boardList?&menu="+menu+"&cPage="+pageNo+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
			// 페이지 번호를 부여한다.
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(cPage==pageNo)		// 현재 페이지에 있으면
					pageBar += "<li class='active'><span class='btn btn-primary'>"+pageNo+"</span></li>";
				else					// 그렇지 않으면
					pageBar += "<li class='active'><a href='"+request.getContextPath()+"/board/boardList?&menu="+menu+"&cPage="+pageNo+"' class='btn btn-primary'>"
							+pageNo+"</a></li>";
				pageNo++;		// 페이지 범위를 정하지 않으면 무한반복하기 때문에 반드시 증감식을 넣어야 한다.
			}
			if(pageNo>totalPage)				// 현재 페이지가 전체의 마지막 페이지에 도달하면
				pageBar += "<li><span aria-hidden='false'>&raquo;</span></li>";
			else								// 현재 페이지가 아직 전체의 마지막 페이지에 가지 않았다면
				pageBar += "<li><a href='"+request.getContextPath()+"/board/boardList?&menu="+menu+"&cPage="+pageNo+"' aria-label=Next>"
						+"<span aria-hidden='true'>&raquo;</span></a></li>";
		}
		// 페이지 바 구성 종료 후
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("totalContent", totalContent);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("numPerPage", numPerPage);
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
