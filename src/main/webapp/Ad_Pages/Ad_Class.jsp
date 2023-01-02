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
    <title>教室管理  - 國立臺北護理健康大學</title>
    
</head>
<body>
    
    <div class="container p-0 shadow-lg ">
        <div class="container ">
            <div class="row ">
                <nav class="nav nav-pills text-center">
                    <a class=" nav-link col active " aria-current="page" href="Ad_Class.jsp">教室管理</a>
                    <a class="nav-link col" href="Ad_Account.jsp">使用者管理</a>
                    <a class="nav-link col" href="#">公告管理</a>
                </nav>
                
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
                	rs =DB.getResultSet("SELECT * FROM Classroom_Code ");
                }
                
                int i =0;
                while(rs.next()){
                	out.println("<div class='accordion-item'>");
                	out.println("<h2 class='accordion-header' id='H"+i+"'>");
                	out.println("<button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#C"+i+"' aria-expanded='true' aria-controls='collapseOne'>"+rs.getString("Classroom_Code")+"</button>");
                	out.println("</h2>");
                	out.println("<div id='C"+i+"' class='accordion-collapse collapse' aria-labelledby='H"+i+"' data-bs-parent='#accordionExample'>");
                	out.println("<div class='accordion-body row'>");
                	out.println("<div class='col-4'>");
                	out.println("<img class='img-fluid' src='"+rs.getString("Imgs")+"' alt='教室圖片'>");
                	out.println("</div>");
                	out.println("<div class='col-8'>");
                	out.println(" <p>場地位置："+rs.getString("Classroom_Code")+"</p>");
                	out.println(" <p>教室名稱：</p>");
                	out.println(" </div>   ");
                	out.println("<div class='col-12 mt-2 d-flex flex-column'>");
                	out.println("<button type='button' data-bs-toggle='modal' data-bs-target='#Edit_Class_Form' class='btn btn-secondary '>編輯</button>");
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
    


    
    <div class="modal fade" id="Create_Class_Form" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">教室資訊</h5>
                    <button type="reset" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_B">場地位置：</label>
                        <input class="form-control width-25" id="input_B" type="text" placeholder="場地位置" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_C">教室名稱：</label>
                        <input class="form-control" id="input_C" type="text" placeholder="教室名稱" aria-label="default input example">
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

    <div class="modal fade" id="Edit_Class_Form" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">教室資訊</h5>
                    <button type="reset" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_B">場地位置：</label>
                        <input class="form-control width-25" id="input_B" type="text" placeholder="場地位置" aria-label="default input example">
                    </div>
                    <div class="d-flex justify-content-center">
                        <label class="text-nowrap fs-4" for="input_C">教室名稱：</label>
                        <input class="form-control" id="input_C" type="text" placeholder="教室名稱" aria-label="default input example">
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