<%@page import="shop.dto.Order"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.OrderRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 비회원 주문 내역 세션에 등록 처리
	String root = request.getContextPath();

  	String phone = request.getParameter("phone");
    String orderPw = request.getParameter("orderPw");
    OrderRepository orderDao = new OrderRepository();
    
 	// 사용자가 입력한 전화번호를 받아와서 세션에 저장
    session.setAttribute("orderPhone", phone);
 	session.setAttribute("orderPw", orderPw);
    
    // 전화번호와 주문 비밀번호를 사용하여 주문 내역을 조회
    List<Product> orders = orderDao.list(phone, orderPw);

    // 주문 내역을 세션에 저장
    if(orders != null && !orders.isEmpty()) {
 	    // 사용자가 입력한 전화번호를 받아와서 세션에 저장
        session.setAttribute("orderPhone", phone);
     	session.setAttribute("orderPw", orderPw);
        response.sendRedirect(root + "/user/order.jsp");
    } else {
	    response.sendRedirect(root + "/user/order.jsp");
    }

%>