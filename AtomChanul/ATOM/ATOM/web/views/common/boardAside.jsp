<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, atom.board.model.vo.*"%>
<style>
	aside div.leftmenu_top {
        background: #353b47;
        color: #fff;
        text-align: center;
        height: 50px;
    }
    aside div.leftmenu_top h3{
        padding-top: 10px;
        margin: 0;
    }
    aside div.leftmenu_top h3 a{
        font-size: 20px;
        text-decoration: none;
        padding: 0 10px;
    }
    aside div.leftmenu_top h3 a:hover{
        text-decoration: none;
        color: #fff;
    }
    aside div.leftmenu_top h3 a:active{
        text-decoration: none;
        color: #fff;
    }
    aside div.leftmenu_top h3 a:visited{
        text-decoration: none;
        color: #fff;
    }
    aside div.leftmenu_top h3 a:link{
        text-decoration: none;
        color: #fff;
    }
</style>
<%@include file='/views/common/header.jsp'%>
<aside>
	<div class="leftmenu_top">
        <h3>
            <a href="<%=request.getContextPath()%>/board/boardList">게시판</a>
        </h3>
    </div>
    <!-- ./leftmenu_top -->
    <div class="leftmenu_area">
	    <div class="list-group">
	        <a class="list-group-item"
	        href="<%=request.getContextPath()%>/board/boardList?&menu=NOTICE&cPage=1"
	        aria-expanded="true">
	        	공지사항
	        </a>
            <!-- ./list-item_1 -->
            <a class="list-group-item" data-toggle="collapse" href='#collapse1' aria-expanded="true">자유게시판</a>
            <div id="collapse1" class="panel-collapse collapse in list-group">
	            <div class="panel-footer">
	                 <a href="<%=request.getContextPath()%>/board/boardList?&menu=DEPT01&cPage=1"
	                    class="list-group-item">
	                                             영업 1팀
					 </a>
	                 <a href="<%=request.getContextPath()%>/board/boardList?&menu=DEPT02&cPage=1"
	                    class="list-group-item">
	                                             영업 2팀
					 </a>
	            </div>
	        </div>
	        <a class="list-group-item"
	        href="<%=request.getContextPath()%>/board/boardList?&menu=DATA&cPage=1"
	        aria-expanded="true">
	        	자료실
	        </a>
            <a class="list-group-item" data-toggle="collapse" href='#collapse2' aria-expanded="true">게시판 관리</a>
            <div id="collapse2" class="panel-collapse collapse in list-group">
            	<div class="panel-footer">
		             <a href="<%=request.getContextPath()%>/board/createboard"
		                class="list-group-item">
		                                    게시판 생성
		             </a>
		             <a href="<%=request.getContextPath()%>/board/dropboard"
		                   class="list-group-item">
		                                    게시판 삭제
		             </a>
                </div>
            </div>
        </div>
    </div>
    <!-- /.leftmenu_area -->
</aside>