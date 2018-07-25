<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, com.kh.mvc.board.vo.Board'%>
<%
	Board b = (Board)request.getAttribute("board");
%>
<%@ include file="/views/common/header.jsp"%>
<script>
	function fn_loginAlert(){
		alert("로그인 후 이용하시오.");
		$('#userId').focus();
	}
</script>
		<div class="content">
            <div class="col-md-8">
                <table>
                    <thead>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" id='title'/></td>
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
                                <textarea cols=120 rows=15></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
            </div>
        </div>

        <div class="container-fluid">

        </div>
<%@ include file="/views/common/footer.jsp" %>