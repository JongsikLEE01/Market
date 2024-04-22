<!-- 로그인 처리 -->
<%@page import="java.util.UUID"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserRepository userDAO = new  UserRepository();
	User loginUser = userDAO.login(id, pw);

	// 아이디 저장
	String rememberId = request.getParameter("remember-id");
	Cookie cookieRememberId = new Cookie("rememberId", "");
	Cookie cookieUserId = new Cookie("userId", "");
	
	// 체크박스 체크 시, 값 : on
	if( rememberId != null && rememberId.equals("on") ) {
		// 쿠키 생성
		// UTF-8 으로 인코딩하여 값을 저장해야한다.
		cookieRememberId.setValue( URLEncoder.encode( rememberId, "UTF-8" ) );
		cookieUserId.setValue( URLEncoder.encode( id, "UTF-8" ) );
	}
	// 체크박스 미체크 시
	else {
		// 쿠키 삭제
		cookieRememberId.setMaxAge(0);
		cookieUserId.setMaxAge(0);
	}
		// 쿠키 응답에 등록
		response.addCookie(cookieRememberId);
		response.addCookie(cookieUserId);
		// -------------------------------------------------
	
	// 자동 로그인
	String rememberMe = request.getParameter("remember-me");
	Cookie cookieRememberMe = new Cookie("rememberMe", "");
	Cookie cookieToken = new Cookie("token", "");
	
	// 자동 로그인 체크 여부, 토큰 쿠키에 대한 경로 설정
	cookieRememberMe.setPath("/");
	cookieToken.setPath("/");
	// 쿠키 유효기간 설정 - 초단위 --> 7일
	cookieRememberMe.setMaxAge(7*60*60*24);		 
	cookieToken.setMaxAge(7*60*60*24);
	
	// 아이디 저장 쿠키 설정
	if (rememberId != null && rememberId.equals("on")) {
	    // 사용자 ID 저장
	    cookieUserId.setValue(URLEncoder.encode(id, "UTF-8"));
	    cookieUserId.setPath("/");
	    cookieUserId.setMaxAge(30 * 24 * 60 * 60); // 예: 30일
	    response.addCookie(cookieUserId);
	} else {
	    // 쿠키 삭제
	    cookieUserId.setMaxAge(0);
	    cookieUserId.setPath("/");
	    response.addCookie(cookieUserId);
	}

	
	// 응답에 쿠키 등록
	response.addCookie(cookieRememberMe);
	response.addCookie(cookieToken);
	// -------------------------------------------------
	
	if (loginUser != null) {
	    session.setAttribute("loginId", id);  // 로그인 성공 시 세션에 ID 저장
	    response.sendRedirect("complete.jsp?msg=0");  // 성공 페이지로 리다이렉션
	} else {
    	response.sendRedirect("login.jsp?error=0");  // 로그인 실패 시 에러 코드와 함께 리다이렉션
	}
	// return; // 중요: 리다이렉트 후에는 추가적인 작업을 방지하기 위해 메서드를 종료

%>