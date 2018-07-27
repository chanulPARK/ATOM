package atom.board.controller;
import java.io.*;
import java.net.URLEncoder;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class BoardFileDownloadServlet
 */
@WebServlet("/board/boardFileDownload.jsp")
public class BoardFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 드라이브부터 불러와야 한다.
		String saveDir = request.getServletContext().getRealPath("/upload/board");
		String rName = request.getParameter("rName");	// rName : 중복값이 없도록 설정
		String oName = request.getParameter("oName");
		
		// 입출력 스트림 연결. 네트워크 통신은 바이트 단위를 쓰기 때문에 스트림을 쓴다.
		BufferedInputStream bis = new BufferedInputStream
				(new FileInputStream(saveDir));
		// RAM에 있는 것을 빼서 클라이언트에게 정보를 바이트 단위로 쪼개서 보낸다.
		ServletOutputStream sos = response.getOutputStream();
		// 빠르게 넘기기 위해 버퍼를 썼다.
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		// 브라우저 코드 분기
		String resFileName = "";
		boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE")!=-1
					  || request.getHeader("user-agent").indexOf("Trident")!=-1;
		if(isMSIE) {
			resFileName = URLEncoder.encode(oName, "UTF-8");
			resFileName = resFileName.replaceAll("//", "%20");	// %20 : 공백
		}
		else {
			// 파일명이 한글일 때 글자가 깨지는 상황을 막기 위한 구분
			resFileName = new String(oName.getBytes("UTF-8"), "ISO-8859-1");
		}
		// 응답 헤더를 파일 전송으로 변경한다. 이건 정해져 있다.
		response.setContentType("application/octet-stream");	// 파일을 전송하는 MIME 형식
		response.setHeader("Content-Dispostion", "attachment;filename="+resFileName);
		// 파일을 브라우저한테 쓴다.
		int read=-1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		bos.close();		// bos를 제일 나중에 선언했으므로 제일 먼저 닫아준다.
		bis.close();		// bis를 제일 먼저 선언했으므로 제일 나중에 닫아준다.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
