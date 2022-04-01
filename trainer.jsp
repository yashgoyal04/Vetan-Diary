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
    <title>Trainer</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
    <jsp:include page="bootstrapfiles.jsp" />

</head>
<style>
 <jsp:include page="style.css" />
</style>

<body> 
    <!-- Main content -->
    
    <main id="main">
	    <section class="content">
	      <div class="container-fluid" style="padding-left: 16%;">
	        <div class="row">
	          <div class="col-md-10">
	            <div class="card card-primary">	              

	              <%	                 
	                String id=(String)session.getAttribute("tr_id"); 
	                int num = Integer.parseInt(id);  
	                
					try{
						Class.forName("com.mysql.jdbc.Driver");
			            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_code","root", "");     	
			            PreparedStatement ps = conn.prepareStatement("select * from tb_data where user_id='"+num+"'");	            
			            ResultSet res = ps.executeQuery();	            
			            while(res.next())
					    {
					    	
					%>	              
	                <div class="card-body">	                  
		            	<div class="card-header">
		                	<div class="row">
			                  	<span class="input-group-text"><i class="fas fa-user-alt"></i></span>
								    <div class="col">						       
								      <h3 class="card-title"><%= res.getString("tname") %></h3>  
								    </div>
								<span class="input-group-text"><i class="fas fa-envelope"></i></span>    
								    <div class="col">
								      <p class="text-muted mb-0"><%= res.getString("temail") %></p>
								    </div>
						 	</div>                   
			             </div>	         
		                        
	                 	<br>
	                  							                  	              
		                  <div class="card-body">
		                  
		                  
		                  <div class="form-group row">
			                    <h4 class="col-sm-4">DAYS (in a month)</h4>
			                    <div class="col-sm-8">
			                      <label><%= res.getString("days") %></label>                       
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
			                        <label align="center"><%= res.getString("demo_d_cnt") %></label>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <label><%= res.getString("demo_d_amt") %></label>                       
			                      </div>
			                    </div>              
			                  </div>
			                  
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">Night (6 PM to 8 AM IST)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <label><%= res.getString("demo_n_cnt") %> </label>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <label><%= res.getString("demo_n_amt") %></label>                       
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
			                        <label><%= res.getString("paid_d_cnt") %></label>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <label><%= res.getString("paid_d_amt") %></label>                       
			                      </div>
			                    </div>              
			                  </div>			                 
			                  
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">Night (6 PM to 8 AM IST)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <label><%= res.getString("paid_n_cnt") %></label>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <label><%= res.getString("paid_n_amt") %></label>                       
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
			                        <label><%= res.getString("ccnto") %></label>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <label><%= res.getString("co_amt") %></label>                       
			                      </div>
			                    </div>              
			                  </div>
			                  
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">I - Level 2 (30 hours)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <label><%= res.getString("ct_cnt") %></label>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <label><%= res.getString("ct_amt") %></label>                       
			                      </div>
			                    </div>              
			                  </div>
			                          
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">II - Level 1 (20 hours)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <label><%= res.getString("cr_cnt") %></label>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <label><%= res.getString("cr_amt") %></label>                       
			                      </div>
			                    </div>              
			                  </div>
			                
			                  <div class="form-group row" align="center">
			                    <label for="inputEmail3" class="col-sm-4 col-form-label">II - Level 2 (30 hours)</label>                    
			                    <div class="col-sm-4">
			                      <!-- text input -->
			                      <div class="form-group">
			                        <label><%= res.getString("cf_cnt") %></label>                        
			                      </div>
			                    </div>
			                    <div class="col-sm-4">
			                      <div class="form-group">
			                        <label><%= res.getString("cf_amt") %></label>                       
			                      </div>
			                    </div>              
			                  </div>
			                        
							<hr>	
								  			                  	
			                  
			                  <div class="form-group row">
			                    <h4 class="col-sm-4">NET EARNING (in Rs.)</h4>
			                    <div class="col-sm-8">
			                      <h4><%= res.getString("net_amt_pay") %></h4>			                                              
			                    </div>
			                  </div>        		             
		                	</div>	<!-- Card Body 2 -->	                  
	  				</div>	<!-- Card Body 1 -->
	  				
	  				<%
												
				       }     }
				        catch(Exception e)
				        {
				             out.println("wrong entry"+e);
				        }
					%>   			  	  				
	            </div>
	          </div>
	        </div>
	        <!-- /.row -->
	      </div><!-- /.container-fluid -->
	    </section>
	    <!-- /.content -->
    </main>



	
	<jsp:include page="footer.jsp" />


</body>
 </html>
