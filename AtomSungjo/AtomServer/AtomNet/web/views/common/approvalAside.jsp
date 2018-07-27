<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside>
      <div class="sidenav">
        <div class="sidemenu">
          <button class="dropdown-btn">기안
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-container">
            <a href="<%=request.getContextPath()%>/electronic/electronicApprovalForm">기안문작성</a>
            <a href="<%=request.getContextPath()%>/electronic/electronicRequestBox">결재요청함</a>
          </div>
        </div>
        <div class="sidemenu">
          <button class="dropdown-btn">결재
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-container">
            <a href="<%=request.getContextPath()%>/electronic/electronicWaitingBox">결재대기함</a>
            <a href="<%=request.getContextPath()%>/electronic/electronicProgressBox">결재진행함</a>
            <a href="<%=request.getContextPath()%>/electronic/electronicCompletionBox">완료문서함</a>
            <a href="<%=request.getContextPath()%>/electronic/electronicReturnBox">반려문서함</a>
          </div>
        </div>
      </div>
    </aside>
