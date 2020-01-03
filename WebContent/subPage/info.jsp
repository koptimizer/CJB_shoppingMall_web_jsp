<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_agreement.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
	<div class="main_boxs">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
	<div class="main_page">
			<div class="main_pro">
					<div class="main_box">
						<div class="form_box">
							<form id="form1" name="form1" method="post" action="">
								<p1>COMPANY INFO</p1>
								<br/>
								<br/>
								<p2>회사 정보</p2>
								<table width="100%" border="0" cellspacing="0" cellpadding="3">
									<tr>
										<td width="100%">
											 회사 소개 입력란
										</td>
									</tr>
								</table>
								<div class="sub_box">
									<input type="button" name="back" id="back" value="이전으로" onclick="history.go(-1)"/>
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