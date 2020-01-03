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
                	String memberId = request.getParameter("memberId");	
                	String password = request.getParameter("memberPw");
                	boolean loginOk = false;
                	
                	try{
                		Connection conn = ConnectionProvider.getConnection();
                		MemberDao dao = new MemberDao();
                		loginOk = dao.checkMemberPw(conn, memberId, password);
                	}catch(SQLException e){
                		
                	}
                	if(loginOk){
                		session.setAttribute("LOGIN", memberId);
                		if(memberId.equals("admin")){
                			response.sendRedirect("../admin/admin_main.jsp");
                		}else{
                			response.sendRedirect("main.jsp");
                		}
                	}else{%>
                		<script>
                		alert("로그인에 실패하였습니다.");
                		location href = "login.jsp";
                		</script>
                		<%
                	}
%>	
</body>
</html>