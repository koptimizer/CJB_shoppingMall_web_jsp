<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_admin_product.css?ver=3" rel="stylesheet" type="text/css" />
<style type="text/css"></style>
</head>
<body>

<div id="wrap">
	<div class="main_box">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
		<div class="main_page">
			<div class="main_flash">
				<div class="main_pro">
					<div class="list_box">
						<p1>ADD PRODUCT</p1>
						<br/>
						<br/>
						<p2>상품 등록</p2>
					</div>
					<div class="form_box">
						<form enctype="multipart/form-data" id="form1" name="form1" method="post" action="process_admin_product.jsp">
							<table width="100%" border="0" cellspacing="0" cellpadding="3">
								<tr>
									<td width="17%">상품명</td>
									<td width="83%">
										<input type="text" name="flowerName" id="flowerName" />
									</td>
								</tr>
								<tr>
									<td width="17%">메인사진</td>
									<td width="83%">
										<input type="file" name="mainPic" id="mainPic" />
									</td>
								</tr>
								<tr>
									<td width="17%">가격</td>
									<td width="83%">
										<input type="text" name="price" id="price" />
									</td>
								</tr>
								<tr>
									<td width="17%">사진1</td>
									<td width="83%">
										<input type="file" name="pic1" id="pic1" />
									</td>
								</tr>
								<tr>
									<td width="17%">설명1</td>
									<td width="83%">
										<input type="text" name="explain1" id="explain1" />
									</td>
								</tr>
								<tr>
									<td width="17%">사진2</td>
									<td width="83%">
										<input type="file" name="pic2" id="pic2" />
									</td>
								</tr>
								<tr>
									<td width="17%">설명2</td>
									<td width="83%">
										<input type="text" name="explain2" id="explain2" />
									</td>
								</tr>
								<tr>
									<td width="17%">사진3</td>
									<td width="83%">
										<input type="file" name="pic3" id="pic3" />
									</td>
								</tr>
								<tr>
									<td width="17%">설명3</td>
									<td width="83%">
										<input type="text" name="explain3" id="explain3" />
									</td>
								</tr>
								<tr>
									<td width="17%">종류</td>
									<td width="83%">
										<input type="text" name="type" id="type" />
									</td>
								</tr>
							</table>
							<br/>
							<input type="button" id="back" value="&laquo; Back" onclick="location.href='admin_main.jsp'"/>
							<div class="button_box">
								<input type="submit" id="submit" value="추가" />
								<input type="reset" id="reset" value="지우기" />
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
