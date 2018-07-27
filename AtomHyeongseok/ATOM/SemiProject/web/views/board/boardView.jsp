<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, atom.board.vo.Board'%>
<%
	Board b = (Board)request.getAttribute("board");
%>
<style>
	tr>td:nth-child(2n-1){
		background-color:beige;
		width:100px;
	}
</style>
<%@ include file="/views/common/boardAside.jsp"%>
		<div class="content">
            <div class="col-md-8">
            	<h3>게시글</h3>
                <table class='table table-bordered'>
                    <tr>
                        <td>글 번호</td>
                       	<td><%=b.getBoardNo()%></td>
                       	<td>조회수</td>
                       	<td><%=b.getVisits()%></td>
					</tr>
					<tr>
                        <td>제목</td>
                        <td><%=b.getTitle()%></td>
                        <td>작성자</td>
                        <td><%=b.getWriter()%></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td colspan=3><%=b.getContent()%></td>
                    </tr>
                </table>
                <br>
                <div class='change'>
		            <input type='button' id='modify' value='수정하기' class='btn btn-primary' onclick='<%=request.getContextPath()%>/board/boardModify?board_no=<%=b.getBoardNo()%>'/>
		            <input type='button' id='delete' value='삭제하기' class='btn btn-default' onclick='<%=request.getContextPath()%>/board/boardDelete?board_no=<%=b.getBoardNo()%>'/>
		            <input type='reset' id='back' value='뒤로가기' class='btn btn-default' onclick='history.back(-1)'/>
	        	</div>
            </div>
     </div>
</section>
<%@ include file="/views/common/footer.jsp" %>