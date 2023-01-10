<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.RCS.*"%>
<%
if(session.getAttribute("Access_Type") !="3"){
	session.setAttribute("Alert","您無權存取此網頁，或超過存取期限！將自動跳轉登入頁面！");
	response.sendRedirect("../Index.jsp");}

%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <script src="../Js/Ad.js" ></script>
    <title>教室管理  - 國立臺北護理健康大學</title>
    <%@include file="../../Pages/Page_Function/Alert.jsp" %>
</head>
<body>
    
    <div class="container p-0 shadow-lg ">
        <div class="container ">
            <div class="row accordion nav nav-pills "id="Nav_Bar">
						  <div class="col   accordion-item">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" >
						        教室管理
						      </button>
						    </h2>
						  </div>
						  <div class="col  accordion-item">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" >
						        使用者管理
						      </button>
						    </h2>
						  </div>
						  <div class="col  accordion-item">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" >
						        其他功能(登出)
						      </button>
						    </h2>
						  </div>
					<div id="collapseOne" class="accordion-collapse collapse col-12 show "  data-bs-parent="#Nav_Bar">
					      <div class="accordion-body row d-flex justify-content-evenly m-0 p-0 pt-2 text-center" >
						        <a class="nav-link pb-0 col-4 active  "  href="Ad_Class.jsp">教室管理</a>
		                   		<a class="nav-link pb-0 col-4" href="Ad_Building.jsp">大樓管理</a>
		                    	<a class="nav-link pb-0 col-4 " href="Ad_Class_Type.jsp">教室類型管理</a>
					      </div>
					</div>
					<div id="collapseTwo" class="accordion-collapse collapse col-12"  data-bs-parent="#Nav_Bar">
					      <div class="accordion-body row d-flex justify-content-evenly m-0 p-0 pt-2 text-center" >
						        <a class="nav-link pb-0 col-4  " href="Ad_Account.jsp">使用者管理</a>
					      </div>
					</div>
					<div id="collapseThree" class="accordion-collapse collapse col-12  "  data-bs-parent="#Nav_Bar">
					      <div class="accordion-body row d-flex justify-content-evenly m-0 p-0 pt-2 text-center" >
						        <a class="nav-link pb-0 col-4  active " href="../Pages/Page_Function/Logout.jsp">登出</a>
					      </div>
					</div>
            </div>
        </div>
        <div class="container border border-2 border-primary ">
            <div class="row border-bottom border-1 border-primary">
                <div class="col">
                    <form class="row p-3 text-center d-flex justify-content-center align-items-center " action="">
                        <label class="fs-5" for="Search">搜索名稱</label>
                        <input style="width: 200px;" placeholder="輸入教室名稱" class="form-control" type="search" id="Search" name="Search">
                    </form>
                </div>

                <div class="col d-flex justify-content-center align-items-center">
                    <button type="button" data-bs-toggle="modal" data-bs-target="#Create_Class_Form" class="btn btn-lg btn-danger  ">新增教室</button>
                </div>
                
            </div>
            

            <div class="row py-1">
                <div class="accordion accordion-flush " id="accordionExample">
                
                <% 
                String Search = request.getParameter("Search");
                 
                DB_CRUD DB = new DB_CRUD();
                ResultSet rs =DB.getResultSet("SELECT * FROM Classroom_Code WHERE Classroom_Code LIKE '%"+Search+"%' ");
                rs.last();
                
                if(Search != null &&  rs.getRow()!=0 ){
                	rs.first();
                	rs.beforeFirst();
                }else if(Search != null &&  rs.getRow()==0){
                	out.print("查無資料");
                }else{
                	rs =DB.getResultSet("SELECT * FROM (Classroom_Code AS a LEFT JOIN Classroom_Type_Code AS b ON a.Classroom_Type_Code = b.Type_Code) LEFT JOIN Building_Code AS c ON a.Building_Code = c.Building_Code ORDER BY a.Classroom_Code");
                }
                
                int i =0;
                while(rs.next()){
                	out.println("<div class='accordion-item'>");
                	out.println("<h2 class='accordion-header' >");
                	out.println("<button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#H"+i+"' ><span>"+rs.getString("Classroom_Code")+"</span></button>");
                	out.println("</h2>");
                	out.println("<div id='H"+i+"' class='accordion-collapse collapse' "+i+"' data-bs-parent='#accordionExample'>");
                	out.println("<div class='accordion-body row'>");
                	out.println("<div class='col-4'>");
                	out.println("<img class='img-fluid' src='"+rs.getString("Imgs")+"' alt='教室圖片'>");
                	out.println("</div>");
                	out.println("<div class='col-8'>");
                	out.println(" <p>教室名稱：<span id='Ob2_"+i+"'>"+rs.getString("Classroom_Code")+"</span></p>");
                	out.println(" <p>教室類型：［<span id='Ob3_"+i+"'>"+rs.getString("Classroom_Type_Code")+"</span>］<span>"+rs.getString("Type")+"</span></p>");
                	out.println(" <p>大樓位置：［<span id='Ob4_"+i+"'>"+rs.getString("Building_Code")+"</span>］<span>"+rs.getString("Building_Name")+"</span></p>");
                	out.println(" </div>   ");
                	out.println("<div class='col-12 mt-2 d-flex flex-column'>");
                	out.println("<button type='button' onclick ='Edit("+i+")' data-bs-toggle='modal' data-bs-target='#Edit_Class_Form' class='btn btn-secondary '>編輯</button>");
                	out.println("<button type='button' class='btn btn-danger '>刪除</button>");
                	out.println("</div>");
                	out.println("</div>");
                	out.println("</div>");
                	out.println("</div>");
                	i++;
                }
                %>
                
                </div>
            </div>
        </div>
    </div>
    

    <div class="modal fade" id="Create_Class_Form" tabindex="-1" >
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">教室資訊</h5>
                    <button type="reset" class="btn-close" data-bs-dismiss="modal" ></button>
                </div>
                <div class="modal-body">
                    <div class="d-flex justify-content-center">
                    	<label class="text-nowrap fs-4" for="input_B">大樓位置：</label>
                    	<select class="form-control width-25"  id="input_B" name="Buliding">
	                    <option value="" disabled selected>選擇大樓位置</option>
	                    <%
	                    
	                    rs =DB.getResultSet("SELECT * FROM Building_Code");
	        			
	        			
	        			while(rs.next()){
	        				out.println("<option  value='" + rs.getString("Building_Code") + "'>" + rs.getString("Building_Name") + "</option>");
	        			}
	        			
	                    %> 
                		</select>
                       
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_C">教室名稱：</label>
                        <input class="form-control" id="input_C" type="text" placeholder="教室名稱" >
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_C">教室類型：</label>
                    	<select class="form-control width-25"  id="input_C" name="Buliding">
	                    <option value="" disabled selected>選擇教室類型</option>
	                    <%
	                    rs =DB.getResultSet("SELECT * FROM Classroom_Type_Code ");
	        			
	        			
	        			while(rs.next()){
	        				out.println("<option  value='" + rs.getString("Type_Code") + "'>" + rs.getString("Type") + "</option>");
	        			}
	                    %>
                		</select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">取消操作</button>
                    <button type="submit" class="btn btn-primary">確定新增</button>
                </div>
            </form>
          </div>
        </div>
    </div>

    <div class="modal fade" id="Edit_Class_Form" tabindex="-1" >
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="Function/Edit.jsp" method="get">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">編輯教室類型</h5>
                    <button type="reset" class="btn-close" data-bs-dismiss="modal" ></button>
                </div>
                <div class="modal-body">
                	<div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="Ob0">資料表位置：</label>
                        <input class="form-control width-25 " id="Ob0" type="text"  readonly="true" name="Ob0" value="Classroom_Code" >
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="Ob1">主鍵欄位名稱：</label>
                        <input class="form-control width-25 " id="Ob1" type="text"  readonly="true" name="Ob1" value="Classroom_Code" >
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="Ob2">教室名稱：</label>
                        <input class="form-control width-25 " id="Ob2" type="text"  readonly="true" name="Ob2" >
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="Ob3">教室類型：</label>
                    	<select class="form-control width-25"  id="Ob3" name="Ob3">
	                    <option value="" disabled selected>選擇教室類型</option>
	                    <%
	                    rs =DB.getResultSet("SELECT * FROM Classroom_Type_Code ");
	        			
	        			
	        			while(rs.next()){
	        				out.println("<option  value='" + rs.getString("Type_Code") + "'>" + rs.getString("Type") + "</option>");
	        			}
	                    %>
                		</select>
                    </div>
                    <div class="d-flex justify-content-center">
                    	<label class="text-nowrap fs-4" for="Ob4">大樓位置：</label>
                    	<select class="form-control width-25"  id="Ob4" name="Ob4">
	                    <option value="" disabled selected>選擇大樓位置</option>
	                    <%
	                    
	                    rs =DB.getResultSet("SELECT * FROM Building_Code");
	        			
	        			
	        			while(rs.next()){
	        				out.println("<option  value='" + rs.getString("Building_Code") + "'>" + rs.getString("Building_Name") + "</option>");
	        			}
	        			
	                    %> 
                		</select>
                       
                    </div>
                   
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">取消變更</button>
                    <button type="submit" class="btn btn-primary">儲存變更</button>
                </div>
            </form>
          </div>
        </div>
    </div>
	

</body>

</html>