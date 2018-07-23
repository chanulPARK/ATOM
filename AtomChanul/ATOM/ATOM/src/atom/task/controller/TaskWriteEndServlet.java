package atom.task.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class TaskWriteEndServlet
 */
@WebServlet("/task/taskWriteEnd")
public class TaskWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파일 정상적으로 업로드된지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "업무보고 작성 오류[form ictype]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		// 2.저장 디렉토리 설정
		String root = getServletContext().getRealPath("/");
		String saveDir = root+"upload"+File.separator+"task";
		
		// 3. 파일 크기 설정
		int maxSize = 1024*1024*10; // 10MB
		
		// 4. 파일업로드 객체 생성 - 생성과 동시에 업로드됨
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "uft-8", new DefaultFileRenamePolicy());
		
		// 5. 비즈니스 로직
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		
		// 사용자가 올린 파일명
		String origin = mr.getOriginalFileName("up_file");
		String rename = mr.getFilesystemName("up_file");
		String content = mr.getParameter("content");
		
		Board board = new Board();
		board.setBoardTitle(title);
		board.setBoardWriter(writer);
		board.setBoardContent(content);
		board.setOriginalFileName(origin);
		board.setRenamedFileName(rename);
		
		int result = new BoardService().insertBoard(board);
		String msg = "";
		String loc = "/board/boardList";
		
		if(result>0) {
			msg = "파일업로드 성공";
		}
		else {
			msg = "파일업로드 실패";
		}
				
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
