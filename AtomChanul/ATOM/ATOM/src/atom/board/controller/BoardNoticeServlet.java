package atom.board.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import atom.board.model.service.BoardService;
import atom.board.model.vo.*;

/**
 * Servlet implementation class BoardNoticeServlet
 */
@WebServlet("/common/notice")
public class BoardNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage = 1;			// 최근 페이지는 전부 1페이지에만 있다.
		int numPerPage = 5;		// 최근 게시글 5개만 읽어들이기 위함이다.
		String menu = "NOTICE";	// DB에서 값을 모두 대문자로 표기했기 때문에 여기 값도 전부 대문자로 표기해야 한다.
		List<Board> list = new BoardService().selectBoardList(cPage, numPerPage, menu);
		int totalContent = new BoardService().selectBoardCount(menu);
		
		System.out.println(list);
		request.setAttribute("list", list);
		request.setAttribute("totalContent", totalContent);
		request.getRequestDispatcher("/views/common/notice.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
