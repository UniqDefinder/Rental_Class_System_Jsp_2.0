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
    <title>帳號管理 - 國立臺北護理健康大學</title>
    
</head>
<body>
    
    <div class="container p-0 shadow-lg ">
        <div class="container ">
            <div class="row accordion nav nav-pills "id="Nav_Bar">
						  <div class="col   accordion-item">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" >
						        教室管理
						      </button>
						    </h2>
						  </div>
						  <div class="col  accordion-item">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" >
						        使用者管理
						      </button>
						    </h2>
						  </div>
						  <div class="col  accordion-item">
						    <h2 class="accordion-header" id="headingOne">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" >
						        公告管理
						      </button>
						    </h2>
						  </div>
					<div id="collapseOne" class="accordion-collapse collapse col-12 "  data-bs-parent="#Nav_Bar">
					      <div class="accordion-body row d-flex justify-content-evenly m-0 p-0 pt-2 text-center" >
						        <a class="nav-link pb-0 col-4   "  href="Ad_Class.jsp">教室管理</a>
		                   		<a class="nav-link pb-0 col-4" href="Ad_Building.jsp">大樓管理</a>
		                    	<a class="nav-link pb-0 col-4 " href="Ad_Class_Type.jsp">教室類型管理</a>
					      </div>
					</div>
					<div id="collapseTwo" class="accordion-collapse collapse col-12  show"  data-bs-parent="#Nav_Bar">
					      <div class="accordion-body row d-flex justify-content-evenly m-0 p-0 pt-2 text-center" >
						        <a class="nav-link pb-0 col-4  active " href="Ad_Account.jsp">使用者管理</a>
					      </div>
					</div>
            </div>
        </div>
        <div class="container border border-2 border-primary ">
            <div class="row border-bottom border-1 border-primary">
                <div class="col">
                    <form class="row p-3 text-center d-flex justify-content-center align-items-center " action="">
                        <label class="fs-5" for="Search">搜索名稱</label>
                        <input style="width: 200px;" class="form-control" placeholder="輸入帳號或學號" type="search" id="Search" name="Search">
                    </form>
                </div>

                <div class="col d-flex justify-content-center align-items-center">
                    <button type="button" data-bs-toggle="modal" data-bs-target="#Create_Account" class="btn btn-lg btn-danger  ">新增帳號</button>
                </div>
                
            </div>
            

            <div class="row py-1 table-responsive">
                <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">帳號</th>
                        <th scope="col">身分</th>
                        <th scope="col">姓名</th>
                        <th scope="col">電話</th>
                        <th scope="col">電子信箱</th>
                        <th scope="col">功能</th>
                      </tr>
                    </thead>
                    <tbody>
                      
                       <% 
			                String Search = request.getParameter("Search");
			                 
			                DB_CRUD DB = new DB_CRUD();
			                ResultSet rs =DB.getResultSet("SELECT * FROM User AS a LEFT JOIN User_Type_Code AS b ON a.User_Type = b.User_Type_Code WHERE Account LIKE '%"+Search+"%' ");
			                rs.last();
			                
			                if(Search != null &&  rs.getRow()!=0 ){
			                	rs.first();
			                	rs.beforeFirst();
			                }else if(Search != null &&  rs.getRow()==0){
			                	out.print("查無資料");
			                }else{
			                	rs =DB.getResultSet("SELECT * FROM User AS a LEFT JOIN User_Type_Code AS b ON a.User_Type = b.User_Type_Code ");
			                }
			                
			                int i =0;
			                while(rs.next()){
			                	out.println("<tr>");
			                	out.println("<tr>");
			                	out.println("<th scope='row'>"+rs.getString("Account")+"</th>");
			                	out.println("<td>"+rs.getString("User_Type_Name")+"</td>");
			                	out.println("<td>"+rs.getString("User_Name")+"</td>");
			                	out.println("<td>"+rs.getString("Phone_Number")+"</td>");
			                	out.println("<td>"+rs.getString("Email")+"</td>");
			                	out.println("<td class='d-flex flex-nowarp jus'>");
			                	out.println(" <button type='button' data-bs-toggle='modal' data-bs-target='#Edit_Account' class='btn btn-sm btn-danger'>編輯</button>");
			                	out.println("	<button type='button' data-bs-toggle='modal' data-bs-target='#Delet_Account' class='btn btn-sm btn-danger'>刪除</button>");
			                	out.println("</td>");
			                	out.println("</tr>");
			               	 }
			                %>
                          	
                    
                    </tbody>
                  </table>
            </div>
        </div>
    </div>

    <!-- 新增 -->

    <div class="modal fade" id="Create_Account" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">個人資料新增</h5>
                    <button type="reset" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_A">帳號：</label>
                        <input class="form-control width-25" id="input_A" type="text" placeholder="帳號" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_B">密碼：</label>
                        <input class="form-control" id="input_B" type="text" placeholder="密碼" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_C">身分：</label>
                        <input class="form-control" id="input_C" type="text" placeholder="身分" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_D">姓名：</label>
                        <input class="form-control" id="input_D" type="text" placeholder="姓名" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_E">電子信箱：</label>
                        <input class="form-control" id="input_E" type="text" placeholder="電子信箱" aria-label="default input example">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">取消新增</button>
                    <button type="submit" class="btn btn-primary">確定新增</button>
                </div>
            </form>
          </div>
        </div>
    </div>

    <!-- 編輯 -->
    <div class="modal fade" id="Edit_Account" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">個人資料編輯</h5>
                    <button type="reset" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_A">帳號：</label>
                        <input class="form-control width-25" id="input_A" type="text" placeholder="帳號" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_B">密碼：</label>
                        <input class="form-control" id="input_B" type="text" placeholder="密碼" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_C">身分：</label>
                        <input class="form-control" id="input_C" type="text" placeholder="身分" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_D">姓名：</label>
                        <input class="form-control" id="input_D" type="text" placeholder="姓名" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_E">電子信箱：</label>
                        <input class="form-control" id="input_E" type="text" placeholder="電子信箱" aria-label="default input example">
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


    <!-- 刪除 -->
    <div class="modal fade" id="Delet_Account" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">確定刪除？</h5>
                    <button type="reset" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">確定</button>
                </div>
            </form>
          </div>
        </div>
    </div>

</body>

</html>