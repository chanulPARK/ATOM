<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %> <!-- 정적 처리방식 -->
 <%@ include file="/views/common/leftNav.jsp" %>



<script>

 $(document).ready(function() {

  $("#birthday").datepicker({

   changeMonth : true,

   changeYear : true,

   dateFormat : "yy-mm-dd"

  });

 });

</script>



 

 <div class="col-sm-8 text-left"> <!-- container 영역  --> 

     <div class="container">
	
		 <div style="margin-bottom: 1%;">

   <h2>

    직원추가<small>ATOM</small>

   </h2>

   <div>

    <ul class="nav nav-pills nav-justified">

     <li><a href="<%=request.getContextPath() %>/emp/selectAll">전체직원정보</a></li>
 	 <li class="active"><a href="<%=request.getContextPath() %>/employeeInsert">직원 추가</a></li>
     <li><a href="#">직원수정</a></li>
     <li><a href="#">직원삭제</a></li>

    

    </ul>

   </div>

  </div>
	
	
	<div class="row">

  </div>

  <div class="panel-group"> <!-- 판넬로 묶어버림 -->

   <div class="panel panel-default">

    <div class="panel-heading">직원 입력</div>	<!-- 판넬 제목 -->

    <div class="panel-body">	<!-- 판넬 바디 부분 -->

     <form role="form" action="<%=request.getContextPath()%>/employeeInsert" method="post">	<!-- 서블릿으로 넘기는것 -->

     
       <div class="form-group">

       <label for="empId">사원아이디:</label>

       <input type="text"

        class="form-control " id="empId" name="empId"

        placeholder="a1800001 a는 약자 18은 입사년도 00000은 입사순서" 

        required="required">

      </div>
     
     
      <div class="form-group">

       <label for="empPw">비밀번호:</label>

       <input type="password"

        class="form-control " id="empPw" name="empPw"

        placeholder="주민번호 앞자리(NNNNNNN)"  min="1000000"  max="9999999"

        required="required">

      </div>
      
      
      <div class="form-group">

       <label for="empName">이름:</label> <input type="text"

        class="form-control" id="empName" name="empName"

        placeholder="이름 (30자 이내)" maxlength="30" required="required">

      </div>


      <div class="form-group">

       <label for="empRrn">주민등록번호:</label>

       <input type="number"

        class="form-control " id="empRrn" name="empRrn"

        placeholder="(-)하이픈 제외  13자리)"  

        required="required">

      </div>



     <div class="form-group">

       <label for="email">이메일:</label>

       <input type="email"

        class="form-control " id="email" name="email"

        placeholder="(이메일 @포함)"

        required="required">

      </div>







      <div class="form-group">

       <label for="phone">연락처:</label> <input type="text"

        class="form-control" id="phone" name="phone"

        placeholder="전화번호 (30자 이내)" maxlength="30" required="required">

      </div>

      
      <div class="form-group">

       <label for="addr">주소:</label> <input type="text"

        class="form-control" id="addr" name="addr"

        placeholder="주소 (50자 이내)" maxlength="50" required="required">

      </div>


      <div class="form-group">

       <label for="deptCode">부서:</label> <select

        class="form-control" id="deptCode" name="deptCode">

        <option value="1">개발부</option>


       </select>

      </div>

      <div class="form-group">

       <label for="jobCode">직위:</label> <select class="form-control"

        id="jobCode" name="jobCode">

        <option value="1">인턴</option>
        <option value="2">사원</option>
        <option value="3">주임</option>
        <option value="4">대리</option>
        <option value="5">과장</option>
        <option value="6">차장</option>
        
        
        

       </select>

      </div>

        <div class="form-group">

       <label for="managerId">매니저 등급:</label> <select class="form-control"

        id="managerId" name="managerId">

		<option value="1">해당사항없음</option>
        <option value="2">개발본부장</option>
		<option value="3">총무본부장</option>
		<option value="4">인사본부장</option>
       </select>

      </div>

     

	
		<div class="form-group">

       <label for="empPr">자기소개:</label> <input type="text"

        class="form-control" id="empPr" name="empPr"

        placeholder="자기소개 (300자 이내)" maxlength="300" required="required">

      </div>



      <button type="submit" class="btn btn-default">Submit</button>

     </form>



    </div>

   </div>

  </div>





</div>
</div>
</div>




   <%@ include file="/views/common/footer.jsp" %>


