<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_payment.css?ver=4" rel="stylesheet" type="text/css" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
	function goPop(){
		$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
	}

	function checkForm(){
		var f = document.form1;
		
		if(f.memberTel3.value == ""){
			alert("고객님의 전화번호를 입력하지 않았습니다.");
			f.memberTel3.focus();
			f.memberTel3.select();
			return false;
		}
		
		if(f.receiveName.value == ""){
			alert("받는 분의 이름을 입력하지 않았습니다.");
			f.memberName.focus();
			f.memberName.select();
			return false;
		}
		
		if(f.address2.value == ""){
			alert("받는 분의 주소를 입력하지 않았습니다.");
			f.address2.focus();
			f.address2.select();
			return false;
		}
		
		if(f.receiveTel3.value == ""){
			alert("받는 분의 전화번호를 입력하지 않았습니다.");
			f.receiveTel3.focus();
			f.receiveTel3.select();
			return false;
		}
		
		f.submit();
	}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String flowerName = request.getParameter("flowerName");
	String price = request.getParameter("price");
	String amount = request.getParameter("amount");
	
	String memberId = (String)session.getAttribute("LOGIN");
	Connection conn = ConnectionProvider.getConnection();
	Member member = new Member();
	try{
		MemberDao mDao = new MemberDao();
		member = mDao.selectById(conn, memberId);
	}catch(Exception e){}
%>

<c:set var = "member" value = "<%=member%>"/>

<div id="wrap">
	<div class="main_boxs">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
		<div class="main_page">
			<div class="main_pro">
				<div class="main_box">
					<div class="form_box">
						<form id="form1" name="form1" method="post" action="process_payment.jsp">
							<table width="100%" border="0" cellspacing="0" cellpadding="3">
								<tr>
									<td width="17%">구매상품</td>
									<td width="83%">
										<input type="text" name="flowerName" id="flowerName" value = "<%=flowerName %>" readonly /></td>
								</tr>
								<tr>
									<td width="17%">갯수</td>
									<td width="83%">
										<input type="text" name="amount" id="amount" value = "<%=amount %>" readonly /></td>
								</tr>
								<tr>
									<td width="17%">가격</td>
									<td width="83%">
										<input type="text" name="price" id="price" value = "<%=price %>" readonly/></td>
								</tr>
								<tr>
									<td width="17%">주문하는 분</td>
									<td width="83%">
										<input type="text" name="memberName" id="memberName" value = "${member.memberName}" /></td>
								</tr>
								<tr>
									<td>주소</td>
									<td>
										<input type="text" name="memberAdd" id="memberAdd" value = "${member.memberAdd}"/></td>
								</tr>
								<tr>
									<td valign="middle">휴대전화</td>
									<td valign="middle">
										<input type="text" name="memberTel1" id="memberTel1" />
										&#8211;
										<input type="text" name="memberTel2" id="memberTel2" />
										&#8211;
										<input type="text" name="memberTel3" id="memberTel3" /></td>
								</tr>
								<tr>
						<td>이메일</td>
						<td><input type="text" name="memberEmail" id="memberEmail" value = "${member.memberEmail}"/>
						</td>
					</tr>
							</table> <hr/>
							<table width="100%" border="0" cellspacing="0" cellpadding="3">
								<tr>
									<td width="17%">받는 분</td>
									<td width="83%">
										<input type="text" name="receiveName" id="memberId" /></td>
								</tr>
								<tr>
									<td>우편번호</td>
									<td>
										<input type="text" name="postNum" id="add1" class="postcodify_postcode5" value="" />
										<button type = "button" id="postcodify_search_button" onclick = "goPop()">검색</button><br />
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>
										<input type="text" name="address1" id="add2" class="postcodify_address" value="" /><br />
									</td>
								</tr>
								<tr>
									<td>상세주소</td>
									<td>
										<input type="text" name="address2" id="add3" class="postcodify_details" value="" /><br />	
									</td>
								</tr>
								<tr>
									<td valign="middle">휴대전화</td>
									<td valign="middle">
										<input type="text" name="receiveTel1" id="receiveTel1" />
										&#8211;
										<input type="text" name="receiveTel2" id="receiveTel2" />
										&#8211;
										<input type="text" name="receiveTel3" id="receiveTel3" /></td>
								</tr>
								<tr>
									<td>배송메시지</td>
									<td><textarea name="receiveText" id="memberMemo" cols="45" rows="5"></textarea></td>
								</tr>
								<tr>
									<td>희망배송일</td>
									<td>
										<input type="text" name="receiveYear" id="receiveYear" />년
										<input type="text" name="receiveMonth" id="receiveMonth" />월
										<input type="text" name="receiveDay" id="receiveDay" />일
									</td>
								</tr>
							</table>
							<div class="button_box">
							<p>주문 날짜 다음 날부터 배송 가능</p>
							<p><input type="button" name="submits" id="submits" value="주문" onclick = "checkForm()"/>
							&nbsp;
							<input type="reset" name="reset" id="reset" value="지우기" /></p>
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
