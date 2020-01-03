<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
     <%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String boardId = request.getParameter("boardId");
Connection conn = ConnectionProvider.getConnection();
try{
	BoardDao bDao = new BoardDao();
	bDao.deleteById(conn, boardId);
 } catch (Exception e) {}

%>
<script type="text/javascript">
alert("게시글을 삭제하셨습니다.");
location.href = "admin_board.jsp";
</script>

	

</body>
</html>