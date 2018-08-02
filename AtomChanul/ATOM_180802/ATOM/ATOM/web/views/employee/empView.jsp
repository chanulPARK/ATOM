<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="atom.employee.model.vo.Employee" %>
<%@ include file="/views/common/header.jsp" %>
<%-- <%@ include file="/views/common/taskAside.jsp" %> --%>
<%
	Employee emp = (Employee)request.getAttribute("emp");
%>
<style>
    .mypage .mypage-tbl tr th {
        background: rgb(240, 240, 240);
        height: 40px;
    }
    .mypage .mypage-btnwrap {
        float: right;
    }
</style>
<section>
    <div class="container-fluid">
        <div class="row mypage">
            <div class="col-md-8">
                <h3>마이 페이지</h3>
                <form action="">
                    <table class="table table-default mypage-tbl">
                        <tbody class="table-condensed">
                            <colgroup>
                                <col style="width: 100px;">
                                <col style="width: 200px;">
                                <col style="width: 100px;">
                                <col style="width: 200px;">
                            </colgroup>
                            <tr>
                                <th scope="col" class="text-center">사원번호</th>
                                <td class="text-center" colspan="2"><%=emp.getEmpId() %></td>
                                <td class="text-center" rowspan="4">
                                    <img class="img-fluid img-circle" src="<%=request.getContextPath()%>/dist/img/profile.jpg" alt="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"  class="text-center">비밀번호</th>
                                <td class="text-center" colspan="2">********</td>
                            </tr>
                            <tr>
                                <th scope="col"  class="text-center">사원이름</th>
                                <td class="text-center" colspan="2"><%=emp.getEmpName() %></td>
                            </tr>
                            <tr>
                                <th scope="col"  class="text-center">주민등록번호</th>
                                <td class="text-center" colspan="2"><%=emp.getEmpRrn() %></td>
                            </tr>
                            <tr>
                                <th scope="col"  class="text-center">이메일</th>
                                <td class="text-center"><%=emp.getEmail() %></td>
                                <th scope="col"  class="text-center">연락처</th>
                                <td class="text-center"><%=emp.getPhone() %></td>
                            </tr>
                            <tr>
                                <th scope="col"  class="text-center">주소</th>
                                <td class="text-center" colspan="3"><%=emp.getAddr() %></td>
                            </tr>
                            <tr>
                                <th scope="col"  class="text-center">부서</th>
                                <td class="text-center"><%=emp.getDeptCode() %></td>
                                <th scope="col"  class="text-center">직급</th>
                                <td class="text-center"><%=emp.getJobCode() %></td>
                            </tr>
                            <tr>
                                <th scope="col"  class="text-center">입사일</th>
                                <td class="text-center"><%=emp.getHireDate() %></td>
                                <th scope="col"  class="text-center">퇴사일</th>
                                <td class="text-center"><%=emp.getEntDate()%></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-default mypage-btnwrap">저장</button>
                </form>
            </div>
        </div>
    </div>
</section>


<%@include file="/views/common/footer.jsp" %>