<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="my.dao.*,my.util.*,my.model.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>천자비플라워</title>
<link href="layout_board.css?ver=6" rel="stylesheet" type="text/css" />
<script>
    function searchCheck(frm){
        if(frm.searchText.value ==""){
            alert("검색 단어를 입력하세요.");
            frm.keyWord.focus();
            return;
        }
        location.href = "board.jsp?searchText="+frm.searchText.value+"&index="+frm.index.value;
    }
    
    function checkMember(){
    	location.href = "reviewWrite.jsp"
    }
</script>
</head>
<body>
<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if(pageNumberStr != null){
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	String index, searchText = null;
	request.setCharacterEncoding("UTF-8");
	index = request.getParameter("index");
	searchText= request.getParameter("searchText");
	Connection conn = ConnectionProvider.getConnection();
	//List<Board> list = null;
	BoardListView view = null;
	
	try{
		BoardDao bdao = new BoardDao();
		view = bdao.getBoardList(conn, pageNumber, index, searchText);
	}catch(SQLException e){}

	//Connection conns = ConnectionProvider.getConnection();
	//String memberName = "";
	//MemberDao mDao = new MemberDao();
%>
		<c:set var = "list" value = "<%=view.getBoardList()%>"/>

<div id="wrap">
	<div class="main_boxs">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
		<div class="main_page">
			<div class="main_pro">
				<div class="main_box">
					<div class="form_box">
						<form id="form1" name="form1" method="post" action="#">
							<p1>REVIEW </p1>
							<br/>
							<br/>
							<p2>상품 사용후기 게시판</p2>
							<div class="sub_box">
								<input type="button" name="write" id="write" value="글쓰기" onclick="checkMember()"/>
							</div>
							
							<table width="100%" border="0" cellspacing="0" cellpadding="3">
								<tr>
									<th width="20%" scope="col">글번호</th>
									<th width="50%" scope="col">제목</th>
									<th width="15%" scope="col">작성자</th>
									<th width="15%" scope="col">상품</th>
								</tr>
								<c:forEach var="board" items="${list}">       
									<tr>
										<td><a href="review.jsp?boardId=${board.boardId}">${board.boardId}</a></td>
										<td><a href="review.jsp?boardId=${board.boardId}">${board.boardName }</a></td>
										<td><a href="review.jsp?boardId=${board.boardId}">${board.memberId }</a></td>
										<td><a href="review.jsp?boardId=${board.boardId}">${board.boardProduct }</a></td>
									</tr>               
								</c:forEach>
							</table>
							
							<%if(index==null && searchText==null){
								for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
									<a href = "board.jsp?page=<%=i %>">[<%=i %>]</a> 
								<%}}
							else{
								for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
									<a href="board.jsp?page=<%= i %>&index=<%=index %>&searchText=<%=searchText%>">[<%= i %>]</a><%}
							}
							%>
							<div class="sub_box">
								<form id = "search" name = "search" method = "get" action = "board.jsp">
									<input type="text" name="searchText" id="searchText" />
									<select name="index" id="index">
										<option value="boardProduct">상품</option>
										<option value="memberId">작성자</option>
									</select>
									<input type="button" name="search" id="search" value="검색" onclick="searchCheck(form)" />
								</form>
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
