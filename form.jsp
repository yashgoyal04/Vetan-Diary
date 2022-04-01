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
    <title>Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
    <jsp:include page="bootstrapfiles.jsp" />

</head>
<style>
 <jsp:include page="style.css" />
</style>

<body> 

<div id="mySidenav" class="sidenav">    
  
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="form.jsp">Add Trainer</a>
  <a href="allentries.jsp">All entries</a>
</div>

<div>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>











<%  


if(request.getParameter("submit")!=null){
	
	
//	System.out.print("tname");

	
String name=request.getParameter("tname");
String tmail=request.getParameter("tmail");
int de_d_cnt = Integer.parseInt(request.getParameter("demo_d_cnt"));
int de_d_amt = Integer.parseInt(request.getParameter("demo_d_amt"));
int de_n_cnt = Integer.parseInt(request.getParameter("demo_n_cnt"));
int de_n_amt = Integer.parseInt(request.getParameter("demo_n_amt"));

int pa_d_cnt = Integer.parseInt(request.getParameter("paid_d_cnt"));
int pa_d_amt = Integer.parseInt(request.getParameter("paid_d_amt"));
int pa_n_cnt = Integer.parseInt(request.getParameter("paid_n_cnt"));
int pa_n_amt = Integer.parseInt(request.getParameter("paid_n_amt"));


int cocnto = Integer.parseInt(request.getParameter("ccnto"));
int c_amt = Integer.parseInt(request.getParameter("co_amt"));
int cto_cnt = Integer.parseInt(request.getParameter("ct_cnt"));           
int cto_amt = Integer.parseInt(request.getParameter("ct_amt"));
int cth_cnt = Integer.parseInt(request.getParameter("cr_cnt"));           
int cth_amt = Integer.parseInt(request.getParameter("cr_amt"));
int cfo_cnt = Integer.parseInt(request.getParameter("cf_cnt"));           
int cfo_amt = Integer.parseInt(request.getParameter("cf_amt"));
int ndays = Integer.parseInt(request.getParameter("days"));



int d_damt= de_d_cnt * de_d_amt;
int d_namt= de_n_cnt * de_n_amt;
int p_damt= pa_d_cnt * pa_d_amt;
int p_namt= pa_n_cnt * pa_n_amt;


int coo_amt= cocnto * c_amt;
int coto_amt= cto_cnt * cto_amt; 
int coth_amt= cth_cnt * cth_amt;
int cof_amt= cfo_cnt * cfo_amt;



int gross_tot= d_damt+ d_namt+ p_damt+ p_namt+ coo_amt+ coto_amt+ coth_amt+ cof_amt;
int net_pay= gross_tot+ (gross_tot*1/100);



try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_code","root", "");   
    
    PreparedStatement ps = conn.prepareStatement("insert into tb_data(tname,temail,demo_d_cnt,demo_d_amt,demo_d_amt_tot,demo_n_cnt,demo_n_amt,demo_n_amt_tot,paid_d_cnt,paid_d_amt,paid_d_amt_tot,paid_n_cnt,paid_n_amt,paid_n_amt_tot,ccnto,co_amt,co_amt_tot,ct_cnt,ct_amt,ct_amt_tot,cr_cnt,cr_amt,cr_amt_tot,cf_cnt,cf_amt,cf_amt_tot,days,gross_tot,net_amt_pay)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
    
    ps.setString(1,name);
    ps.setString(2,tmail);
    ps.setInt(3,de_d_cnt);
    ps.setInt(4,de_d_amt);
    ps.setInt(5,d_damt);
    ps.setInt(6,de_n_cnt);
    ps.setInt(7,de_n_amt);
    ps.setInt(8,d_namt);
    ps.setInt(9,pa_d_cnt);
    ps.setInt(10,pa_d_amt);
    ps.setInt(11,p_damt);
    ps.setInt(12,pa_n_cnt);
    ps.setInt(13,pa_n_amt);
    ps.setInt(14,p_namt);
    ps.setInt(15,cocnto);
    ps.setInt(16,c_amt);
    ps.setInt(17,coo_amt);      
    ps.setInt(18,cto_cnt);
    ps.setInt(19,cto_amt);
    ps.setInt(20,coto_amt);    
    ps.setInt(21,cth_cnt);
    ps.setInt(22,cth_amt);
    ps.setInt(23,coth_amt);
    ps.setInt(24,cfo_cnt);
    ps.setInt(25,cfo_amt);
    ps.setInt(26,cof_amt);
    ps.setInt(27,ndays);    
    ps.setInt(28,gross_tot);
    ps.setInt(29,net_pay);
    	    	
   	int x = ps.executeUpdate();

   	ResultSet rst = ps.getGeneratedKeys();
   	if(rst.next())
   	{
   	 %>
  
<script>

  alert("Registration successful");

</script>
		<meta http-equiv="Refresh" content="0;url=allentries.jsp">
    
    <%
	 }        
	    else{
	        out.println("Registration failed");
	        response.sendRedirect("allentries.jsp");
	    }
 }
catch(Exception e){
    out.println(e);
 	}

}else{
    	
	
	
	
%>



    <!-- Main content -->
    
    <main id="main">
    <section class="content">
      <div class="container-fluid" style="padding-left: 3%;">
        <div class="row">
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Trainer Details</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form>
                <div class="card-body">
                  <div class="form-group">
                    <label for="name">Trainer Name</label>
                    <div class="input-group">
					 <div class="input-group-append">
                      <span class="input-group-text"><i class="fas fa-user-alt"></i></span>
                     </div>                     
                      <input type="text" class="form-control" name="tname" placeholder="Name" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">E-mail Address</label>
                    <div class="input-group">
					 <div class="input-group-append">
                      <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                     </div>
                      <input type="email" name="tmail" class="form-control" id="emailent" placeholder="Enter email" required>
                    </div>
                  </div>  
                
                  <br>
                    
                  <hr>
                      							                  	              
		                  <div class="card-body">
		                  
		                  
		                  <div class="form-group row">
			                    <h4 class="col-sm-4">DAYS (in a month)</h4>
			                    <div class="col-sm-8">
			                      <input type="text" name="days" placeholder="Enter ..." required>                       
			                    </div>
			                  </div> 
			                  
			                  <hr>
		                  
		                  
		                  <h4>CLASS TYPE</h4>
		                  	
		                  <br>
		                  	<div class="form-group row" align="center">
		                  		
		                  		<div class="col-sm-4">
			                      <div class="form-group">
			                        <h5>Demo Class</h5>                       
			                      </div>
			                    </div>			                                       
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <h5>Count</h5>
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                      	<h5>Amount Per Count</h5>			                                          
			                      </div>
			                    </div>              
			                  </div>
		                  		                 
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">Day (8 AM to 6 PM IST)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="demo_d_cnt" placeholder="Enter ..." required>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="demo_d_amt" placeholder="Enter ..." required>                       
			                      </div>
			                    </div>              
			                  </div>
			                  
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">Night (6 PM to 8 AM IST)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="demo_n_cnt" placeholder="Enter ..." required>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="demo_n_amt" placeholder="Enter ..." required>                       
			                      </div>
			                    </div>              
			                  </div>
			                  
			                  <hr>
			                  
			                  <div class="form-group row" align="center">
		                  		
		                  		<div class="col-sm-4">
			                      <div class="form-group">
			                        <h5>Paid Class</h5>                       
			                      </div>
			                    </div>			                                       
			                                 
			                  </div>
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">Day (8 AM to 6 PM IST)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="paid_d_cnt" placeholder="Enter ..." required>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="paid_d_amt" placeholder="Enter ..." required>                       
			                      </div>
			                    </div>              
			                  </div>			                 
			                  
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">Night (6 PM to 8 AM IST)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="paid_n_cnt" placeholder="Enter ..." required>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="paid_n_amt" placeholder="Enter ..." required>                       
			                      </div>
			                    </div>              
			                  </div>
							
							<hr>	
								
			                  <h4>COURSES</h4>
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">I - Level 1 (20 hours)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="ccnto" placeholder="Enter ..." required>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="co_amt" placeholder="Enter ..." required>                       
			                      </div>
			                    </div>              
			                  </div>
			                  
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">I - Level 2 (30 hours)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="ct_cnt" placeholder="Enter ..." required>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="ct_amt" placeholder="Enter ..." required>                       
			                      </div>
			                    </div>              
			                  </div>
			                          
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">II - Level 1 (20 hours)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="cr_cnt" placeholder="Enter ..." required>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="cr_amt" placeholder="Enter ..." required>                       
			                      </div>
			                    </div>              
			                  </div>
			                
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">II - Level 2 (30 hours)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="cf_cnt" placeholder="Enter ..." required>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <input type="text" class="form-control" name="cf_amt" placeholder="Enter ..." required>                       
			                      </div>
			                    </div>              
			                  </div>
			      
			      
			      <input type="hidden" class="form-control" name="submit" value='1'>
                  <button type="submit" class="btn btn-primary" style=" border-radius: 0;
					  padding: 10px 20px;border: 0;border-radius: 50px;margin-left: 43%;width:160px;margin-top: 25px;">SUBMIT
				  </button>  
			       
                   
       
                </div>
                
                
                
                
                   
                </div>               
              </form>
            </div>
          </div>         
       </div>    
      </div>
   </section>
  </main>



	
	<jsp:include page="footer.jsp" />





<%
    }

%>   




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