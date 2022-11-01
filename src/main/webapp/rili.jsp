<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/2/25
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>

<html>
<head>
    <title>本月日曆</title>
</head>
<%!String days[];%>
<body>
    <%days=new String[42]; %><!--6*7的表格-->
    <%
        for(int i=0;i<42;i++){
            days[i]="";
        }
    %>
<%
    GregorianCalendar currentday=new GregorianCalendar();
    int year=currentday.get(Calendar.YEAR);
    int month=currentday.get(Calendar.MONTH);
    int day=currentday.get(Calendar.DAY_OF_MONTH);
    out.println(year+"年"+ (month+1)+"月"+day+"日");
    Calendar currentmonth=Calendar.getInstance();
    currentmonth.set(Calendar.DAY_OF_YEAR,year);
    currentmonth.set(Calendar.DAY_OF_MONTH,month);
    currentmonth.setFirstDayOfWeek(Calendar.SUNDAY);//設置每週第一天是週日
    currentmonth.set(Calendar.DAY_OF_MONTH,1);//設置每月第一天是一號
    int first=currentmonth.get(Calendar.DAY_OF_WEEK)-1;//本月第一天是周幾，也就是當月日曆顯示的第一個數字
    int last=currentmonth.getActualMaximum(Calendar.DAY_OF_MONTH);
    for(int i=0;i<last;i++){
        days[first+i]=String.valueOf(i+1);
    }
%>
<table  border="0" width="161" height="100">
<div align=center>
    <tr>
        <th bgcolor="yellow" width="25" height="16"><font color="red">日</font></th>
        <th bgcolor="yellow" width="25" height="16">一</th>
        <th bgcolor="yellow" width="25" height="16">二</th>
        <th bgcolor="yellow" width="25" height="16">三</th>
        <th bgcolor="yellow" width="25" height="16">四</th>
        <th bgcolor="yellow" width="25" height="16">五</th>
        <th bgcolor="yellow" width="25" height="16"><font color="green">六</font> </th>
    </tr>

    <%for(int i=0;i<6;i++){%>
    <tr>
           <% for(int j=i*7;j<(i+1)*7;j++){%>
                    <%if((j-first+1)==day){%><!--當天-->
                        <td bgcolor="red"><%=days[j]%></td>
                    <%}else{%>
                        <td bgcolor="#808080"> <%=days[j]%></td>
                        <%}%>
                    <%}%>

           <% }%>
    </tr>
</div>
</table>
</body>
</html>