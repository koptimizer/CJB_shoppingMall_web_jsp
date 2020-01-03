<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_category.css?ver=2" rel="stylesheet" type="text/css" />
<style type="text/css"></style>
</head>
<body>
<%
	Connection conn = ConnectionProvider.getConnection();
	List<Flower> flowers = null;
	try{
		FlowerDao dao = new FlowerDao();
		flowers = dao.selectFlowerListByType(conn, request.getParameter("index"));
	}catch(SQLException e){}
	
	request.setAttribute("category", request.getParameter("index"));
%>

<div id="wrap">
	<div class="main_box">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
	<div class="main_page">
			<div class="main_flash">
				<div class="slide">
					<ul>
				      <li></li>
				      <li></li>
				      <li></li>
				      <li></li>
			    	</ul>
				</div>
			<div class="main_pro">
				<div class="category_title">
					<p>${category}</p>
				</div>
				<c:set var = "list" value = "<%=flowers %>"/>
				<c:if test = "${list != null}">
				<c:forEach var = "flower" items="${list}">
					<div class = "main_product">
						<p><a href = "../productPage/detail.jsp?flowerName=${flower.flowerName}"><img src = "../productImages/${flower.mainPic}" width = "100%" height = "auto"/></a>
						</p>${flower.flowerName}<br/>
						\ ${flower.price}원 <br/>
						</div>
					</c:forEach>
					</c:if>
				</div>
				<jsp:include page="../UI/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
</body>
</html>
