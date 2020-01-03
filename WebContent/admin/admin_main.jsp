<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_admin_main.css?ver=7" rel="stylesheet" type="text/css" />
<style type="text/css"></style>
</head>
<body>

<div id="wrap">
	<div class="main_box">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
	<div class="main_page">
			<div class="main_flash">
				<img src="../images/logo/mainPic.png" width="100%" height="auto" />
			<div class="main_pro">
				<div class="form_box">
					<form id="form1" name="form1" method="post">
						<div class="button_box">
							<input type="button" id="manage" value="상품 관리" onclick="location.href='admin_product.jsp'"/>
							<br/>
							<br/>
							<br/>
							<input type="button" id="manage" value="게시판 관리" onclick="location.href='admin_board.jsp'"/>
						</div>
					</form>
				</div>
			</div>
			<jsp:include page="../UI/footer.jsp"></jsp:include>
		</div>
	</div>
</div>
</div>
</body>
</html>
