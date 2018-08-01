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
    input[id="saveId"] {   /*üũ�ڽ�*/
      position: relative;
      top: -30px;
      left: -150px;
    }
    label[for="saveId"] {   /*���̵� ����*/
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
					// id�� �������� üũ
					if($('#userId').val().trim().length==0){
						alert('���̵� �Է��ϼ���.');
						$('#userId').focus();
						return false;
					}
					// pw�� �������� üũ
					if($('#userPw').val().trim().length==0){
						alert('�н����带 �Է��ϼ���.');
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
            <h5 style="font-family: Gothic+A1;margin-top:0px;">�� ATOM ��Ʈ��� ������ ���� �α��� ȭ���Դϴ�. </h5>
            
        </form>
    </div>
</body>
</html>
