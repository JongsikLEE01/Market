<%@page import="shop.dao.ProductIORepository"%>
<%@page import="shop.dto.Order"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.mysql.cj.Session"%>
<%@page import="java.util.Enumeration"%>
<%@page import="shop.dao.OrderRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Products</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	<title>Shop🛒 - PES🌴</title>
</head>
<%
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	
	String userId = (String) session.getAttribute("loginId");
	String orderForm = request.getParameter("orderForm");
	String phone = request.getParameter("phone");
	String orderPw = request.getParameter("password");
	String address = request.getParameter("address");
	String deliveryDate = request.getParameter("deliveryDate");
	String nation = request.getParameter("nation");
	String zipCode = request.getParameter("zipCode");
	String name = request.getParameter("name");
	int totalPrice = Integer.parseInt(request.getParameter("sum"));
	
	Order newOrder = new Order();
	newOrder.setUserId(userId);
	newOrder.setShipName(name);
	newOrder.setDate(deliveryDate);
	newOrder.setAddress(address);
	newOrder.setCountry(nation);
	newOrder.setZipCode(zipCode);
	
	// 비회원인 경우에만 휴대폰 번호 저장 
	if(userId == null) {
		newOrder.setPhone(phone);	
	}
	newOrder.setOrderPw(orderPw);
	newOrder.setTotalPrice(totalPrice);
	
	OrderRepository orderDao = new OrderRepository();
	
	int result = orderDao.insert(newOrder);
	
	// 라스트 오더 ?
	int last = orderDao.lastOrderNo();		
	ProductIORepository productIODao = new ProductIORepository();
	
	if (cartList != null && !cartList.isEmpty()) {
        
        for (Product cart : cartList) {
        	Product product = new Product();
        	String user = "";
        	
        	product.setProductId(cart.getProductId());
        	product.setOrderNo(last);
        	product.setQuantity(cart.getQuantity());
        	product.setType("OUT");
        	if(userId == null) {
        		user = phone;
        	} else {
        		user = userId;
        	}
        	product.setUserId(user);
        	
        	int add = productIODao.insert(product);
        	
        	if(add < 0) {
        		// 오류 발생
        		break;
        	}
        }
	}
	// 주문 완료하고 장바구니 초기화
	if(result > 0) {
    	cartList.clear();
    	session.setAttribute("cartList", cartList); // 변경된 장바구니를 다시 세션에 저장
	}
%>
<body>   
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 완료</h1>
	</div>
	
	<!-- 주문 완료 확인 -->
	<div class="container order mb-5 p-5">
		<h2 class="text-center">주문이 완료되었습니다.</h2>
		<!-- 주문정보 -->
		<div class="ship-box">
			<table class="table ">
				<tbody>
				<tr>
					<td>주문번호 :</td>
					<td><%= session.getId() %></td>
				</tr>
				<tr>
					<td>배송지 :</td>
					<td><%= address %></td>
				</tr>
			</tbody>
			</table>
			
			<div class="btn-box d-flex justify-content-center">
				<a href="../user/order.jsp" class="btn btn-primary btn-lg px-4 gap-3">주문내역</a>
			</div>
		</div>
	</div>
	
   	<jsp:include page="/layout/footer.jsp" />
    <jsp:include page="/layout/script.jsp" />


</body>
</html>