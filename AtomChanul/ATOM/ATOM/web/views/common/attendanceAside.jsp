<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<aside>
	<div class="leftmenu_top">
        <h3>
            <a href="#">근태관리</a>
        </h3>
    </div>
    <div class='sidebar-nav navbar-default'>
        <ul class="nav list-group" id="side-menu">
            <li>
                <a class="list-group-item" href="<%=request.getContextPath() %>/attendance/userDay" style="font-size: 17px">일별근태등록</a>
            </li>
            <li>
                <a class="list-group-item" href="<%=request.getContextPath() %>/attendance/userMonth" style="font-size: 17px">월별근태현황</a>
            </li>
        </ul>
    </div>
</aside>
