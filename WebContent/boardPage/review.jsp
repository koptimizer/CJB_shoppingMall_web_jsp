<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_review.css?ver=3" rel="stylesheet" type="text/css" />
</head>

<body>

<%
	request.setCharacterEncoding("utf-8");
	String boardId = request.getParameter("boardId");
	Board board = new Board();
	try{
		Connection conn = ConnectionProvider.getConnection();
		BoardDao bDao = new BoardDao();
		board = bDao.selectByBoardId(conn, boardId);
	}catch(Exception e){}
%>

<c:set var = "board" value = "<%=board%>"/>

<div id="wrap">
	<div class="main_boxs">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
	<div class="main_page">
			<div class="main_pro">
					<div class="main_box">
						<div class="form_box">
							<form id="form1" name="form1" method="post" action="">
								<p1>REVIEW</p1>
								<br/>
								<br/>
								<p2>상품 사용후기 게시판 입니다.</p2>
								<table width="100%" border="0" cellspacing="0" cellpadding="3">
									<tr>
										<th width="20%" scope="col">제목</th>
										<th colspan="3" scope="col">${board.boardName }</th>
									</tr>
									<tr>
										<th width="20%" scope="col" >작성자</th>
										<th width="30%" scope="col" >${board.memberId }</th>
										<th width="20%" scope="col" >상품</th>
										<th width="30%" scope="col" >${board.boardProduct }</th>
									</tr>
									<tr>
										<td colspan="4">
										<table>
											<tr>
											<td width="20%"><img src="../boardImages/${board.boardPicture}" width="150" height = "150" border = "0"/></td>
											<td width="80%"><p>${board.boardContent }</p></td>		
											</tr>
										</table>
										</td>
									</tr>
								</table>
								<div class="sub_box">
									<input type="button" name="back" id="back" value="목록으로"  onclick="location.href='board.jsp'"/>
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
