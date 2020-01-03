<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
					request.setCharacterEncoding("utf-8");
                	String memberId = (String)session.getAttribute("LOGIN");
                	String memberPw = request.getParameter("memberPwNR");
                	Connection conn = ConnectionProvider.getConnection();
                	try{
                		MemberDao mDao = new MemberDao();
                		mDao.modifyPassword(conn, memberId, memberPw);
                	}catch(SQLException e){}
	%>
	<script>
		alert("비밀번호가 변경되었습니다.");
		location.href = "mypage.jsp";
	</script>
</body>
</html>