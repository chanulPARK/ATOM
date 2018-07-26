<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, com.kh.mvc.board.vo.Board'%>
<%
	Board b = (Board)request.getAttribute("board");
%>
<style>
	tr>td:nth-child(2n-1){
		background-color:beige;
	}
</style>
<%@ include file="/views/common/header.jsp"%>
		<div class="content">
            <div class="col-md-8">
                <table>
                    <tr>
                        <td rowspan=2>글 번호</td>
                       	<td rowspan=2><%=b.getBoardNo()%></td>
					</tr>
					<tr>
                        <td>제목</td>
                        <td><%=b.getTitle()%></td>
                        <td>작성자</td>
                        <td><%=b.getWriter()%></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td rowspan=3><%=b.getContent()%></td>
                    </tr>
                </table>
                <br>
            </div>
            <div class='change'>
            	<input type='button' id='modify' value='수정하기' class='btn btn-primary'
            onclick='<%=request.getContextPath()%>/board/boardModify.jsp?board_no=<%=b.getBoardNo()%>'/>
            	<input type='button' id='delete' value='삭제하기' class='btn btn-default'
            onclick='<%=request.getContextPath()%>/board/boardDelete.jsp?board_no=<%=b.getBoardNo()%>'/>
            	<input type='reset' id='back' value='뒤로가기'
            		   class='btn btn-default' onclick='history.back(-1)'/>
            </div>
        </div>

        <div class="container-fluid">

        </div>
<%@ include file="/views/common/footer.jsp" %>