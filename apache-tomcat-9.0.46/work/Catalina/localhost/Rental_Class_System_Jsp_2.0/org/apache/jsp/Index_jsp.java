/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.46
 * Generated at: 2023-01-11 07:15:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.RCS.*;
import java.sql.*;

public final class Index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/Pages/Page_Function/Alert.jsp", Long.valueOf(1671617610000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("com.RCS");
    _jspx_imports_classes = null;
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
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"Css/Css_Reset.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"Css/Header_Footer.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"Css/Index_Style.css\">\r\n");
      out.write("    <title>登入 - 教室租借系統 - 國立臺北護理健康大學</title>\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("   ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 //公告
    if(session.getAttribute("Alert") != null && (String)session.getAttribute("Alert") != ""){
    	out.print("<script>alert('"+(String) session.getAttribute("Alert")+"');</script>");
    	session.setAttribute("Alert","");
    }

      out.write("\r\n");
      out.write("   \r\n");
      out.write("    ");

	    if(request.getParameter("Account") !=null &&request.getParameter("Password") !=null){
	    	
	    	DB_CRUD DB = new DB_CRUD();
            ResultSet rs =DB.getResultSet("SELECT * FROM User WHERE Account='"+request.getParameter("Account")+"' AND Password='" +request.getParameter("Password")+"'");
			
			if(rs.next()){
				
				int i = Integer.parseInt(rs.getString("User_Type"));
				
					switch (i){
					case 1:
						session.setAttribute("Access_Type","1");
						session.setAttribute("Access_Id",request.getParameter("Account"));
						session.setAttribute("Access_Name",rs.getString("User_Name"));
						session.setAttribute("Alert","使用者登入成功！");
						session.setMaxInactiveInterval(10*60);
						response.sendRedirect("Pages/Search_Place.jsp");
						break;
						
					case 2:
						session.setAttribute("Access_Type","2");
						session.setAttribute("Access_Id",request.getParameter("Account"));
						session.setAttribute("Access_Name",rs.getString("User_Name"));
						session.setAttribute("Alert","審核者登入成功！");
						session.setMaxInactiveInterval(10*60);
						response.sendRedirect("Pages/Approval.jsp");
						break;
						
					case 3:
						session.setAttribute("Access_Type","3");
						session.setAttribute("Access_Id",request.getParameter("Account"));
						session.setAttribute("Access_Name",rs.getString("User_Name"));
						session.setAttribute("Alert","管理員登入成功！");
						session.setMaxInactiveInterval(10*60);
						response.sendRedirect("Ad_Pages/Ad_Class.jsp");
						break;
					}
			}else{
				session.setAttribute("Alert","登入失敗！");
			}
				
		}
	
    
  	

      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("        <div class=\"Header\">\r\n");
      out.write("            <div class=\"Head\">\r\n");
      out.write("                <img src=\"Images/System_Logo.png\" alt=\"\">\r\n");
      out.write("                <h1>教室租借系統</h1>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"Container\">\r\n");
      out.write("            <form class=\"Login\"  method=\"post\">\r\n");
      out.write("                <h2>歡迎來到教室租借系統網</h2>\r\n");
      out.write("                <input type=\"text\" id=\"Account\" name=\"Account\" placeholder=\"學號/教職員帳號\">\r\n");
      out.write("                <input type=\"password\" id=\"Password\" name=\"Password\"  placeholder=\"密碼\">\r\n");
      out.write("                <input class=\"Login_Btn\" type=\"submit\" value=\"登錄\">\r\n");
      out.write("                <a href=\"\">忘記密碼？</a>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Pages/Page_Function/Footer.jsp", out, false);
      out.write("\r\n");
      out.write(" \r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
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
