package atom.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import atom.board.model.service.BoardService;
import atom.board.model.vo.BoardCode;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/board/boardDelete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardCode bc = new BoardCode();
		int result = new BoardService().deleteBoardCodeList(bc);
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "게시판이 정상적으로 삭제 되었습니다.";
			loc = "/views/board/boardList";
		}
		else {
			msg = "게시판 삭제를 실패하였습니다.";
			loc = "/views/common/msg.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/board/boardDelete").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
