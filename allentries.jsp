<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.sql.*"%>



<!DOCTYPE html>
<html lang="en-US">

<head>
  <title>Entries</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
 	<jsp:include page="bootstrapfiles.jsp" />  
</head>  
<style>  

<jsp:include page="style.css" />

body {  
  min-height: 100vh;  
 /*background-color: #FFE53B;  
  background-image: linear-gradient(90deg, rgba(251,135,63,1) 0%, rgba(252,70,144,1) 100%);	*/
  background-color: #bd4975;  
   
}  

 td 
{
    text-align: center; 
    vertical-align: middle;
}

</style>  

<body id="allent">  

<div id="mySidenav" class="sidenav">    
  
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="form.jsp">Add Trainer</a>
  <a href="allentries.jsp">All entries</a>
</div>

<div>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>





<main id="main">

<div class="container" id="form">  
  <div class="row py-5">  
    <div class="col-12">  
      <table id="example" class="table table-hover responsive nowrap" style="width:100%">  
        <thead> 
                 <%
					try{				
						
						
						Class.forName("com.mysql.jdbc.Driver");
				        Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/db_code","root","");
				        Statement st=con.createStatement();
				        ResultSet resultSet=st.executeQuery("select * from tb_data;");
						int rowCount = 0;    
						while( resultSet.next()){
						rowCount++;
						if(rowCount==1){
				  %>
					<tr>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Trainer Name</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">E-mail Address</th>				           
			            <th colspan="4" style="horizontal-align : middle;text-align:center; width: 50%;">Demo Class</th>
			            <th colspan="4" style="horizontal-align : middle;text-align:center; width: 50%;">Paid Class</th>
			            <th colspan="8" style="horizontal-align : middle;text-align:center; width: 50%;">Courses</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">DAYS (in a month)</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Total Income</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Change</th>				           
			            
			        </tr>
			        <tr>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Day (8 AM to 6 PM IST)</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Night (6 PM to 8 AM IST)</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Day (8 AM to 6 PM IST)</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Night (6 PM to 8 AM IST)</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">I - Level 1 (20 hours)</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">I - Level 2 (30 hours)</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">II - Level 1 (20 hours)</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">II - Level 2 (30 hours)</th>
			              
			        </tr>   
			            
			        <tr>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount</th>
			            
			        </tr>
                 </thead>
                 
                 <tbody>                 
                 <%}
					String tr_id= resultSet.getString("user_id");													
					String name= resultSet.getString("tname");		    
		    		String email= resultSet.getString("temail");		  
		    		String ddcount= resultSet.getString("demo_d_cnt");
		 			String ddamt= resultSet.getString("demo_d_amt");
		 			String dncount= resultSet.getString("demo_n_cnt");
		 			String dnamt= resultSet.getString("demo_n_amt");
		 			String pdcount= resultSet.getString("paid_d_cnt");
		 			String pdamt= resultSet.getString("paid_d_amt");
		 			String pncount= resultSet.getString("paid_n_cnt");
		 			String pnamt= resultSet.getString("paid_n_amt");
		 			String ccnto= resultSet.getString("ccnto");
		 			String camto= resultSet.getString("co_amt");
		 			String ccntt= resultSet.getString("ct_cnt");
		 			String camtt= resultSet.getString("ct_amt");
		 			String ccntr= resultSet.getString("cr_cnt");
		 			String camtr= resultSet.getString("cr_amt");
		 			String days= resultSet.getString("days");
		 			String total= resultSet.getString("gross_tot");
		 		 // out.write("alert('t no+ " + token + "')");	 			 
		 	   %>
                
                
                <tr>
                
		       		<td><p class="font-weight-bold mb-0"> <%=resultSet.getString("tname") %> </p></td>  
		            <td><p class="text-muted mb-0"> <%=resultSet.getString("temail") %> </p> </td>  
		            <td> <%=resultSet.getString("demo_d_cnt") %> </td>
		            <td> <%=resultSet.getString("demo_d_amt") %> </td>  
		            <td> <%=resultSet.getString("demo_n_cnt") %> </td>  
		            <td> <%=resultSet.getString("demo_n_amt") %> </td>
		            <td> <%=resultSet.getString("paid_d_cnt") %> </td>  
		            <td> <%=resultSet.getString("paid_d_amt") %> </td>  
		            <td> <%=resultSet.getString("paid_n_cnt") %> </td>
		            <td> <%=resultSet.getString("paid_n_amt") %> </td>  
		            <td> <%=resultSet.getString("ccnto") %> </td>  
		            <td> <%=resultSet.getString("co_amt") %> </td>
		            <td> <%=resultSet.getString("ct_cnt") %> </td>  
		            <td> <%=resultSet.getString("ct_amt") %> </td>  
		            <td> <%=resultSet.getString("cr_cnt") %> </td>  
		            <td> <%=resultSet.getString("cr_amt") %> </td>  
					<td> <%=resultSet.getString("cf_cnt") %> </td>  
		            <td> <%=resultSet.getString("cf_amt") %> </td>  
					<td> <%=resultSet.getString("days") %> </td>  
		            <td> <%=resultSet.getString("gross_tot") %> </td>  
	            	
	            	<td>
            	    <form action="edit.jsp" method="post">	
					 <input type="hidden" name="tid" value="<%= resultSet.getString("user_id")  %>" />
					 <input type="hidden" name="tname" value="<%= resultSet.getString("tname") %>" />
					 <input type="hidden" name="tmail" value="<%= resultSet.getString("temail")  %>" />
					 <input type="hidden" name="demo_d_cnt" value="<%= resultSet.getString("demo_d_cnt") %>" />
					 <input type="hidden" name="demo_d_amt" value="<%= resultSet.getString("demo_d_amt") %>" />					 
					 <input type="hidden" name="demo_n_cnt" value="<%= resultSet.getString("demo_n_cnt") %>" />
					 <input type="hidden" name="demo_n_amt" value="<%= resultSet.getString("demo_n_amt") %>" />
					 <input type="hidden" name="paid_d_cnt" value="<%= resultSet.getString("paid_d_cnt") %>" />
					 <input type="hidden" name="paid_d_amt" value="<%= resultSet.getString("paid_d_amt") %>" />
					 <input type="hidden" name="paid_n_cnt" value="<%= resultSet.getString("paid_n_cnt") %>" />
					 <input type="hidden" name="paid_n_amt" value="<%= resultSet.getString("paid_n_amt") %>" />
					 <input type="hidden" name="ccnto" value="<%= resultSet.getString("ccnto") %>" />
					 <input type="hidden" name="co_amt" value="<%= resultSet.getString("co_amt") %>" />
					 <input type="hidden" name="ct_cnt" value="<%= resultSet.getString("ct_cnt") %>" />
					 <input type="hidden" name="ct_amt" value="<%= resultSet.getString("ct_amt") %>" />
					 <input type="hidden" name="cr_cnt" value="<%= resultSet.getString("cr_cnt") %>" />
					 <input type="hidden" name="cr_amt" value="<%= resultSet.getString("cr_amt") %>" />
					 <input type="hidden" name="cf_cnt" value="<%= resultSet.getString("cf_cnt") %>" />
					 <input type="hidden" name="cf_amt" value="<%= resultSet.getString("cf_amt") %>" />
					 <input type="hidden" name="days" value="<%= resultSet.getString("days") %>" />
					 <input type="hidden" name="gross_tot" value="<%= resultSet.getString("gross_tot") %>" />
					 <button type="submit" class="myButton" > Edit</button>
					</form>
				<%}
				
						if (rowCount == 0){
	                           
                            %>
                            
                            
                            
							    <section class="content">
							      <div class="container-fluid" style="padding-left: 3%;">
							        <div class="row">
							          <div class="col-md-6">
							            <!-- general form elements -->
							            <div class="card card-primary">
							              <div class="card-header">
							                <h3 class="card-title">No Entries are present</h3>
							              </div>
							             </div>
							             </div>
							             </div>
							             </div>
							             </section>
                  
                            <%
                            
                        } 
				
				
				
				%>
										
					
					</td>
                </tr>
                <%
 
                }
				catch(Exception e)
				{
					out.println("wrong entry"+e);
				}
				%> 
                </tbody>  
      </table>  
    </div>  
  </div>  
