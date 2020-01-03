<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_mypage.css?ver=5" rel="stylesheet" type="text/css" />
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
			<form id="form1" name="form1" method="post" action="어디로 갈까요~">
				<table width="100%" border="0" cellspacing="0" cellpadding="3">
					<tr>
						<td>이름 : <%=member.getMemberName() %></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>주소 : <%=member.getMemberAdd() %></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>휴대전화 : <%=member.getMemberTel() %></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>이메일 : <%=member.getMemberEmail() %></td>
						<td>&nbsp;</td>
					</tr>
				</table>
				<p>&nbsp;</p>
				<input type="button" name="modG" id="modG" value="비밀번호 변경" onclick="location.href='modify.jsp'"/>
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
