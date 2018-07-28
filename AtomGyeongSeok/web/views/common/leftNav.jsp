<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp" %> <!-- 정적 처리방식 --> --%>
    
    
     <div class="container-fluid text-center"> <!--기존 aside  -->    
  <div class="row content">
    <div class="col-sm-2 sidenav">	<!-- 네비게이션 시작 -->
		<h3>관리자페이지</h3>
	
		<a href="<%=request.getContextPath()%>/views/orgchat/admin/employeeList.jsp">조직도</a>
    	
     <!-- 시험테스트  아코디언 적용 해보기--> <!-- 아코디언 시작 -->
     <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
 
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        	관리페이지 목록
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingOne"> <!-- panel-collapse collapse in 오픈상태서 시작 -->
    
    
      <div class="panel-body"> <!-- 기본은 panel-body -->
			<ul>
			<li><a href="<%=request.getContextPath()%>/emp/selectAll">직원관리페이지 </a></li>
			<li><a href="<%=request.getContextPath()%>/views/orgchat/admin/departmentList.jsp">부서관리페이지 </a></li>
			<li><a href="<%=request.getContextPath()%>/views/orgchat/admin/jobList.jsp">직급관리페이지 </a></li>
			</ul>
      </div>
    
    
    </div>
  </div> <!-- 1번 전체구성원 -->
  
  
  
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
           	jstree으로 간단하게
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
		<%-- <a href="<%=request.getContextPath()%>/views/orgchat/admin/departmentList.jsp">부서페이지</a><br>
		
		 <form role="form" action="<%=request.getContextPath() %>/deptlist" method="post">
				<a href="<%=request.getContextPath()%>/deptlist">부서페이지</a><br>    
		 </form> --%>
		 
		
			
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          	즐겨찾기?
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
				<%-- <ul>
				<li><a href="<%=request.getContextPath()%>/views/orgchat/admin/positionList.jsp">직급 관리 </a></li>
				<li><a href="<%=request.getContextPath()%>/views/orgchat/admin/positionList.jsp">직급 추가 </a></li>
				
				
				</ul>			
			 --%>
			</div>
    </div>
  </div>


</div>	<!-- 아코디언 끝 -->
   


</div> <!-- 네비게이션  끝 수정 하지말것 -->
    

 