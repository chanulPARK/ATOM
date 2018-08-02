<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/boardAside.jsp"%>
<style>
	th,td{
		text-align:center;
		font-size:20px;
	}
	tr>td:nth-child(1){
		padding:20px;
		background-color:beige;
	}
</style>
<script>
</script>
<section>
	   <div class="content">
            <div class="col-md-8">
                <h3>게시판 삭제</h3>
                <form>
                    <table border=1>
                        <thead>
                        	<tr>
                        		<td>
                        			
                        		</td>
                        		<th>분류</th>
                        		<td style="width:250px">하위 메뉴</td>
                        	</tr>
                        </thead>
                        <tbody>
                        	<tr>
                        		<td></td>
                        		<td>공지사항</td>
                        		<td></td>
                        	</tr>
                        	<tr>
                        		<td><input type='checkbox'/></td>
                        		<td rowspan=2>자유게시판</td>
                        		<td>영업 1팀</td>
                        	</tr>
                        	<tr>
                        		<td><input type='checkbox'/></td>
                        		<td>영업 2팀</td>
                        	</tr>
                        	<tr>
                        		<td><input type='checkbox'></td>
                        		<td>자료실</td>
                        		<td></td>
                        	</tr>
                        </tbody>
                    </table>
	                <br>
	                <div class='center'>
	                    <input type='submit' id='submit' value='삭제하기' class='btn btn-primary'/>
	                </div>
                </form>
            </div>
       </div>
</section>
<%@ include file="/views/common/footer.jsp" %>