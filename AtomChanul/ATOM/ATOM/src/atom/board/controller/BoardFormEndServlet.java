package atom.board.controller;
import java.io.*;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import atom.board.model.service.BoardService;
import atom.board.model.vo.Board;
import atom.board.model.vo.BoardCode;

/**
 * Servlet implementation class BoardFormEndServlet
 */
@WebServlet("/board/boardFormEnd")
public class BoardFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFormEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 파일이 제대로 들어왔는지 확인한다. 여기서는 multipart로 제대로 갔는지를 말한다.
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg",
						"게시판 작성 오류[form : enctype 관리자에게 문의하시오.]");
			request.setAttribute("loc", "/board/boardList");
			request.getRequestDispatcher("/views/common/msg.jsp")
					.forward(request, response);
			return;
		}
		// 저장 경로를 설정하기에 앞서, 저장할 곳의 폴더를 생성해야 한다.
		String root = getServletContext().getRealPath("/");
		String saveDir = root+"upload"+File.separator+"board";	// 저장 경로 설정 완료
		// 파일 크기를 설정한다.
		int maxSize = 1024*1024*10;		// 10MB(10 메가바이트)
		// 파일을 업로드하는 객체 생성
		MultipartRequest mpReq
			= new MultipartRequest(request, saveDir, maxSize, "UTF-8",
					new DefaultFileRenamePolicy());	// 파일 업로드 완료
		// 비지니스 로직 구성
		// Board 객체를 생성하기 위해 필요한 파라미터를 가져온다(여기서는 MultipartRequest를 써야 한다).
		String title = mpReq.getParameter("title");
		String writer = mpReq.getParameter("writer");
		// 사용자가 올린 이름의 파일명을 가져온다.
//		String origin = mpReq.getOriginalFileName("file");
//		// 정책에 rename된 파일명
//		String rename = mpReq.getFilesystemName("file");
		String content = mpReq.getParameter("content");
		String boardName = mpReq.getParameter("boardName");
		String boardCode = "";
		
		ArrayList<String> bCode = new ArrayList<String>();
		bCode.add(0, "NOTICE");
		bCode.add(1, "DEPT01");
		bCode.add(2, "DEPT02");
		bCode.add(3, "DATA");
		bCode.add(4, "QUESTION");
		
		Board b = new Board();
		b.setTitle(title);
		b.setWriter(writer);
		b.setContent(content);
		switch(boardName) {
		case "공지사항":
			boardCode = bCode.get(0);
			break;
		case "영업 1팀":
			boardCode = bCode.get(1);
			break;
		case "영업 2팀":
			boardCode = bCode.get(2);
			break;
		case "자료실":
			boardCode = bCode.get(3);
			break;
		case "설문조사":
			boardCode = bCode.get(4);
			break;
		}
		b.setBoardCode(boardCode);
		switch(boardCode) {
		case "NOTICE":
			boardName = "공지사항";
			break;
		case "DEPT01":
			boardName = "영업 1팀";
			break;
		case "DEPT02":
			boardName = "영업 2팀";
			break;
		case "DATA":
			boardName = "자료실";
			break;
		case "QUESTION":
			boardName = "설문조사";
			break;
		}
		b.setBoardName(boardName);
		System.out.println(b);
		// DAO에 전달한다.
		int result = new BoardService().insertBoard(b);
		String msg = "";
		String loc = "/board/boardList";
		if(result>0)
			msg="등록하였습니다.";
		else
			msg="등록 실패하였습니다.";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("board", b);
		request.setAttribute("boardName", boardName);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
