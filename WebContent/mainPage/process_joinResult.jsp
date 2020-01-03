<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
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
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	String memberAdd = request.getParameter("postNum") + "_" +request.getParameter("address1") + "_" + request.getParameter("address2");
	String memberTel = request.getParameter("memberTel1") + request.getParameter("memberTel2") + request.getParameter("memberTel3");
	String memberEmail = request.getParameter("memberEmail1") +"@"+ request.getParameter("memberEmail2");
	boolean checkId;
	Member member = null;
	try{
		Connection conn = ConnectionProvider.getConnection();
		MemberDao dao = new MemberDao();
		checkId = dao.checkOverlapMemberId(conn, memberId);
		if(checkId==true){
			member = new Member(memberId,memberPw,memberName,memberAdd,memberTel,memberEmail);
			dao.insert(conn, member);
		}else{
			response.sendRedirect("process_joinFail.jsp");
			JdbcUtil.close(conn);
		}
	}catch(SQLException e){}
%>

<div id="wrap">
	<div class="main_boxs">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
	<div class="main_page">
			<div class="main_pro">
				<div class="main_box">
		<div class="form_box">
			<p1>JOIN US</p1>
			<br/>
			<br/>
			<p>회원가입</p>
			<p>&nbsp;</p>
			<br/>
			<p2>축하합니다! <%=memberName %>님 가입이 완료되었습니다.</p2>
			<br/>
			<br/>
			<br/>
			<div class="button_box">
					<input type="button" name="login" id="login" value="LOGIN" onclick="location.href='login.jsp'"/>
					&nbsp;
					<input type="button" name="back" id="back" value="HOME" onclick="location.href='main.jsp'"/>
			</div>
		</div>
	</div>
			</div>
			<jsp:include page="../UI/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>
