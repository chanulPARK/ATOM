<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.mvc.board.*"%>
<%@ include file="/views/common/header.jsp" %>
<style>
	tr>td:nth-child(1){
		padding:10px;
		background-color:beige;
	}
</style>
		<div class="content">
            <div class="col-md-8">
                <h3>새 글 작성</h3>
                <form action="<%=request.getContextPath()%>/board/boardFormEnd"
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
                                    		  style='resize:none;'>
                                   	</textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <div class='commit'>
                        <input type='submit' id='submit' value='게시'
                        	   class='btn btn-primary'
                        	   onclick='return validate()'/>
                    </div>
                </form>
            </div>
        </div>

        <div class="container-fluid">
        	
        </div>
        <script>
			function validate(){
				var content = $("[name=content]").val();
				if(content.trim().length==0){
					alert("내용을 입력하시오.");
					return false;
				}
				return true;
			}
		</script>
<%@ include file="/views/common/footer.jsp" %>