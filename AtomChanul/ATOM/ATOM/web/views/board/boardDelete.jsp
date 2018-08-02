<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	tr>td:nth-child(1){
		padding:10px;
		background-color:beige;
	}
</style>
<%@ include file="/views/common/boardAside.jsp"%>
		<div class="content">
            <div class="col-md-8">
                <h3>삭제하기</h3>
                <form action="<%=request.getContextPath()%>/board/boardDeleteEnd"
                	method="post" enctype="multipart/form-data">
                    <table class='table table-bordered'>
                            <tr>
                                <td>삭제하시겠습니까?</td>
                            </tr>
                    </table>
                    <br>
                    <div class='commit'>
                        <input type="button" id='delete' value='예(삭제)'
                        	   class='btn btn-primary'
                        	   onclick='return deleteCheck()'/>
                        <input type='reset' id='reset' value='아니오(취소)'
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
			function deleteCheck(){
				alert("해당 글이 삭제되었습니다.");
				return true;
			}
		</script>
</section>
<%@ include file="/views/common/footer.jsp" %>