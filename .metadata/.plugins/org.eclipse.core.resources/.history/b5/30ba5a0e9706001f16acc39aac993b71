package filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebFilter("/LoginFilter")
public class LoginFilter extends HttpFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        super.init(filterConfig);
    }

    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        Cookie[] cookies = request.getCookies();
        String rememberMe = null;
        String token = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberMe".equals(cookie.getName())) {
                    rememberMe = cookie.getValue();
                } else if ("token".equals(cookie.getName())) {
                    token = cookie.getValue();
                }
            }
        }

        if ("true".equals(rememberMe) && token != null) {
            autoLogin(token, request);
        }

        chain.doFilter(request, response);
    }

    private void autoLogin(String token, HttpServletRequest request) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Connection con = null;
        
		try {
            String sql = "SELECT login_id FROM persistent_logins WHERE token = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, token);
            rs = pstmt.executeQuery();
 
            if (rs.next()) {
                String loginId = rs.getString("login_id");
                HttpSession session = request.getSession();
                session.setAttribute("loginId", loginId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
