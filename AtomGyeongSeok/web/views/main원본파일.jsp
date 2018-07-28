<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %> <!-- 정적 처리방식 -->
    <aside></aside>
    
     <div class="container-fluid text-center"> <!--기존 aside  -->    
  <div class="row content">
    <div class="col-sm-2 sidenav">	<!-- 네비게이션 시작 -->
		<h3>관리자페이지</h3>
	
		<a href="<%=request.getContextPath()%>/views/orgchat/admin/employeeList.jsp">전체 구성원 목록</a>
    	
     <!-- 시험테스트  아코디언 적용 해보기--> <!-- 아코디언 시작 -->
     <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
 
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        	직원관리
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingOne"> <!-- panel-collapse collapse in 오픈상태서 시작 -->
    
    
      <div class="panel-body"> <!-- 기본은 panel-body -->
			<a href="<%=request.getContextPath()%>/views/orgchat/admin/employeeInsertForm.jsp">사원 추가 </a><br>
			<a>사원 수정</a><br>
			<a>사원 삭제</a>
      </div>
    
    
    </div>
  </div> <!-- 1번 전체구성원 -->
  
  
  
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
           부서관리
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
		<a href="<%=request.getContextPath()%>/views/orgchat/admin/departmentList.jsp">부서 추가 </a><br>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          	직위관리
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
							<a href="<%=request.getContextPath()%>/views/orgchat/admin/positionList.jsp">직급 추가 </a><br>
			</div>
    </div>
  </div>


</div>	<!-- 아코디언 끝 -->
   


</div> <!-- 네비게이션  끝 수정 하지말것 -->
    

    <section>
        <div class="content">
            <div class="col-md-8">
                <h3>게시판</h3>
                <table class="table table-hover">
                    <colgroup>
                        <col style="width: 50px;"/>
                        <col style="min-width: 200px;"/>
                        <col style="width: 90px;"/>
                        <col style="width: 120px;"/>
                        <col style="width: 60px;"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="text-center">번호</th>
                            <th scope="col"  class="text-center">제목</th>
                            <th scope="col"  class="text-center">작성일</th>
                            <th scope="col"  class="text-center">작성자</th>
                            <th scope="col"  class="text-center">조회수</th>
                        </tr>
                    </thead>
                    <tbody class="table-condensed">
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                    </tbody>
                </table>
                <nav style="text-align: center">
                    <ul class="pagination pagination-sm">
                        <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                        </li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <div class="container-fluid">

        </div>

    </section>


	</div>  <!-- 레이아웃 -->
	</div>  <!-- 레이아웃 -->


    <%@ include file="/views/common/footer.jsp" %>