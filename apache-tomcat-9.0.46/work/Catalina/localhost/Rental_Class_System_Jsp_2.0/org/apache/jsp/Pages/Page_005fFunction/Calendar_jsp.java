/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.46
 * Generated at: 2023-02-03 16:12:28 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Pages.Page_005fFunction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class Calendar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

String days[];//新增天數陣列
  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <title>日曆</title>\r\n");
      out.write("</head>\r\n");
      out.write("	\r\n");
      out.write("<body>\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("   	");
days=new String[42]; 
      out.write("<!--6*7的表格-->\r\n");
      out.write("    ");

        for(int i=0;i<42;i++){
            days[i]="";
        }//清空陣列
    
      out.write('\r');
      out.write('\n');
      out.write('	');

	
		
	    GregorianCalendar currentday=new GregorianCalendar();
	    int year=currentday.get(Calendar.YEAR) ;
	    int month=currentday.get(Calendar.MONTH)+1;
	    int day=currentday.get(Calendar.DAY_OF_MONTH);
	  //以上是取得使用者當天的日期
	    Calendar currentmonth=Calendar.getInstance();
	    currentmonth.setFirstDayOfWeek(Calendar.SUNDAY);//設置每週第一天是週日
	    currentmonth.set(Calendar.DAY_OF_MONTH,1);//設置每月第一天是一號 */
	    int first=currentmonth.get(Calendar.DAY_OF_WEEK)-1;//假日曆的第一天是這週的第幾天
	    int last=currentmonth.getActualMaximum(Calendar.DAY_OF_MONTH);
	    for(int i=0;i<last;i++){
	        days[first+i]=String.valueOf(i+1);
	    }
	
      out.write("\r\n");
      out.write("	<div class=\"Date\">\r\n");
      out.write("		<table>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<th id=\"");
      out.print(year );
      out.write("\" colspan=\"5\">");
      out.print(year );
      out.write("年</th>\r\n");
      out.write("			        <th id=\"");
      out.print(month );
      out.write("\" colspan=\"2\">");
      out.print(month );
      out.write("月</th>\r\n");
      out.write("				</tr>\r\n");
      out.write("			    <tr>\r\n");
      out.write("			        <th>日</th>\r\n");
      out.write("			        <th>一</th>\r\n");
      out.write("			        <th>二</th>\r\n");
      out.write("			        <th>三</th>\r\n");
      out.write("			        <th>四</th>\r\n");
      out.write("			        <th>五</th>\r\n");
      out.write("			        <th>六</th>\r\n");
      out.write("			    </tr>\r\n");
      out.write("			\r\n");
      out.write("			    ");
for(int i=0;i<6;i++){
      out.write("\r\n");
      out.write("			    <tr>\r\n");
      out.write("			           ");
 for(int j=i*7;j<(i+1)*7;j++){
      out.write("\r\n");
      out.write("			                    ");
if((j-first+1)==day){
      out.write("<!--判斷是否是當天-->  \r\n");
      out.write("			                        <td style=\"cursor: pointer;\" class=\"Today\" onclick=\"Post_Day(");
      out.print(year);
      out.write(',');
      out.print(month);
      out.write(',');
      out.print(days[j]);
      out.write(')');
      out.write('"');
      out.write('>');
      out.print(days[j]);
      out.write("</td>\r\n");
      out.write("			                        \r\n");
      out.write("			                    ");
}else if(j<first){
      out.write("<!--判斷是否是上個月的日子-->  \r\n");
      out.write("			                        <td class=\"Empty_Day\">");
      out.print(days[j]);
      out.write("</td> \r\n");
      out.write("			                        \r\n");
      out.write("			                    ");
}else if(j>last+first-1){
      out.write("<!--判斷是否是下個月的日子-->  \r\n");
      out.write("			                        <td class=\"Empty_Day\">");
      out.print(days[j]);
      out.write("</td> \r\n");
      out.write("			                        \r\n");
      out.write("			                    ");
}else{
      out.write("\r\n");
      out.write("			                        <td style=\"cursor: pointer;\" onclick=\"Post_Day(");
      out.print(year);
      out.write(',');
      out.print(month);
      out.write(',');
      out.print(days[j]);
      out.write(')');
      out.write('"');
      out.write('>');
      out.print(days[j]);
      out.write("</td>\r\n");
      out.write("			                        ");
}
      out.write("\r\n");
      out.write("			                    ");
}
      out.write("\r\n");
      out.write("				</tr>\r\n");
      out.write("			 ");
 }
      out.write("\r\n");
      out.write("			    \r\n");
      out.write("		</table>\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
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
