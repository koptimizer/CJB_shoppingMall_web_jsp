<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
	<%@ page isErrorPage = "ture" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_admin_main.css?ver=7" rel="stylesheet" type="text/css" />
<style type="text/css"></style>
</head>
<body>

<%
	response.setStatus(200);
%>

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
							<c:out value = "${requestScope['javax.servlet.error.status_code']}"/>
							<c:out value = "${requestScope['javax.servlet.error.message']}"/>
							<c:out value = "${requestScope['javax.servlet.error.request_uri']}"/>
							<c:out value = "${requestScope['javax.servlet.error.exception_type']}"/>
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