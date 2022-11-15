<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/2/25
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>日曆</title>
</head>
	
<body>
	<%!String days[];//新增天數陣列%>
   	<%days=new String[42]; %><!--6*7的表格-->
    <%
        for(int i=0;i<42;i++){
            days[i]="";
        }//清空陣列
    %>
	<%
	
		
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
	%>
	<div class="Date">
		<table>
				<tr>
					<th id="<%=year %>" colspan="5"><%=year %>年</th>
			        <th id="<%=month %>" colspan="2"><%=month %>月</th>
				</tr>
			    <tr>
			        <th>日</th>
			        <th>一</th>
			        <th>二</th>
			        <th>三</th>
			        <th>四</th>
			        <th>五</th>
			        <th>六</th>
			    </tr>
			
			    <%for(int i=0;i<6;i++){%>
			    <tr>
			           <% for(int j=i*7;j<(i+1)*7;j++){%>
			                    <%if((j-first+1)==day){%><!--判斷是否是當天-->  
			                        <td class="Today" onclick="Post_Day(<%=year%>,<%=month%>,<%=days[j]%>)"><%=days[j]%></td>
			                        
			                    <%}else if(j<first){%><!--判斷是否是上個月的日子-->  
			                        <td class="Empty_Day"><%=days[j]%></td> 
			                        
			                    <%}else if(j>last+first-1){%><!--判斷是否是下個月的日子-->  
			                        <td class="Empty_Day"><%=days[j]%></td> 
			                        
			                    <%}else{%>
			                        <td onclick="Post_Day(<%=year%>,<%=month%>,<%=days[j]%>)"><%=days[j]%></td>
			                        <%}%>
			                    <%}%>
				</tr>
			 <% }%>
			    
		</table>
	</div>
</body>
</html>