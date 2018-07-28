<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %> <!-- 정적 처리방식 -->
 <%@ include file="/views/common/leftNav.jsp" %>


  
    <div class="col-sm-8 text-left"> <!-- container 영역  --> 

     <div class="container">
		 <div style="margin-bottom: 1%;">

   <h2>

    직급관리<small>ATOM</small>

   </h2>

   <div>

    <ul class="nav nav-pills nav-justified">

     <li><a href="EmployeeList.jsp">직급목록</a></li>
     <li class="active"><a href="DepartmentList.jsp">직급추가</a></li>
     <li><a href="PositionList.jsp">직급수정</a></li>
     <li><a href="PositionList.jsp">직원삭제</a></li>

    

    </ul>

   </div>

  </div>
	
	<div class="row">
 


  <div class="panel panel-default">

   <div class="panel-heading">직위 입력</div>

   <div class="panel-body" id="demo">

    <form role="form" action="PositionInsert.jsp" method="post">

     <div class="form-group">

      <input type="text" class="form-control" id="positionName" name="positionName"

       placeholder="직위명 (30자 이내)" maxlength="30" required="required">

     </div>

     <!-- <div class="form-group">

      <input type="text" class="form-control" id="minBasicPay" name="minBasicPay"

       placeholder="최소기본급" required="required">

     </div> -->

     <button type="submit" class="btn btn-default">Submit</button>

    </form>



   </div>

  </div>

  <div class="panel panel-default">

   <div class="panel-heading">직위 출력</div>

   <div class="panel-body">

    <table class="table">

     <thead>

      <tr>

       <th>번호</th>

       <th>직위명</th>

      <!--  <th>최소기본급</th> -->

       <th></th>

      </tr>

     </thead>

     <tbody>

      <tr>

       <td>1</td>

       <td>사원</td>

  

       <td><button type="button" class="btn btn-default btn-sm">Delete</button></td>

      </tr>

     </tbody>

    </table>



   </div>

  </div>

 </div>

</div>	<!-- 추가 -->
</div>   <!-- 추가 -->


   

      <%@ include file="/views/common/footer.jsp" %>