</div>  
<div class="container text-center">  
  <div class="row py-5">  
    <div class="col-12">  
          
    </div>  
  </div>  
</div>

  </main>
  
  
  

<!-- 
<div class="container" id="form">  
  <div class="row py-5">  
    <div class="col-12">  
      <table id="example" class="table table-hover responsive nowrap" style="width:100%">  
        <thead>  
        <h2> Bootstrap4 DataTable Example </h2>  
          <tr>  
            <th>Client Name</th>  
            <th>Phone Number</th>  
            <th>Profession</th>  
            <th>Date of Birth</th>  
            <th>App Access</th>  
            <th>Actions</th>  
          </tr>  
        </thead>  
        <tbody>  
          <tr>  
            <td>  
              <a href="#">  
                <div class="d-flex align-items-center">  
                  <div class="avatar avatar-blue mr-3">EB</div>  
  
                  <div class="">  
                    <p class="font-weight-bold mb-0"> Ram </p>  
                    <p class="text-muted mb-0">ram@example.com</p>  
                  </div>  
                </div>  
              </a>  
            </td>  
            <td>(784) 667 8768</td>  
            <td>Designer</td>  
            <td>09/04/1996</td>  
            <td>  
              <div class="badge badge-success badge-success-alt">Enabled</div>  
            </td>  
            <td>  
              <div class="dropdown">  
                <button class="btn btn-sm btn-icon" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  
                      <i class="bx bx-dots-horizontal-rounded" data-toggle="tooltip" data-placement="top"  
                        title="Actions"></i>  
                    </button>  
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">  
                  <a class="dropdown-item" href="#"><i class="bx bxs-pencil mr-2"></i> Edit Profile</a>  
                  <a class="dropdown-item text-danger" href="#"><i class="bx bxs-trash mr-2"></i> Remove</a>  
                </div>  
              </div>  
            </td>  
          </tr>  
          <tr>  
            <td>  
              <a href="#">  
                <div class="d-flex align-items-center">  
                  <div class="avatar avatar-pink mr-3">JR</div>  
                  <div class="">  
                    <p class="font-weight-bold mb-0">Richa</p>  
                    <p class="text-muted mb-0">richa_89@example.com</p>  
                  </div>  
                </div>  
              </a>  
            </td>  
            <td> (937) 874 6878</td>  
            <td> Banker</td>  
            <td>13/01/1989</td>  
            <td>  
              <div class="badge badge-success badge-success-alt">Enabled</div>  
            </td>  
            <td>  
              <div class="dropdown">  
                <button class="btn btn-sm btn-icon" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  
                      <i class="bx bx-dots-horizontal-rounded" data-toggle="tooltip" data-placement="top"  
                        title="Actions"></i>  
                    </button>  
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">  
                  <a class="dropdown-item" href="#"><i class="bx bxs-pencil mr-2"></i> Edit Profile</a>  
                  <a class="dropdown-item text-danger" href="#"><i class="bx bxs-trash mr-2"></i> Remove</a>  
                </div>  
              </div>  
            </td>  
          </tr>  
        </tbody>  
      </table>  
    </div>  
  </div>  
</div>  
<div class="container text-center">  
  <div class="row py-5">  
    <div class="col-12">  
          
    </div>  
  </div>  
</div>  

-->

















































<script>  
$(document).ready(function() {  
  $("#example").DataTable({  
    aaSorting: [],  
    responsive: true,  
    columnDefs: [  
      {  
        responsivePriority: 1,  
        targets: 0  
      },  
      {  
        responsivePriority: 2,  
        targets: -1  
      }  
    ]  
  });  
  $(".dataTables_filter input")  
    .attr("placeholder", "Search here...")  
    .css({  
      width: "300px",  
      display: "inline-block"  
    });  
  $('[data-toggle="tooltip"]').tooltip();  
});  
</script>  


<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}
</script>
</body>  
</html>    