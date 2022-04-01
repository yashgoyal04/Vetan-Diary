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
    <title>Monthly income of trainers</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
   <jsp:include page="bootstrapfiles.jsp" />  

</head>

<body class="bg-light">



    
<%

if(request.getParameter("tname")==null){
	

%>
    <div class="container">
      <div class="py-5 text-center">
       
         <h2>Salary Statement</h2>
        
      </div>

        <div class="col-md-12 order-md-1">
          <h4 class="mb-3">Trainer Name</h4>
          
          <form action = "" method = "POST">
          
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="name">Name</label>
                <input type="text" class="form-control" name="tname" placeholder="Enter your name here" value="" required >                
              </div>
            </div>
			
			<h4 class="mb-3">Classes Type</h4>
			
			<h6 class="mb-3">Demo</h6>
            <div class="mb-3">             
              <div class="row">
              <div class="col-md-6 mb-3">
                 <label for="day">Day</label>
                <input type="text" class="form-control" name="dday" placeholder="105 per count" value="" required >                
              </div>
              <div class="col-md-6 mb-3">
                <label for="night">Night</label>
                <input type="text" class="form-control" name="dnight" placeholder="110 per count" value="" required >                
              </div>
            </div>
            </div>
            
            <h6 class="mb-3">Paid</h6>
            <div class="mb-3">             
              <div class="row">
              <div class="col-md-6 mb-3">
                 <label for="day2">Day</label>
                <input type="text" class="form-control" name="pday" placeholder="127 per count" value="" required >                
              </div>
              <div class="col-md-6 mb-3">
                <label for="night2">Night</label>
                <input type="text" class="form-control" name="pnight" placeholder="137 per count" value="" required >                
              </div>
            </div>
            </div>                                   
            
            <h4 class="mb-3">Conversions in a month</h4>
			
			<div class="mb-3">
              <label for="count">Enter count</label>
              <input type="text" class="form-control" name="stud" placeholder="no. of students" required>            
            </div>
            
             <h4 class="mb-3">Referrals</h4>
			
			<div class="mb-3">
              <label for="indian">Indian</label>
              <input type="text" class="form-control" name="ind" placeholder="150 per count" required>            
            </div>
            
            <div class="mb-3">
              <label for="intern">International</label>
              <input type="text" class="form-control" name="int" placeholder="1100 per count" required>            
            </div>
            
            <div class="mb-3">
              <label for="refer">Referral</label>
              <input type="text" class="form-control" name="ref" placeholder="130 per count" required>            
            </div>
            
            <h5 class="mb-3"> Up-selling - 12%</h5>
            
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Calculate</button>
          </form>
        </div>
      </div>

 <%}else{
	 %>  
	  <div class="container">
      <div class="py-5 text-center">
       
         <h2>Salary Statement</h2>
        
      </div>

        <div class="col-md-12 order-md-1">
          <h4 class="mb-3">Trainer Name</h4>
          
          <form action = "" method = "POST">
          
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="name">Name</label>
                <input type="text" class="form-control" name="tname" placeholder="Enter your name here" value="<%=request.getParameter("tname") %>" required >                
              </div>
            </div>
			
			<h4 class="mb-3">Classes Type</h4>
			
			<h6 class="mb-3">Demo</h6>
            <div class="mb-3">             
              <div class="row">
              <div class="col-md-6 mb-3">
                 <label for="day">Day</label>
                <input type="text" class="form-control" name="dday" placeholder="" value="<%=request.getParameter("dday") %>" required >                
              </div>
              <div class="col-md-6 mb-3">
                <label for="night">Night</label>
                <input type="text" class="form-control" name="dnight" placeholder="" value="<%=request.getParameter("dnight") %>" required >                
              </div>
            </div>
            </div>
            
            <h6 class="mb-3">Paid</h6>
            <div class="mb-3">             
              <div class="row">
              <div class="col-md-6 mb-3">
                 <label for="day2">Day</label>
                <input type="text" class="form-control" name="pday" placeholder="" value="<%=request.getParameter("pday") %>" required >                
              </div>
              <div class="col-md-6 mb-3">
                <label for="night2">Night</label>
                <input type="text" class="form-control" name="pnight" placeholder="" value="<%=request.getParameter("pnight") %>" required >                
              </div>
            </div>
            </div>                                   
            
            <h4 class="mb-3">Conversions in a month</h4>
			
			<div class="mb-3">
              <label for="count">Enter count</label>
              <input type="text" class="form-control" name="stud" placeholder="no. of students"  value="<%=request.getParameter("stud") %>" required>            
            </div>
            
             <h4 class="mb-3">Referrals</h4>
			
			<div class="mb-3">
              <label for="indian">Indian</label>
              <input type="text" class="form-control" name="ind" placeholder="150 per count"  value="<%=request.getParameter("ind") %>" required>            
            </div>
            
            <div class="mb-3">
              <label for="intern">International</label>
              <input type="text" class="form-control" name="int" placeholder="1100 per count"  value="<%=request.getParameter("int") %>" required>            
            </div>
            
            <div class="mb-3">
              <label for="refer">Referral</label>
              <input type="text" class="form-control" name="ref" placeholder="130 per count"  value="<%=request.getParameter("ref") %>" required>            
            </div>
            
            <h5 class="mb-3"> Up-selling - 12%</h5>
            
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Calculate</button>
          </form>
        </div>
      </div>
<%        
 }
    


