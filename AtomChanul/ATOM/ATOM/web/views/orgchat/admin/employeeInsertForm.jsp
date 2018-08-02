<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <%@page import="atom.dept.model.vo.Dept"%>
 <%@page import="atom.job.model.vo.Job"%>
 	 <%@page import="atom.employee.model.vo.Employee"%>
<%@page import="java.util.*"%>

<%
	List<Dept>dept = (List)request.getAttribute("Dept");
	List<Job>job = (List)request.getAttribute("Job");
	List<Employee>emp = (List)request.getAttribute("Employee");
%>






<%@ include file="/views/common/header.jsp" %> <!-- 정적 처리방식 -->
 <%@ include file="/views/common/deptAside.jsp" %>



<script>

/*  //사진미리보기 
 function getThumbnailPrivew(input, targetId) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var element = window.document.getElementById(targetId);
            element.setAttribute("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
 */
 
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
 	 <li class="active"><a href="<%=request.getContextPath() %>/EndServlet">직원 추가</a></li>
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

        placeholder="입사순으로 부여" 

        required="required" disabled>

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

       <label for="deptCode">부서:</label> 
       <select

        class="form-control" id="deptCode" name="deptCode">
			
		<%for(Dept d : dept){ %>
        <option value=<%=d.getDeptCode()%>><%=d.getDeptName() %></option>
		<%}%>

       </select>

      </div>

      <div class="form-group">
       <label for="jobCode">직위:</label> 
       
       <select class="form-control"

        id="jobCode" name="jobCode">

		<%for(Job j: job){%>
        <option value=<%=j.getJobCode() %>><%=j.getJobName() %></option>
        <%}%>
        
        

       </select>

      </div>

       <%--  <div class="form-group">

       <label for="managerId">매니저 등급:</label> 
       
       <select class="form-control"

        id="managerId" name="managerId">

		<%for(Employee e: emp) {%>
		<option value=<%=e.getManagerId()%>><%=e.getManagerId()%></option>
        <%}%>
       </select>

      </div>
 --%>
     

	
		<div class="form-group">

       <label for="empPr">자기소개:</label> 
       
       <input type="text"

        class="form-control" id="empPr" name="empPr"

        placeholder="자기소개 (300자 이내)" maxlength="300" required="required">

      </div>

<!-- <div class="form-group">

<label for="empImg">이미지 업로드:</label>
	<img alt="프로필 사진" src="/image/user-empty.png" id="avatar_image" class="img-circle" width="100px" height="100px">
<input type="file" name="file" id="file" accept=".bmp, .gif, .jpg, .png" onchange="getThumbnailPrivew(this, 'avatar_image');">




</div> -->


	
		



      <button type="submit" class="btn btn-default">Submit</button>

     </form>



    </div>

   </div>

  </div>





</div>
</div>
</div>




   <%@ include file="/views/common/footer.jsp" %>


