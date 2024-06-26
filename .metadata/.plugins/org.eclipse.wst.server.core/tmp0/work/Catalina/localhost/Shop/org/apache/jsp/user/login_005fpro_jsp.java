/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.87
 * Generated at: 2024-04-23 05:30:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.UUID;
import java.net.URLEncoder;
import shop.dto.User;
import shop.dao.UserRepository;

public final class login_005fpro_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = new java.util.LinkedHashSet<>(4);
    _jspx_imports_classes.add("java.net.URLEncoder");
    _jspx_imports_classes.add("shop.dto.User");
    _jspx_imports_classes.add("java.util.UUID");
    _jspx_imports_classes.add("shop.dao.UserRepository");
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

      out.write("<!-- 로그인 처리 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");

	
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
