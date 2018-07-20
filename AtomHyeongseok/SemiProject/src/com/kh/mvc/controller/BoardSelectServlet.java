package com.kh.mvc.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kh.mvc.board.service.BoardService;
import com.kh.mvc.board.vo.Board;

/**
 * Servlet implementation class BoardSelectServlet
 */
@WebServlet(name="BoardSelectServlet", urlPatterns="/boardSelect")
public class BoardSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardSelectServlet 클래스에서 실행하였습니다.");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		Board b = new BoardService().selectOne(boardNo);
		
		request.setAttribute("board", b);
		request.getRequestDispatcher("/views");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
