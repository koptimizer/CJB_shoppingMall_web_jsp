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
	String uploadPath = "C:\\Program Files\\apache-tomcat-9.0.24\\webapps\\termProjectFinal\\productImages";
 	int maxSize =1024 *1024 *10;
 	String flowerName = "";
	String mainPic = "";
	int price = 0;
	String pic1 = "";
	String explain1 = "";
	String pic2 = "";
	String explain2 = "";
	String pic3 = "";
	String explain3 = "";
	String type = "";
	Connection conn = ConnectionProvider.getConnection();
	try{
	    MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	    flowerName = multi.getParameter("flowerName");
		mainPic = multi.getFilesystemName("mainPic");
		price = Integer.parseInt(multi.getParameter("price"));
		pic1 = multi.getFilesystemName("pic1");
		explain1 = multi.getParameter("explain1");
		pic2 = multi.getFilesystemName("pic2");
		explain2 = multi.getParameter("explain2");
		pic3 = multi.getFilesystemName("pic3");
		explain3 = multi.getParameter("explain3");
		type = multi.getParameter("type");
		
		FlowerDao dao = new FlowerDao();
		Flower flower = new Flower(flowerName, mainPic, price, pic1, explain1, pic2, explain2, pic3, explain3,type);
		dao.insert(conn, flower);
	 } catch (Exception e) {}
	
%>
<script type="text/javascript">
alert("데이터 입력에 성공하셨습니다.");
location.href = "../mainPage/main.jsp";
</script>
</body>
</html>