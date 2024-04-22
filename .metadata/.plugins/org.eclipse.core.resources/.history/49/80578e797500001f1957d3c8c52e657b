<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="shop.dao.UserRepository" />

<%
	//회원 정보 삭제 처리
	String id = request.getParameter("id");
	
	int result = userDAO.delete(id);
	
	if(result > 0) {
		  // 세션 무효화
	    session.invalidate();

	    // 자동 로그인 쿠키와 토큰 쿠키 삭제
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("rememberMe") || cookie.getName().equals("token")) {
	                cookie.setMaxAge(0); // 쿠키 만료
	                cookie.setPath("/"); // 적절한 경로 설정
	                response.addCookie(cookie);
	            }
	        }
	    }

	    // 세션 삭제 후 초기 화면으로 리다이렉트
		response.sendRedirect("complete.jsp?msg=3");
	}
	else {
	    out.println("<script>alert('회원 삭제 중 에러가 발생하였습니다.'); history.back();</script>");
	}
%>
