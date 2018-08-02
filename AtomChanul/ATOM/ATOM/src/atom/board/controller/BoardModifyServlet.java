package atom.board.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import atom.board.model.service.BoardService;
import atom.board.model.vo.*;

/**
 * Servlet implementation class BoardModifyServlet
 */
@WebServlet("/board/boardModify")
public class BoardModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content=request.getParameter("content");
		request.getRequestDispatcher("/views/board/boardModify").forward(request, response);
		
		Board b = new Board();
		b.setContent(content);
		
		int result = new BoardService().updateBoard(b);
		String msg="";
		String loc="/";
		String view="/views/common/msg.jsp";
		if(result>0)
			msg="게시글이 정상적으로 수정되었습니다.";
		else {
			msg="수정 실패하였습니다.";
			loc="/boardView";
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
