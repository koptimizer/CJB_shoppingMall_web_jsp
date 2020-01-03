<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*,kr.sam.dev.martin.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="layout_joinResult.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String memberId = (String)session.getAttribute("LOGIN");
	String memberName = request.getParameter("memberName");
	String memberEmail = request.getParameter("memberEmail");
	String receiveName = request.getParameter("receiveName");
	String receiveAddress = request.getParameter("postNum") + "_" + request.getParameter("address1") + request.getParameter("address2");
	String receiveTel = request.getParameter("receiveTel1") + request.getParameter("receiveTel2") + request.getParameter("receiveTel3");
	String receiveText = request.getParameter("receiveText");
	String receiveDate = request.getParameter("receiveYonth") + "." + request.getParameter("receiveMonth") + "." + request.getParameter("receiveDay");
	String flowerName = request.getParameter("flowerName");
	int amount = Integer.parseInt(request.getParameter("amount"));
	int price = Integer.parseInt(request.getParameter("price"));
	Connection conn = ConnectionProvider.getConnection();
	Payment payment = null;
	try{
		PaymentDao pDao = new PaymentDao();
		payment = new Payment(memberId, memberName, memberEmail, receiveName, receiveAddress, receiveTel, receiveText, receiveDate, flowerName, amount, price);
		pDao.insert(conn, payment);
	}catch(SQLException e){}
	
%>

<script type="text/javascript">
alert("구매하셨습니다. 영수증은 메일로 보내드립니다!");
location.href = "orderList.jsp";
</script>
		
</body>
</html>
