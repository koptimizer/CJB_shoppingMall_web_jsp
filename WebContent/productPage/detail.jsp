<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
      <%@taglib prefix="util" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_product.css?ver=7" rel="stylesheet" type="text/css" />
</head>
<body>

<%
	String memberId = (String)session.getAttribute("LOGIN");
	
	request.setCharacterEncoding("UTF-8");
	String flowerName = request.getParameter("flowerName");
	Flower flower = null;
	Connection conn = ConnectionProvider.getConnection();
	try{
		FlowerDao dao = new FlowerDao();
		dao.updateFav(conn, flowerName, 1);
		flower = dao.selectByFlowerName(conn, flowerName);
	}catch(SQLException e){}
	finally{JdbcUtil.close(conn);}
%>

<c:set var = "flower" value = "<%=flower%>"/>
<c:set var = "flowerName" value = "${flower.flowerName}"/>
<c:set var = "price" value = "${flower.price}"/>

<div id="wrap">
	<div class="main_box">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
	<div class="main_page">
			<div class="main_pro">
				<div class="main_product">
					<div class="pro_image"><img src="../productImages/${flower.mainPic}" width="100%" height="auto" /></div>
				</div>
				<div class="main_order">
					<form id="form1" name="form1" method="get" action="payment.jsp">
					<p><input type = "text" name = "flowerName" value = "${flower.flowerName }" id = "name" readonly/></p>
					<hr/>
					<table width="100%" border="0" cellspacing="0" cellpadding="3">
						<tr>
							<td width="35%">가격</td>
							<td><input type = "text" name = "price" value = "${flower.price }" id = "price" readonly/></td>
						</tr>
						<tr>
							<td>상품간략설명</td>
							<td><input type = "text" value = "${flower.explain1 }" id = "explain" readonly/></td>
						</tr>
						<tr>
							<td>갯수</td>
							<td><select name="amount" id="productAmount">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select></td>
						</tr>
					</table>
 					<hr/>
 					<%if(memberId != null){%>
					<input type="submit" name="buy" id="buy" value="BUY NOW"/>
 					<%}else{ %>
 					<input type="button" name="goLogin" id="goLogin" value="로그인이 필요해요" onclick= "location.href = '../mainPage/login.jsp'" />
 					<%} %>
					</form>
				</div>
			</div>
			<div class="pro_description">
				<h1>제품설명</h1>
				<table width="100%" border="0" cellspacing="0" cellpadding="3">
					<tr>
						<td width="33%"><img src="../productImages/${flower.pic1}" width="100%" height="auto" /></td>
						<td colspan="2"><util:detailForm size = "5" color = "black" >${flower.explain1 }</util:detailForm></td>
					</tr>
					<tr>
						<td colspan="2"><util:detailForm size = "5" color = "black" >${flower.explain2 }</util:detailForm></td>
						<td width="33%"><img src="../productImages/${flower.pic2}" width="100%" height="auto" /></td>
					</tr>
					<tr>
						<td width="33%"><img src="../productImages/${flower.pic3}" width="100%" height="auto" /></td>
						<td colspan="2"><util:detailForm size = "5" color = "black" >${flower.explain3 }</util:detailForm></td>
					</tr>
					<tr>
						<td colspan="3"><img src="../images/others/post_info.jpg" width="100%" height="auto" /></td>
					</tr>
				</table>

			</div>
			<jsp:include page="../UI/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>