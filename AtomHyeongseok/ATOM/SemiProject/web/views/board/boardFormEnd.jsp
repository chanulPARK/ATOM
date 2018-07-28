<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	// 받아오는 값들을 한글로 인코딩(글자 깨지는 상황을 막기 위함이다.)
	// boardForm.jsp의 각 속성에 입력한 데이터값을 가져온다.
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
%>
<%@ include file="/views/common/boardAside.jsp"%>
</section>
<%@ include file="/views/common/footer.jsp" %>