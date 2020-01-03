<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
      <%@taglib prefix="tool" uri="/WEB-INF/tlds/tool.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_banner.css?ver=13" rel="stylesheet" type="text/css" />
<script>
function gopopup(){
	alert("카카오톡 플러스친구에 천자비를 검색해주세요!");
	return false;
}

</script>
<style>
	.main_recommand {
		float: left;
		height: auto;
		width: 100%;
		text-align: center;
		margin-bottom: 5%;
		border: 1px solid #999;
		border-radius: 10px;
	}
	.recommand_image{
		flaot: left;
		width: 80%;
		height: auto;
		padding: 10%;
		padding-top: 5%;
	}
	.recommand_image p {
		font-weight: bold;
	}
	.main_banner2 {
		float: left;
		height: auto%;
		width: 5%;
		text-align: center;
		background-color:#FFF;
		position: fixed;
		left: 1650px;
		top: 300px;
	}
</style>
</head>
<body>
<%
	String memberId = null;
	memberId = (String)session.getAttribute("LOGIN");
	String memberName = null;
%>

	<div id="wrap">
		<div class="main_banner">
			<p>
			<%if(memberId == null){ %>
				<a href="../mainPage/main.jsp">
			<%}else if(memberId.equals("admin")){ %>
				<a href="../admin/admin_main.jsp">
			<%}else{ %>
				<a href="../mainPage/main.jsp">
			<%} %>
			<img src="../images/logo/mainLogo.png" width="50%" height="auto"/></a></p>
			<div class="main_menu">
				<table width="80%" border="0" cellspacing="0" cellpadding="5%">
					<tr>
						<th colspan="4">
						<%
							Connection conn = ConnectionProvider.getConnection();
							try{
								if(memberId == null){
									memberName= null;
								}
								else{MemberDao mDao = new MemberDao();
								memberName = mDao.selectNameById(conn, memberId);
								}
							}catch(SQLException e){}
							
							if(memberName == null){
								out.println("guest님 반갑습니다!");
							}else{
								out.println(memberName+"님 반갑습니다!");
							}
						%>
						</th>
					</tr>
					<tr><%
						if(memberName == null){%>
						<td><p><a href="../mainPage/login.jsp">LOGIN</a></p></td>
						<%
						}else{%>
						<td><p><a href="../mainPage/logout.jsp">LOGOUT</a></p></td>
						<%} %>
						<td><p><a href="../mainPage/join.jsp">JOIN US</a></p></td>
						<%
						if(memberName == null){%>
						<td><p><a href="../mainPage/login.jsp">MY PAGE</a></p></td>
						<%
						}else{%>
						<td><p><a href="../mainPage/mypage.jsp">MY PAGE</a></p></td>
						<%} %>
						<td><p><a href="../productPage/orderList.jsp">ORDER</a></p></td>
					</tr>
				</table>
			</div>
			<div class="main_category">
				<table width="70%" border="0" cellspacing="0" cellpadding="5%">
					<tr>
						<th width="50%" scope="col">Category</th>
						<th width="50%" scope="col">Community</th>
					</tr>
					<tr>
						<td><a href="../mainPage/category.jsp?index=감동">감동</a></td>
						<td><a onclick="gopopup()">NOTICE</a></td>
					</tr>
					<tr>
						<td><a href="../mainPage/category.jsp?index=감사">감사</a></td>
						<%
						if(memberName == null){%>
						<td><a href="../mainPage/login.jsp">REVIEW</a></td>
						<%
						}else{%>
						<td><a href="../boardPage/board.jsp">REVIEW</a></td>
						<%} %>
					</tr>
					<tr>
						<td><a href="../mainPage/category.jsp?index=로즈">로즈</a></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><a href="../mainPage/category.jsp?index=써니">써니</a></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><a href="../mainPage/category.jsp?index=용돈박스">용돈박스</a></td>
						<td>
							<a href="#">
								<div id="popup">
									<div> 
										<span>CS/BANK INFO</span>
										<p class="arrow_box">
											<p1>T.032-425-6624</p1><br/>
											<p2>MON-SAT 9:00-11:00 PM / SUN 10:00-7:00 PM</p2><br/><br/>
											<p1>BANK INFO</p1><br/>
											<p2>국민 307002-04-301224    고광종(천자비)</p2><br/>
										</p>
									</div>
								</div>
							</a>
						</td>
					</tr>
				</table>
			</div>
			<div class="main_notice"><p>1:1문의</p><img src="../images/others/QR.png" width="100px" height="auto" /></div>
		</div>
		<div class="main_banner2">
			<div class="main_recommand">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<div class="recommand_image">
							<p>TOP RATE</p>
						</div>
					</tr>
					<tr>
						<div class="recommand_image">
							<a href="../mainPage/category.jsp?index=감동"><img src="../images/Cut images/gamdong_cut/gamdong_50_pink_2_cut.jpg" width="100%" height="auto" /></a>
						</div>
					</tr>
					<tr>
						<div class="recommand_image">
							<a href="../mainPage/category.jsp?index=감사"><img src="../images/Cut images/gamsa_cut/gamsa_18_purple_2.jpg" width="100%" height="auto" /></a>
						</div>
					</tr>
					<tr>
						<div class="recommand_image">
							<a href="../mainPage/category.jsp?index=용돈박스"><img src="../images/Cut images/money_cut/money_1_cut.jpg" width="100%" height="auto" /></a>
						</div>
					</tr>
					<tr>
						<td><a href="#">▲TOP</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>