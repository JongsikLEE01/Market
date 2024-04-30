<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 자동 로그인, 토큰 쿠키 삭제
	 // 세션 무효화
    session.invalidate();

    // 자동 로그인 쿠키 삭제
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("rememberMe") || cookie.getName().equals("token")) {
                cookie.setMaxAge(0); // 쿠키 만료
                cookie.setPath("/"); // 적절한 경로 설정
                response.addCookie(cookie); // 쿠키 응답에 다시 추가
            }
        }
    }
    // 로그아웃 후 로그인 페이지로 리다이렉트
    response.sendRedirect("login.jsp");
	
%>