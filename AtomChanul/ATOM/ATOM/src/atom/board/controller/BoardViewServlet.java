package atom.board.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import atom.board.model.service.BoardService;
import atom.board.model.vo.Board;

/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/board/boardView.jsp")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("board_no"));
		System.out.println(boardNo);
		
		// 클라이언트가 보낸 쿠키를 확인한다.
		Cookie[] cookies = request.getCookies();
		String boardCookieVal = "";					// 쿠키의 값은 문자열이다.
		boolean hasRead = false;					// 쿠키의 값을 읽었는지를 확인한다.
		if(cookies!=null) {							// 쿠키가 있다면
			outer:
				for(Cookie c : cookies) {
					String name = c.getName();		// 쿠키의 키 이름
					String value = c.getValue();	// 쿠키의 키 속에 있는 값
					if("boardCookie".equals(name)) {
						boardCookieVal = value;
						if(value.contains("|"+boardNo+"|")) {
							hasRead = true;
							break outer;
						}
					}
				}
		}
		if(!hasRead) {			// 쿠키를 읽지 않았다면 쿠키를 만들어서 저장한다.
			Cookie boardCookie = new Cookie
					("boardCookie", boardCookieVal+"|"+boardNo+"|");
			boardCookie.setMaxAge(-1);			// 세션이 끊어지면 지운다.
			response.addCookie(boardCookie);
		}
		Board b = new BoardService().selectOne(boardNo, hasRead);
		
		String view = "";
		if(b!=null) {
			request.setAttribute("board", b);
			view="/views/board/boardView.jsp";
		}
		else {
			request.setAttribute("msg", "조회한 게시물이 삭제되었거나 존재하지 않습니다.");
			request.setAttribute("loc", "/board/boardList.jsp");
			view="/views/common/msg.jsp";
		}
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
