package atom.board.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import atom.board.model.service.BoardService;
import atom.board.model.vo.BoardCode;

/**
 * Servlet implementation class BoardAsideServlet
 */
@WebServlet("/boardAside")
public class BoardAsideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardAsideServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardName = request.getParameter("boardName");
		String menu = request.getParameter("menu");
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		List<BoardCode> boardCode=new BoardService().selectBoardCodeList(boardName, menu);
		
		request.setAttribute("boardCode", boardCode);
		request.setAttribute("boardName", boardName);
		request.setAttribute("cPage", cPage);
		request.getRequestDispatcher("/views/common/boardAside.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
