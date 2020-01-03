<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_login.css?ver=7" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function checkLogin(){
	var f = document.form1;
	// 아이디
	if(f.memberId.value == "") {
		alert("아이디를 입력하지 않았습니다.");
		f.memberId.focus();
        f.memberId.select();
		return false;
	}

	// 비밀번호
	if(f.memberPw.value == "") {
		alert("비밀번호를 입력하지 않았습니다.");
		f.memberPw.focus();
	    f.memberPw.select()
		return false;
	}
	f.submit();
}
</script>
</head>

<body>
	<div id="wrap">
		<div class="main_boxs">
			<jsp:include page="../UI/banner.jsp"></jsp:include>
	<div class="main_page">
			<div class="main_pro">
				<div class="main_box">
			<div class="form_box">
				<form id="form1" name="form1" method="post" action="process_loginResult.jsp">
					<table width="100%" border="0" cellspacing="0" cellpadding="3">
						<tr>
							<td width="28%">아이디</td>
							<td width="72%"><label for="memberId2"></label>
								<input type="text" name="memberId" id="memberId2" /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><label for="memberPw"></label>
								<input type="password" name="memberPw" id="memberPw" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<!-- 그 부분 -->
							<td><input type="button" id = "login" value="LOGIN" onclick="checkLogin()" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><a href="../mainPage/main.jsp"><img src="../images/logo/mainLogo.png" width="50%" height="auto" id="logo" onclick="location.href='main.jsp'"/></a></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>아직 회원이 아니신가요?</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="button" name="join" id="join" value="JOIN US" onclick="location.href='join.jsp'"/></td>
						</tr>
					</table>
				</form>				
			</div>
		</div>	
			</div>
		<jsp:include page="../UI/footer.jsp"></jsp:include>
</div>
</body>
</html>