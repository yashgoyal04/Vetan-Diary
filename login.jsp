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
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<jsp:include page="bootstrapfiles.jsp" />

</head>
<style>
<jsp:include page="style.css" />  
</style>

<body> 
		
<%

String admin_log=request.getParameter("ad_log"); 
String trai_log=request.getParameter("tr_log");
//out.print("Hello User: You have entered the name: "+pi_id);  
//out.write("alert('doc+" + d_id + "')");

if(admin_log!=null){

	
	String temail=request.getParameter("admail");
	String tpwd=request.getParameter("adpwd");

	try
    {                 	
    	Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_code","root", "");     	
        PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) from tb_admin where email='"+temail+"' and password='"+tpwd+"'");                  
        ResultSet rs = ps.executeQuery();
        rs.next();
    	String Countrow = rs.getString(1);
    	if(Countrow.equals("0")){
    		
    		try{
				Class.forName("com.mysql.jdbc.Driver");
		        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_code","root", "");     	
		        PreparedStatement ps1 = conn.prepareStatement("insert into tb_admin(email,password)values(?,?)",Statement.RETURN_GENERATED_KEYS);
		        ps1.setString(1,temail);	  
			 	ps1.setString(2,tpwd);			
			 	int x = ps1.executeUpdate();
				 	if(x > 0){
					       
				 		Statement statt = conn1.createStatement(); 
				 		String data = "select * from tb_admin where email='"+temail+"' and password = '"+tpwd+"'";
					    ResultSet rst = statt.executeQuery(data);
						    while(rst.next()){
								   
								String a_id= rst.getString("ad_id");
					    	 	session = request.getSession(); 		//Creating Session...
					            session.setAttribute("ad_id", a_id);
					            response.sendRedirect("allentries.jsp");
					            session = request.getSession(false);
					            
					        }
					    
					}else{
				        out.println("Registration failed");
				        //response.sendRedirect("login.jsp");
				    	}
				}
			catch(Exception e){
			    out.println(e);
				}
			 	
    	}else{	
    		

    		try
    		{
    		 
    			Class.forName("com.mysql.jdbc.Driver");
	            Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_code","root", "");     	
	            PreparedStatement ps2 = conn.prepareStatement("Select * from tb_admin where email=? and password=?");
	            
	            ps2.setString(1,temail);
	            ps2.setString(2,tpwd);          
	            ResultSet rs2 = ps2.executeQuery();
	            
	    		    if(rs2.next()){
	    		    	String a_id= rs2.getString("ad_id");
		            	
		                session = request.getSession(); 		//Creating Session...
		                session.setAttribute("ad_id", a_id);
		                response.sendRedirect("allentries.jsp");
		                session = request.getSession(false);
		            }
		            else
		            {
		                out.println("Invalid number or Password!!! Please ");
		                out.println(" Try Again");
		                //response.sendRedirect("login.jsp");
		                
		            }
    		 }
	        catch(SQLException e)
	        {
	            System.out.println(e);
	        }
    	}
	}
	catch (Exception e){
	e.printStackTrace();
	}	    
	
	
	}else if(trai_log!=null){
	
	String name=request.getParameter("tname");
	String tmail=request.getParameter("tremail");

	 if(name != null || !name.isEmpty() || tmail != null || !tmail.isEmpty())  {
	        try
	        {                 	
	        	Class.forName("com.mysql.jdbc.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_code","root", "");     	
	            PreparedStatement ps = conn.prepareStatement("Select * from tb_data where tname=? and temail=?");	            
	            ps.setString(1,name);
	            ps.setString(2,tmail);          
	            ResultSet rs = ps.executeQuery();	            
	            if(rs.next())
	            {
	            	String t_id= rs.getString("user_id");	            	
	                session = request.getSession(); 		//Creating Session...
	                session.setAttribute("tr_id", t_id);
	                response.sendRedirect("trainer.jsp");
	                session = request.getSession(false);
	            }
	            else
	            {
	                out.println("Invalid number or Password!!! Please ");
	                out.println(" Try Again");
	                response.sendRedirect("trainer.jsp");	                
	            }
	            
	        }
	        catch(SQLException e)
	        {
	            System.out.println(e);
	        }
	       
	  

	 }
	
	
}else{	%>	
		<main id="main">
			<section class="h-100 gradient-form" style="background-color: #eee;">
			  <div class="container py-5 h-100">
			    <div class="row d-flex justify-content-center align-items-center h-100">
			      <div class="col-xl-10">
			        <div class="card rounded-3 text-black">
			          <div class="row g-0">
			          
			            <div class="col-lg-6">
			              <div class="card-body p-md-5 mx-md-4">
			
			                <div class="text-center">
			                  <img src="admin.jpg" style="width: 185px;" alt="logo">
			                  <h4 class="mt-1 mb-5 pb-1">Admin</h4>
			                </div>
			
			                <form action="login.jsp" method="post"  >
			                  <p align="center">Log in as Admin</p>
			
			                  <div class="form-outline mb-4">
			                    <label class="form-label" for="emaila">E-mail</label>
			                    <input type="email" name="admail" class="form-control" placeholder="E-mail address" required/>			                    
			                  </div>
			
			                  <div class="form-outline mb-4">
								<label class="form-label" for="pwda">Password</label>
			                    <input type="password" name="adpwd" placeholder="Password" class="form-control" required/>
			                    <input type="hidden" name="ad_log" class="form-control" value="1"/>
			                  </div>
			
			                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Log in</button>
			             
			 
			            <!--  <div class="d-flex align-items-center justify-content-center pb-4">
			                    <p class="mb-0 me-2">Don't have an account?</p>
			                    <button type="button" class="btn btn-outline-danger">Create new</button>
			                  </div>	   -->
			
			                </form>
			
			              </div>
			            </div>
			            
			            <div class="col-lg-6">
			              <div class="card-body p-md-5 mx-md-4">
			
			                <div class="text-center">
			                  <img src="trainer.jpg" style="width: 185px;" alt="logo">
			                  <h4 class="mt-1 mb-5 pb-1">Trainer</h4>
			                </div>
			
			                 <form action="login.jsp" method="post">
			                  <p align="center">Log in as Trainer</p>
			
			                  <div class="form-outline mb-4">
			                    <label class="form-label" for="trainame">Name</label>
			                    <input type="text" name="tname" class="form-control" placeholder="Name" required/>			                    
			                  </div>
			
			                  <div class="form-outline mb-4">
			                    <label class="form-label" for="emailt">E-mail</label>
			                  	<input type="email" name="tremail" class="form-control" placeholder="E-mail address" required/>			                                        
			                    <input type="hidden" name="tr_log" class="form-control" value="1"/>                    
			                  </div>
			                  
			                  
			                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Log in</button>
			                  		                 
			                </form>
			
			              </div>
			            </div>
			            
			            <!-- 
			            <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
			              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
			                <h4 class="mb-4">We are more than just a company</h4>
			                <p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			              </div>
			            </div>
			            -->
			            
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</section>
		</main>
			
	<%
		}
	%>		
	
	<jsp:include page="footer.jsp" />

 
	</body>
 </html>