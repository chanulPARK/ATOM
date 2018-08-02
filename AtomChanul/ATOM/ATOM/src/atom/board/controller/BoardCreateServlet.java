package atom.board.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import atom.board.model.service.BoardService;
import atom.board.model.vo.BoardCode;

/**
 * Servlet implementation class BoardCreateServlet
 */
@WebServlet("/board/createboard")
public class BoardCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardCode bc = new BoardCode();
		int result = new BoardService().insertBoardCodeList(bc);
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "게시판이 추가되었습니다.";
			loc = "/views/board/boardList.jsp";
		}
		else {
			msg = "게시판 추가를 실패하였습니다.";
			loc = "/views/common/msg.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/board/createboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
