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
	//String uploadPath = request.getRealPath("/1111/movies");
	String uploadPath = "C:\\Program Files\\apache-tomcat-9.0.24\\webapps\\termProjectFinal\\boardImages";
 	int maxSize =1024 *1024 *10;
 	String boardName = "";
 	String memberId = "";
 	String boardProduct = "";
 	String boardContent = "";
 	String boardPicture = "";
	Connection conn = ConnectionProvider.getConnection();
	try{
	    MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	    memberId = (String)session.getAttribute("LOGIN");
	    boardName = multi.getParameter("boardName");
	    boardContent = multi.getParameter("boardContent");
	    boardPicture = multi.getFilesystemName("boardPicture");
	    boardProduct = multi.getParameter("boardProduct");
		
		BoardDao bDao = new BoardDao();
		Board board = new Board(memberId, boardName, boardContent, boardPicture, boardProduct);
		bDao.insert(conn, board);
	 } catch (Exception e) {}
	
%>
<script type="text/javascript">
alert("게시글 작성에 성공하셨습니다.");
location.href = "board.jsp";
</script>

</body>
</html>