<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Product from Cart</title>
</head>
<%
    String productId = request.getParameter("productId");
    List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	
    if (cartList == null) {
        response.sendRedirect("/error/exception.jsp");
        return;
    }

    boolean result = false; // 성공적으로 삭제되었는지 확인하는 플래그

    if (productId != null && !productId.isEmpty()) {
        // productId가 제공된 경우 특정 상품 삭제
        Product toRemove = null;
        for (Product product : cartList) {
            // product의 productId가 null이 아니고, 요청받은 productId와 일치하는 경우만 검사
            if (product.getProductId() != null && product.getProductId().equals(productId)) {
                toRemove = product;
                break;
            }
        }
        if (toRemove != null) {
            result = cartList.remove(toRemove);
        }
    } else {
        // productId가 제공되지 않은 경우 전체 목록 삭제
        cartList.clear();
        result = cartList.isEmpty();
    }

    session.setAttribute("cartList", cartList); // 변경된 장바구니를 다시 세션에 저장

    if (result) {
        response.sendRedirect("cart.jsp");
    } else {
        out.println("<script>alert('제품 삭제 중 에러가 발생하였습니다.'); history.back();</script>");
    }
%>
<body>

</body>
</html>