if(request.getParameter("tname")!=null){
	
	
//	System.out.print("tname");
	
String name=request.getParameter("tname");
int deday = Integer.parseInt(request.getParameter("dday"));
int denight = Integer.parseInt(request.getParameter("dnight"));
int paday = Integer.parseInt(request.getParameter("pday"));
int panight = Integer.parseInt(request.getParameter("pnight"));
int student = Integer.parseInt(request.getParameter("stud"));
int refind = Integer.parseInt(request.getParameter("ind"));
int refint = Integer.parseInt(request.getParameter("int"));           
int refe = Integer.parseInt(request.getParameter("ref"));

int d_damt= 105 * deday;
int d_namt= 110 * denight;
int p_damt= 127 * paday;
int p_namt= 137 * panight;

int con_of= 0;
int con_st= 0;
int con_el= 0;

if(student >= 1 && student <= 5){
	
	con_of= student;
	
	}
else if(student >= 6 && student <= 10){
	
	
	con_st= student;
	
	}
else{
	
	con_el= student;
	}

int con_of_amt= 125 * con_of;
int con_st_amt= 150 * con_st; 
//out.write("alert('Hello+" + con_of_amt + "')");
int con_el_amt= 1100 * con_el;


int ind= 150 * refind;
int inter= 1100 * refint;
int ref= 130 * refe;

int gross_tot= d_damt+ d_namt+ p_damt+ p_namt+ con_of_amt+ con_st_amt+ con_el_amt+ ind+ inter+ ref;
int net_pay= gross_tot+ (gross_tot*12/100);




%>
<br/><br/><br/>
<div class="card container h-100 d-flex justify-content-center" style="width: 28rem;">
  <div class="card-body">
    <h5 class="card-title">Total monthly salary of trainer <%=name %> is <%=net_pay %></h5>
    <p class="card-text"></p>
  </div>
</div>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_code","root", "");     	
    PreparedStatement ps = conn.prepareStatement("insert into tb_(name,demo_d_cnt,demo_d_amt_tot,demo_n_cnt,demo_n_amt_tot,paid_d_cnt,paid_d_amt_tot,paid_n_cnt,paid_n_amt_tot,con_of_cnt,con_of_amt_tot,con_st_cnt,con_st_amt_tot,con_el_cnt,con_el_amt_tot,ind_cnt,ind_amt_tot,int_cnt,int_amt_tot,ref_cnt,ref_amt_tot,gross_tot,net_amt_pay)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);",Statement.RETURN_GENERATED_KEYS);
    ps.setString(1,name);
    ps.setInt(2,deday);
    ps.setInt(3,d_damt);
    ps.setInt(4,denight);
    ps.setInt(5,d_namt);
    ps.setInt(6,paday);
    ps.setInt(7,p_damt);
    ps.setInt(8,panight);
    ps.setInt(9,p_namt);
    ps.setInt(10,con_of);
    ps.setInt(11,con_of_amt);
    ps.setInt(12,con_st);
    ps.setInt(13,con_st_amt);
    ps.setInt(14,con_el);
    ps.setInt(15,con_el_amt);
    ps.setInt(16,refind);
    ps.setInt(17,ind);
    ps.setInt(18,refint);
    ps.setInt(19,inter);
    ps.setInt(20,refe);
    ps.setInt(21,ref);
    ps.setInt(22,gross_tot);
    ps.setInt(23,net_pay);
    	
   	int x = ps.executeUpdate();

	}
	catch(Exception e){
	   out.println(e);
	}

}else{
    	
    }

%>    


  <footer class="my-5 pt-5 text-muted text-center text-small">
		
      </footer>
  

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
    
        

  </body>
 </html>