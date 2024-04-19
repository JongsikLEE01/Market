<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop</title>
	<jsp:include page="/layout/meta.jsp" /> <jsp:include page="/layout/link.jsp" />
	<style>
		h2 {
			text-align: center;
		  	justify-content: center;
		}
	</style>
</head>
<body>   
	<% String root = request.getContextPath(); %>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보</h1>
		
	</div>
	<!-- 회원 가입/수정/탈퇴 완료 -->
	<div class="container mb-5">
		<%
			String loginId = (String) session.getAttribute("loginId");
			int msg = Integer.parseInt(request.getParameter("msg"));
			
			// 로그인 완료
			if(msg == 0) {
		%>
			<h2>
				<%= loginId %>님 환영 합니다.
			</h2>
		<%
			}
			// 회원 가입 완료
			else if(msg == 1) {
		%>
				<h2>회원 가입이 완료되었습니다.</h2>
		<% 
			}
			// 회원 정보 수정 완료
			else if(msg == 2) {
		%>
				<h2>회원 정보가 수정되었습니다.</h2>
		<%		
			}
			// 회원 탈퇴 완료
			else {
		%>	
				<h2>회원 정보가 삭제되었습니다.</h2>
		<%	
			}
		%>
		<br>
		<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<!-- a 태그 버튼 -->
				<a href="<%= request.getContextPath() %>" class="btn btn-primary btn-lg px-4 gap-3">메인 화면</a>
		</div>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>







