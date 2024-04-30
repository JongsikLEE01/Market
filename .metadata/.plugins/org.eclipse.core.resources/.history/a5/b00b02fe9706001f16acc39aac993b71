<!-- 
	회원 가입 처리
 -->
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 폼 데이터 수신
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String pw_confirm = request.getParameter("pw_confirm");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String email = request.getParameter("email1") + "@" + request.getParameter("email2");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
	
    // 조건 1. 아이디 : 영문 또는 한글로 시작
	char firstId = id.charAt(0);
	if (!((firstId >= 'a' && firstId <= 'z') || (firstId >= 'A' && firstId <= 'Z') || 
	      (firstId >= '가' && firstId <= '힣'))) {
	    out.println("<script>alert('아이디는 영문 또는 한글로 시작해야 합니다.'); history.back();</script>");
	    return;
	}

    // 조건 2. 비밀번호 구성요소 : 영문자, 숫자, 특수문자만 사용 가능, 특수 문자 반드시 1개 포함, 글자수 6 이상
    // 정규 표현식: 영문자, 숫자, 특수문자를 포함하며, 특수문자는 반드시 1개 이상 포함
    if(!(pw.length() >= 6)) {
    	out.println("<script>alert('비밀번호를 6자 이상 입력해주세요.'); history.back();</script>");
    	return;
    }
    if(!pw.matches("(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\",.<>\\/?])[A-Za-z0-9!@#$%^&*()_+\\-=\\[\\]{};':\",.<>\\/?]*")) {
    	out.println("<script>alert('비밀번호는 영문자, 숫자, 특수기호만 입력 가능하고, 특수 문자는 반드시 1개 이상 포함해주세요.'); history.back();</script>");
    	return;
    }
    	
    // 조건 3. 비밀번호 유효성 검사
    if (!pw.equals(pw_confirm)) {
        // 비밀번호가 일치하지 않는 경우
        out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
	    return;
    } 
    
    // 조건 4. 이름은 한글만 입력
    for (int i = 0; i < name.length(); i++) {
    char ch = name.charAt(i);
	    if (ch < '가' || ch > '힣') {
	    	out.println("<script>alert('이름은 한글만 입력 가능합니다.'); history.back();</script>");
		    return;
    	}
	}
    
    
    // User 객체 생성 및 값 설정
    User user = new User();
    user.setId(id);
    user.setPassword(pw);
    user.setName(name);
    user.setGender(gender);
    user.setBirth(year + "-" + month + "-" + day);
    user.setMail(email);
    user.setPhone(phone);
    user.setAddress(address);

    // 데이터베이스 연결 및 사용자 추가 로직
    UserRepository userDAO = new UserRepository();
    int result = userDAO.insert(user);

    // 결과에 따른 응답 페이지 리다이렉션
    if (result > 0) {
        // 회원 가입 성공
        response.sendRedirect("complete.jsp?msg=1");
    } else {
        // 회원 가입 실패
        out.println("<script>alert('회원 가입 실패. 다시 시도해 주세요.'); history.back();</script>");
    }
    
%>
    

    
    
    
    
    
    