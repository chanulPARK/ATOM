<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, java.sql.*'%>
<%
	Board b = (Board)request.getAttribute("board");
%>
<%@ include file="/views/common/boardAside.jsp"%>
<style>
	tr>td:nth-child(1){
		padding:10px;
		background-color:beige;
	}
</style>
		<div class="content">
            <div class="col-md-8">
                <h3>글 수정하기</h3>
                <form action="<%=request.getContextPath()%>/board/boardModifyEnd.jsp?board_no=<%=b.getBoardNo()%>"
                	method="post" enctype="multipart/form-data">
                    <table class='table table-bordered'>
                        <thead>
                            <tr>
                                <td>제목</td>
                                <td>
                                	<input type="text" name="title"
                                		   id='title' class='form-control'
                                		   required/>
                                </td>
                            </tr>
                            <tr>
                            	<td>작성자</td>
                                <td>
                                	<input type="hidden" name="writer"
                                		   id='writer' class='form-control'
                                		   value='<%="관리자"%>'/>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr>
                                <td>첨부</td>
                                <td>
                                    <input type='file' name="file" id="file"/>
                                </td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea cols=60 rows=15 class='form-control'
                                    		  style='resize:none;'
                                    		  name='content'>
                                   	</textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <div class='commit'>
                        <input type='submit' id='modify' value='확인'
                        	   class='btn btn-primary'
                        	   onclick='return modifyCheck()'/>
                        <input type='reset' id='reset' value='취소'
                        	   class='btn btn-default'
                        	   onclick='history.back(-1)'/>
                       	<!-- onclick 속성 값은 바로 직전 페이지로 되돌아감을 의미한다. -->
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid">
        	
        </div>
        <script>
			function modifyCheck(){
				var title = $("[name=title]").val();
				var content = $("[name=content]").val();
				
				if(title.trim().length==0 || content.trim().length==0){
					if(title.trim().length==0 && content.trim().length>0)
						alert("제목을 입력하시오.");
					else if(title.trim().length>0 && content.trim().length==0)
						alert("내용을 입력하시오.");
					else
						alert("제목과 내용을 입력하시오.");
					return false;
				}
				return true;
			}
		</script>
</section>
<%@ include file="/views/common/footer.jsp" %>