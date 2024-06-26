<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="shop.dao.ProductIORepository"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.InputStream"%>
<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%
	String loginId = (String) session.getAttribute("loginId");
	
	//파일 저장 경로 및 크기 설정
	String path = application.getRealPath("/static/img");
	int fileSize = 10 * 1024 * 1024;  // 최대 10 MB
	
	// 파일 업로드 요청을 파싱
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(fileSize);
	
	try {
	    List<FileItem> items = upload.parseRequest(request);
	    Map<String, String> formFields = new HashMap<String, String>();
	
	    String fileName = "";
	    // 폼 필드를 반복, 데이터 처리
	    for (FileItem item : items) {
	        if (item.isFormField()) 
	            // 일반 요소
	            formFields.put(item.getFieldName(), item.getString("UTF-8"));
	         else {
	            // 파일
	            fileName = item.getName();
	            if (fileName != null && !fileName.isEmpty()) {
	                fileName = FilenameUtils.getName(fileName);
	                File uploadedFile = new File(path, fileName);
	                item.write(uploadedFile);
	            }
	        }
	    }
	
		String productId = formFields.get("productId");						// 상품ID
		String name = formFields.get("name");								// 상품명
		Integer unitPrice = Integer.parseInt(formFields.get("unitPrice"));  // 가격(단가)
		String description = formFields.get("description");					// 설명
		String manufacturer = formFields.get("manufacturer");				// 제조 업체
		String category = formFields.get("category");		 				// 카테고리
		long unitsInStock = Long.parseLong(formFields.get("unitsInStock")); // 재고 수
		String condition = formFields.get("condition");						// 상태
		 
		Product product = new Product();
	
		product.setProductId(productId);
		product.setName(name);
		product.setUnitPrice(unitPrice);
		product.setDescription(description);
		product.setManufacturer(manufacturer);
		product.setCategory(category);
		product.setUnitsInStock(unitsInStock);
		product.setCondition(condition);
	    product.setFile("/static/img/" + fileName);
	    
		ProductRepository productDao = new ProductRepository();
		ProductIORepository productIODAO = new ProductIORepository();
		
		int result = productDao.insert(product);
		
		// productIO 테이블에 상품 등록 시 초기 정보 추가
		if(loginId == null)
			product.setUserId("비회원");
		 else 
			product.setUserId(loginId);
		
		product.setQuantity((int) unitsInStock);
		product.setType("IN");
		int productIO = productIODAO.insert(product);
		
	    if (result > 0) {
	        out.println("<script>alert('상품이 성공적으로 등록되었습니다.');</script>");
	        response.sendRedirect("products.jsp");
	    } else 
	        out.println("<script>alert('상품 수정에 실패했습니다.');history.back();</script>");
	} catch (Exception e) {
	    e.printStackTrace();
	}
%>