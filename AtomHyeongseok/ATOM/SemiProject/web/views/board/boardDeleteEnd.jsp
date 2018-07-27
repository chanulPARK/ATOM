<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, java.sql.*'%>
<%
	int boardNo = Integer.parseInt(request.getParameter("board_no"));
%>    
<%@ include file="/views/common/boardAside.jsp"%>
</section>
<%@ include file="/views/common/footer.jsp" %>