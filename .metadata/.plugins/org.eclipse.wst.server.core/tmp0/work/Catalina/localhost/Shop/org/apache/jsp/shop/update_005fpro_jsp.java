/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.87
 * Generated at: 2024-04-22 06:43:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.shop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.io.FilenameUtils;
import java.util.Map;
import java.util.HashMap;
import org.apache.commons.fileupload.FileItemFactory;
import java.nio.file.Paths;
import java.io.InputStream;
import shop.dto.Product;
import shop.dao.ProductRepository;
import java.io.File;
import java.util.UUID;
import java.util.Iterator;
import org.apache.commons.fileupload.FileItem;
import java.util.List;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

public final class update_005fpro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(15);
    _jspx_imports_classes.add("java.util.Iterator");
    _jspx_imports_classes.add("org.apache.commons.fileupload.FileItem");
    _jspx_imports_classes.add("org.apache.commons.fileupload.servlet.ServletFileUpload");
    _jspx_imports_classes.add("java.util.HashMap");
    _jspx_imports_classes.add("org.apache.commons.fileupload.FileItemFactory");
    _jspx_imports_classes.add("shop.dao.ProductRepository");
    _jspx_imports_classes.add("java.util.UUID");
    _jspx_imports_classes.add("java.io.File");
    _jspx_imports_classes.add("shop.dto.Product");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("org.apache.commons.fileupload.disk.DiskFileItemFactory");
    _jspx_imports_classes.add("java.nio.file.Paths");
    _jspx_imports_classes.add("java.util.Map");
    _jspx_imports_classes.add("org.apache.commons.io.FilenameUtils");
    _jspx_imports_classes.add("java.io.InputStream");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	//파일 저장 경로 및 크기 설정
	String path = application.getRealPath("/static/img");
	int fileSize = 10 * 1024 * 1024;  // 최대 10 MB
	
	// 파일 업로드 요청을 파싱.
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
		Integer unitPrice = Integer.parseInt(formFields.get("unitPrice")); 	// 가격(단가)
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
	
		ProductRepository productDAO = new ProductRepository();
		
		// 기존에 이미지 경로를 조회
		if (fileName == "") {
		    Product existingProduct = productDAO.getProductById(productId);
		    if (existingProduct != null && existingProduct.getFile() != null)
		        product.setFile(existingProduct.getFile());
		    else 
		    	product.setFile("/static/img/no-image.jpg"); 
		} else 
			product.setFile("/static/img/" + fileName);
		
		int result = productDAO.update(product);
			
	    if (result > 0){  
	    	out.println("<script>alert('상품이 성공적으로 수정되었습니다.');</script>");
	    	response.sendRedirect("editProducts.jsp");
    	}else
    		out.println("<script>alert('상품 수정에 실패했습니다.');history.back();</script>");
	} catch (Exception e) {
	    e.printStackTrace();
	}

      out.write('\r');
      out.write('\n');
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
