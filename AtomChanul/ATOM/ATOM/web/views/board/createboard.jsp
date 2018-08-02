<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.io.*, java.sql.Date'%>
<%@ include file="/views/common/boardAside.jsp"%>
<section>
	<div class="content">
	    <div class="col-md-6">
	        <h3>새 게시판 생성</h3>
	        <p>아래의 메뉴로 게시판을 생성할 수 있습니다.</p>
	        <table class="table table-hover">
	                            <!-- <colgroup>
	                                <col style="width: 50px; border:1px solid black"/>
	                                <col style="width: 200px;"/>
	                            </colgroup> -->
	             <tbody class="table-condensed">
	                   <tr>
	                       <th scope="col" id="row" class="text-center" name='boardName'>
	                                                             게시판 이름
	                       </th>
	                       <td class="text-center">
	                           <input type="text" class="form-control input-sm">
	                       </td>
	                   </tr>
	                   <tr>
	                       <th scope="col" id="row" class="text-center">
	                                                              분류
	                       </th>
	                       <td class="text-center">
	                       		<button class="btn btn-primary left btn-sm">
	                                                                    게시판 분류
	                       		</button>
	                       </td>
	                   </tr>
	             </tbody>
	        </table>
	        <form method='post'>
		        <div id='show' style='border:1px solid black;height:332px;' class='col-md-12'>
					
		        </div>
		        <input type='submit' name='create' value='생성하기' class='btn btn-primary'/>
	        </form>
	        <script>
	            var doc = document.getElementById("show");
	            $('button').click(function(){
	                 doc.innerHTML = "<p class='glyphicon glyphicon-folder-close'>게시판</p>";
	                 $('p.glyphicon.glyphicon-folder-close').click(function(){
		                 doc.innerHTML += "<br><ul class='glyphicon glyphicon-folder-close' id='notice'>공지사항</ul>";
		                 doc.innerHTML += "<br><ul class='glyphicon glyphicon-folder-close' id='freeboard'>자유게시판</ul>";
		                 $('ul#freeboard.glyphicon.glyphicon-folder-close').click(function(){
		                	 doc.innerHTML += "<li>부서 1팀</li><li>부서2팀</li>";
		                 });
		                 doc.innerHTML += "<br><ul class='glyphicon glyphicon-folder-close' id='data'>자료실</ul>";
		                 doc.innerHTML += "<br><ul class='glyphicon glyphicon-folder-close' id='question'>설문조사</ul>";
		             });
	            });
	        </script>
	    </div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp" %>