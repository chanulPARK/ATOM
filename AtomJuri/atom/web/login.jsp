<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	Cookie[] cookies = request.getCookies();
    	String saveId=null;
    	if(cookies!=null){
    		for(Cookie c : cookies){
    			if(c.getName().equals("saveId"))
    				saveId=c.getValue();
    		}
    	}
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>login page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/login.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
<script src='http://code.jquery.com/jquery-latest.min.js'></script>
<style>
    input[id="saveId"] {   /*체크박스*/
      position: relative;
      top: -30px;
      left: -150px;
    }
    label[for="saveId"] {   /*아이디 저장*/
      position: relative;
      top: -5px;
      left:40px;
    }
    .loginbox input[type='submit']{
	   position:relative;
	   top:-20px;
	   margin-bottom:0;
	   bottom:20px;
	}
</style>
</head>
<body>
    <div class="loginbox">
        <img src="<%=request.getContextPath()%>/resource/img/login_icon.png" class='logicon' ondragstart="return false">
        <h1><img src="<%=request.getContextPath()%>/resource/img/login_logo.png" width="250px" ondragstart="return false"></h1>
        <form action="<%=request.getContextPath()%>/login" method="post" id='loginFrm' onsubmit='return validate()'>
	        <script>
				function validate(){
					// id를 적었는지 체크
					if($('#userId').val().trim().length==0){
						alert('아이디를 입력하세요.');
						$('#userId').focus();
						return false;
					}
					// pw를 적었는지 체크
					if($('#userPw').val().trim().length==0){
						alert('패스워드를 입력하세요.');
						$('#userPw').focus();
						return false;
					}
				}
			</script>
            <p>ID</p>
            <input id='userId' type="text" name="userId" placeholder="Enter User ID" value='<%=saveId!=null?saveId:"" %>'>
            <p>PW</p>
            <input id='userPw' type="password" name="userPw" placeholder="Enter Password">
            <label for="saveId">save ID</label><input type="checkbox" id="saveId" name='saveId' <%=saveId!=null?"checked":"" %>>
            <input type="submit" value="Login">
            <h5 style="font-family: Gothic+A1;margin-top:0px;">※ ATOM 인트라넷 접속을 위한 로그인 화면입니다. </h5>
            
        </form>
    </div>
</body>
</html>
