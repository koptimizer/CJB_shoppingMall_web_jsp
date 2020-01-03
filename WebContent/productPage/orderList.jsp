<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_orderList.css?ver=6" rel="stylesheet" type="text/css" />

</head>
<body>
<%
	String pageNumberStr = request.getParameter("page");
	String memberId = (String)session.getAttribute("LOGIN");
	int pageNumber = 1;
	if(pageNumberStr != null){
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	request.setCharacterEncoding("UTF-8");
	Connection conn = ConnectionProvider.getConnection();
	PaymentListView view = null;
	try{
		PaymentDao pDao = new PaymentDao();
		view = pDao.getPaymentList(conn, pageNumber, memberId);
	}catch(SQLException e){}

	//Connection conns = ConnectionProvider.getConnection();
	//String memberName = "";
	//MemberDao mDao = new MemberDao();
%>
	<c:set var = "list" value = "<%=view.getPaymentList()%>"/>

<div id="wrap">
	<div class="main_boxs">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
		<div class="main_page">
			<div class="main_pro">
				<div class="main_box">
					<div class="form_box">
						<form id="form1" name="form1" method="post" action="#">
							<p1>ORDER LIST </p1>
							<br/>
							<br/>
							<p2>구매목록</p2>
							<table width="100%" border="0" cellspacing="0" cellpadding="3">
								<tr>
									<th width="20%" scope="col">구매번호</th>
									<th width="20%" scope="col">받는 분</th>
									<th width="20%" scope="col">상품</th>
									<th width="20%" scope="col">가격</th>
									<th width="20%" scope="col">갯수</th>
								</tr>
								<c:forEach var="payment" items="${list}">       
									<tr>
										<td>${payment.orderId}</td>
										<td>${payment.receiveName }</td>
										<td>${payment.flowerName }</td>
										<td>${payment.price }</td>
										<td>${payment.amount }</td>
									</tr>               
								</c:forEach>
							</table>
							
							<%  	for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
									<a href="orderList.jsp?page=<%= i %>">[<%= i %>]</a> 
								<%  	} %>
							<div class="sub_box">
								<input type="button" name="back" id="back" value="홈으로" onclick="location.href='../mainPage/main.jsp'" />
							</div>
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
