/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.46
 * Generated at: 2023-02-03 16:13:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Ad_005fPages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.RCS.*;
import java.sql.*;

public final class Ad_005fBuilding_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/Ad_Pages/../../Pages/Page_Function/Alert.jsp", Long.valueOf(1675433330000L));
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

if(session.getAttribute("Access_Type") !="3"){
	session.setAttribute("Alert","您無權存取此網頁，或超過存取期限！將自動跳轉登入頁面！");
	response.sendRedirect("../Index.jsp");}


      out.write(" \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU\" crossorigin=\"anonymous\">\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"../Js/Ad.js\" ></script>\r\n");
      out.write("    <title>大樓管理  - 國立臺北護理健康大學</title>\r\n");
      out.write("    ");
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
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"container p-0 shadow-lg \">\r\n");
      out.write("        <div class=\"container \">\r\n");
      out.write("            <div class=\"row accordion nav nav-pills \"id=\"Nav_Bar\">\r\n");
      out.write("						  <div class=\"col   accordion-item\">\r\n");
      out.write("						    <h2 class=\"accordion-header\" id=\"headingOne\">\r\n");
      out.write("						      <button class=\"accordion-button collapsed\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapseOne\" >\r\n");
      out.write("						        教室管理\r\n");
      out.write("						      </button>\r\n");
      out.write("						    </h2>\r\n");
      out.write("						  </div>\r\n");
      out.write("						  <div class=\"col  accordion-item\">\r\n");
      out.write("						    <h2 class=\"accordion-header\" id=\"headingOne\">\r\n");
      out.write("						      <button class=\"accordion-button collapsed\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapseTwo\" >\r\n");
      out.write("						        使用者管理\r\n");
      out.write("						      </button>\r\n");
      out.write("						    </h2>\r\n");
      out.write("						  </div>\r\n");
      out.write("						  <div class=\"col  accordion-item\">\r\n");
      out.write("						    <h2 class=\"accordion-header\" id=\"headingOne\">\r\n");
      out.write("						      <button class=\"accordion-button collapsed\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapseThree\" >\r\n");
      out.write("						        其他功能(登出)\r\n");
      out.write("						      </button>\r\n");
      out.write("						    </h2>\r\n");
      out.write("						  </div>\r\n");
      out.write("					<div id=\"collapseOne\" class=\"accordion-collapse collapse col-12 show\"  data-bs-parent=\"#Nav_Bar\">\r\n");
      out.write("					      <div class=\"accordion-body row d-flex justify-content-evenly m-0 p-0 pt-2 text-center\" >\r\n");
      out.write("						        <a class=\"nav-link pb-0 col-4\"  href=\"Ad_Class.jsp\">教室管理</a>\r\n");
      out.write("		                   		<a class=\"nav-link pb-0 col-4 active\" href=\"Ad_Building.jsp\">大樓管理</a>\r\n");
      out.write("		                    	<a class=\"nav-link pb-0 col-4\" href=\"Ad_Class_Type.jsp\">教室類型管理</a>\r\n");
      out.write("					      </div>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div id=\"collapseTwo\" class=\"accordion-collapse collapse col-12\"  data-bs-parent=\"#Nav_Bar\">\r\n");
      out.write("					      <div class=\"accordion-body row d-flex justify-content-evenly m-0 p-0 pt-2 text-center\" >\r\n");
      out.write("						        <a class=\"nav-link pb-0 col-4  \" href=\"Ad_Account.jsp\">使用者管理</a>\r\n");
      out.write("					      </div>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div id=\"collapseThree\" class=\"accordion-collapse collapse col-12  \"  data-bs-parent=\"#Nav_Bar\">\r\n");
      out.write("					      <div class=\"accordion-body row d-flex justify-content-evenly m-0 p-0 pt-2 text-center\" >\r\n");
      out.write("						        <a class=\"nav-link pb-0 col-4  active \" href=\"../Pages/Page_Function/Logout.jsp\">登出</a>\r\n");
      out.write("					      </div>\r\n");
      out.write("					</div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"container border border-2 border-primary \">\r\n");
      out.write("            <div class=\"row border-bottom border-1 border-primary\">\r\n");
      out.write("                <div class=\"col\">\r\n");
      out.write("                    <form class=\"row p-3 text-center d-flex justify-content-center align-items-center \" action=\"\">\r\n");
      out.write("                        <label class=\"fs-5\" for=\"Search\">搜索名稱</label>\r\n");
      out.write("                        <input style=\"width: 200px;\" placeholder=\"輸入教室名稱\" class=\"form-control\" type=\"search\" id=\"Search\" name=\"Search\">\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"col d-flex justify-content-center align-items-center\">\r\n");
      out.write("                    <button type=\"button\" data-bs-toggle=\"modal\" data-bs-target=\"#Create_Class_Form\" class=\"btn btn-lg btn-danger  \">新增大樓</button>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("\r\n");
      out.write("            <div class=\"row py-1\">\r\n");
      out.write("                <div class=\"accordion accordion-flush \" id=\"accordionExample\">\r\n");
      out.write("                \r\n");
      out.write("                ");
 
                String Search = request.getParameter("Search");
                 
                DB_CRUD DB = new DB_CRUD();
                ResultSet rs =DB.getResultSet("SELECT * FROM  Building_Code WHERE Building_Name LIKE '%"+Search+"%' ");
                rs.last();
                
                if(Search != null &&  rs.getRow()!=0 ){
                	rs.first();
                	rs.beforeFirst();
                }else if(Search != null &&  rs.getRow()==0){
                	out.print("查無資料");
                }else{
                	rs =DB.getResultSet("SELECT * FROM Building_Code");
                }
                
                int i =0;
                while(rs.next()){
                	out.println("<div class='accordion-item'>");
                	out.println("<h2 class='accordion-header' id='H"+i+"'>");
                	out.println("<button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#C"+i+"' >"+rs.getString("Building_Name")+"</button>");
                	out.println("</h2>");
                	out.println("<div id='C"+i+"' class='accordion-collapse collapse' "+i+"' data-bs-parent='#accordionExample'>");
                	out.println("<div class='accordion-body row'>");
                	out.println("<div class='col-12'>");
                	out.println(" <p>大樓名稱：<span id='Ob3_"+i+"'>"+rs.getString("Building_Name")+"</span></p>");
                	out.println(" <p>大樓代碼：<span id='Ob2_"+i+"'>"+rs.getString("Building_Code")+"</span></p>");
                	out.println(" </div>   ");
                	out.println("<div class='col-12 mt-2 d-flex flex-column'>");
                	out.println("<button type='button' onclick='Edit("+i+")' data-bs-toggle='modal' data-bs-target='#Edit_Class_Form' class='btn btn-secondary '>編輯</button>");
                	out.println("<button type='button' onclick ='Delete("+i+")' data-bs-toggle='modal' data-bs-target='#Delete' class='btn btn-danger '>刪除</button>");
                	out.println("</div>");
                	out.println("</div>");
                	out.println("</div>");
                	out.println("</div>");
                	i++;
                }
                
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"modal fade\" id=\"Create_Class_Form\" tabindex=\"-1\" >\r\n");
      out.write("        <div class=\"modal-dialog\">\r\n");
      out.write("          <div class=\"modal-content\">\r\n");
      out.write("            <form action=\"Function/Creat.jsp\" method=\"get\">\r\n");
      out.write("                <div class=\"modal-header\">\r\n");
      out.write("                    <h5 class=\"modal-title\" id=\"exampleModalLabel\">新增大樓</h5>\r\n");
      out.write("                    <button type=\"reset\" class=\"btn-close\" data-bs-dismiss=\"modal\" ></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-body\">\r\n");
      out.write("                    <div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"COb0\">資料表位置：</label>\r\n");
      out.write("                        <input class=\"form-control width-25 \" id=\"COb0\" type=\"text\"  readonly=\"true\" name=\"Ob0\" value=\"Building_Code\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"COb1\">大樓代碼：</label>\r\n");
      out.write("                        <input class=\"form-control width-25 \" id=\"COb1\" type=\"text\"   name=\"Ob1\"  pattern=\"[0-9A-Z]\" required>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"COb2\">大樓名稱：</label>\r\n");
      out.write("                        <input class=\"form-control width-25 \" id=\"COb2\" type=\"text\"   name=\"Ob2\" required>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-footer\">\r\n");
      out.write("                    <button type=\"reset\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">取消變更</button>\r\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">新增大樓</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("	\r\n");
      out.write("	<div class=\"modal fade\" id=\"Edit_Class_Form\" tabindex=\"-1\" >\r\n");
      out.write("        <div class=\"modal-dialog\">\r\n");
      out.write("          <div class=\"modal-content\">\r\n");
      out.write("            <form action=\"Function/Edit.jsp\" method=\"get\">\r\n");
      out.write("                <div class=\"modal-header\">\r\n");
      out.write("                    <h5 class=\"modal-title\" id=\"exampleModalLabel\">編輯大樓</h5>\r\n");
      out.write("                    <button type=\"reset\" class=\"btn-close\" data-bs-dismiss=\"modal\" ></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-body\">\r\n");
      out.write("                	<div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"Ob0\">資料表位置：</label>\r\n");
      out.write("                        <input class=\"form-control width-25 \" id=\"Ob0\" type=\"text\"  readonly=\"true\" name=\"Ob0\" value=\"Building_Code\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"Ob1\">主鍵欄位名稱：</label>\r\n");
      out.write("                        <input class=\"form-control width-25 \" id=\"Ob1\" type=\"text\"  readonly=\"true\" name=\"Ob1\" value=\"Building_Code\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"Ob2\">大樓代碼：</label>\r\n");
      out.write("                        <input class=\"form-control width-25 \" id=\"Ob2\" type=\"text\"  readonly=\"true\" name=\"Ob2\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"Ob3\">大樓名稱：</label>\r\n");
      out.write("                        <input class=\"form-control\" id=\"Ob3\" type=\"text\" name=\"Ob3\" placeholder=\"大樓名稱\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-footer\">\r\n");
      out.write("                    <button type=\"reset\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">取消變更</button>\r\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">儲存變更</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("	\r\n");
      out.write("    <!-- 刪除 -->\r\n");
      out.write("    <div class=\"modal fade\" id=\"Delete\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("        <div class=\"modal-dialog\">\r\n");
      out.write("          <div class=\"modal-content\">\r\n");
      out.write("            <form action=\"Function/Delete.jsp\" method=\"get\">\r\n");
      out.write("                <div class=\"modal-header\">\r\n");
      out.write("                    <h5 class=\"modal-title\" id=\"exampleModalLabel\">確定刪除？</h5>\r\n");
      out.write("                    <button type=\"reset\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-body\">\r\n");
      out.write("                	<div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"Ob0\">資料表位置：</label>\r\n");
      out.write("                        <input class=\"form-control width-25 \" id=\"DOb0\" type=\"text\"  readonly=\"true\" name=\"Ob0\" value=\"Building_Code\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"Ob1\">主鍵欄位名稱：</label>\r\n");
      out.write("                        <input class=\"form-control width-25 \" id=\"DOb1\" type=\"text\"  readonly=\"true\" name=\"Ob1\" value=\"Building_Code\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"d-flex justify-content-center\">\r\n");
      out.write("                        <label class=\"text-nowrap fs-4\" for=\"Ob2\">大樓代碼：</label>\r\n");
      out.write("                        <input class=\"form-control width-25 \" id=\"DOb2\" type=\"text\"  readonly=\"true\" name=\"Ob2\" >\r\n");
      out.write("                	</div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-footer\">\r\n");
      out.write("                	\r\n");
      out.write("                    <button type=\"reset\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">取消</button>\r\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">確定</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
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
