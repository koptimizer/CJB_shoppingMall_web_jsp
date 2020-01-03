<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_modify.css?ver=5" rel="stylesheet" type="text/css" />

<script>
	function checkForm(){
		var frm = document.form1;
		
		if(frm.memberPw.value == ""){
			alert("기존 비밀번호를 입력해주세요.");
			frm.memberPw.focus();
			frm.memberPw.select();
			return false;
		}
		
		if(frm.memberPwN.value == ""){
			alert("새 비밀번호를 입력해주세요.");
			frm.memberPwN.focus();
			frm.memberPwN.select();
			return false;
		}
		
		if(frm.memberPwNR.value == ""){
			alert("새 비밀번호 확인에 입력해주세요.");
			frm.memberPwNR.focus();
			frm.memberPwNR.select();
			return false;
		}
		
		if(frm.memberPwN.value != frm.memberPwNR.value){
			alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
			frm.memberPwN.focus();
			frm.memberPwN.select();
			return false;
		}
		
		frm.submit();
	}
</script>

</head>
<body>
<%
	String memberId = (String)session.getAttribute("LOGIN");
	Member member = new Member();
	Connection conn = ConnectionProvider.getConnection();
	try{
		MemberDao dao = new MemberDao();
		member = dao.selectById(conn, memberId);
		JdbcUtil.close(conn);
	}catch(SQLException e){}
%>

<div id="wrap">
	<div class="main_boxs">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
	<div class="main_page">
			<div class="main_pro">
				<div class="main_box">
		<div class="form_box">
			<p1>PROFILE</p1><br/>
			<br/>
			<p2>회원정보</p2>
			<form id="form1" name="form1" method="post" action="process_modify.jsp">
				<table width="100%" border="0" cellspacing="0" cellpadding="3">
					<tr>
						<td width="25%">기존 비밀번호</td>
						<td width="75%"><input type="password" name="memberPw" id="memberPw" /></td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" name="memberPwN" id="memberPwN" /></td>
					</tr>
					<tr>
						<td>새 비밀번호 확인</td>
						<td><input type="password" name="memberPwNR" id="memberPwNR" /></td>
					</tr>
				</table>
				<p>&nbsp;</p>
				<input type="button" name="modG" id="modG" value="변경" onclick="checkForm()"/>
				<input type="button" name="back" id="back" value="HOME" onclick="location.href='main.jsp'"/>
			</form>
		</div>
	</div>
			</div>
			<jsp:include page="../UI/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>
