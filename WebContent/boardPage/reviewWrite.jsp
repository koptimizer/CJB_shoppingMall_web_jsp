<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="layout_reviewWrite.css?ver=1" rel="stylesheet" type="text/css" />
<script>
	function checkWrite(){
		var frm = document.form1;
		
		if(frm.boardName.value ==""){
	    	alert("글 제목을 입력하세요.");
	    	frm.boardName.focus();
	    	frm.boardName.select();
	    	return false;
		}
		
	    if(frm.boardContent.value == ""){
	    	alert("내용을 입력하세요.");
        	frm.boardContent.focus();
        	frm.boardContent.select();
        	return false;
	    }
	    
	    frm.submit();
	    
	}
</script>

</head>
<body>
<div id="wrap">
	<div class="main_boxs">
		<jsp:include page="../UI/banner.jsp"></jsp:include>
	<div class="main_page">
			<div class="main_pro">
					<div class="main_box">
						<div class="form_box">
							<form enctype="multipart/form-data" id="form1" name="form1" method="post" action="process_reviewWrite.jsp">
								<p1>REVIEW</p1>
								<br/>
								<br/>
								<p2>상품 사용후기 게시판 입니다.</p2>
								<table width="100%" border="0" cellspacing="0" cellpadding="3">
									<tr>
										<td width="17%" scope="col">제목</td>
										<td colspan="3" scope="col"><input type = "text" name = "boardName" id = "boardName"></td>
									</tr>
									<tr>
										<td width="17%" scope="col">상품</td>
										<td colspan="1" scope="col">
											<select name="boardProduct" id="boardProduct">
												<option value="감동">감동</option>
												<option value="감사">감사</option>
												<option value="로즈">로즈</option>
												<option value="써니">써니</option>
												<option value="용돈박스">용돈박스</option>
											</select>
										</td>
										<td colspan="2" scope="col"><p1><input type="file" name="boardPicture" id="boardPicture" /></p1></td>
									</tr>
									<tr>
										<td width="17%" scope="col">글 내용</td>
										<td colspan="3" scope="col"><textarea cols="50" rows="10" id = "boardContent" name = "boardContent" ></textarea></td>
									</tr>
								</table>
								<div class="sub_box">
									<input type = "button" id="boardSub" name = "boardSub" value = "작성" onclick = "checkWrite()"/>
								</div>
								<input type="button" name="back" id="back" value="목록으로"  onclick="location.href='board.jsp'"/>
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