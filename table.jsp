<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.text.DateFormat" %>  
    
    
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.sql.*"%>



<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "appointm_doc";
String userid = "appointm_root";
String password = "web@yash1234$$";
String user_id=request.getParameter("user_id");

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;

%>   
 



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<jsp:include page="bootstrapfiles.jsp" />

<title>Insert title here</title>



<style>
.dtHorizontalVerticalExampleWrapper {
max-width: 600px;
margin: 0 auto;
}
#dtHorizontalVerticalExample th, td {
white-space: nowrap;
}
table.dataTable thead .sorting:after,
table.dataTable thead .sorting:before,
table.dataTable thead .sorting_asc:after,
table.dataTable thead .sorting_asc:before,
table.dataTable thead .sorting_asc_disabled:after,
table.dataTable thead .sorting_asc_disabled:before,
table.dataTable thead .sorting_desc:after,
table.dataTable thead .sorting_desc:before,
table.dataTable thead .sorting_desc_disabled:after,
table.dataTable thead .sorting_desc_disabled:before {
bottom: .5em;
}



</style>

</head>
<body>






<main id="main">

<div class="container col-8 ">
  <div class="row py-5">  
    <div class="col-12">  



<table id="dtHorizontalVerticalExample" class="table table-striped table-bordered table-sm " cellspacing="0"
  width="100%">
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
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Name</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Email</th>				           
			            <th colspan="4" style="horizontal-align : middle;text-align:center; width: 50%;">Demo</th>
			            <th colspan="4" style="horizontal-align : middle;text-align:center; width: 50%;">Paid</th>
			            <th colspan="8" style="horizontal-align : middle;text-align:center; width: 50%;">Courses</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Days in Month</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Total Income</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Change</th>				           
			            
			        </tr>
			        <tr>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Dayd</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Nightd</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Dayp</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Nightp</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">I Lv.1</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">I Lv.3</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">II Lv.1</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">II Lv.2</th>
			              
			        </tr>   
			            
			        <tr>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Countd</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amountd</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Countd</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amountd</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Countp</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amountp</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Countp</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amountp</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count1</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount1</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count3</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount3</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count2</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount2</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count4</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount4</th>
			            
			        </tr>
                 </thead><%}}
					

}
catch(Exception e)
{
out.println("wrong entry"+e);
}
%> 
  <tbody>
    <tr>
      <td>Tiger</td>
      <td>Nixon</td>
      <td>System Architect</td>
      <td>Edinburgh</td>
      <td>61</td>
      <td>2011/04/25</td>
      <td>$320,800</td>
      <td>5421</td>
      <td>t.nixon@datatables.net</td>
    </tr>
    <tr>
      <td>Garrett</td>
      <td>Winters</td>
      <td>Accountant</td>
      <td>Tokyo</td>
      <td>63</td>
      <td>2011/07/25</td>
      <td>$170,750</td>
      <td>8422</td>
      <td>g.winters@datatables.net</td>
    </tr>
    <tr>
      <td>Ashton</td>
      <td>Cox</td>
      <td>Junior Technical Author</td>
      <td>San Francisco</td>
      <td>66</td>
      <td>2009/01/12</td>
      <td>$86,000</td>
      <td>1562</td>
      <td>a.cox@datatables.net</td>
    </tr>
    <tr>
      <td>Cedric</td>
      <td>Kelly</td>
      <td>Senior Javascript Developer</td>
      <td>Edinburgh</td>
      <td>22</td>
      <td>2012/03/29</td>
      <td>$433,060</td>
      <td>6224</td>
      <td>c.kelly@datatables.net</td>
    </tr>
    <tr>
      <td>Airi</td>
      <td>Satou</td>
      <td>Accountant</td>
      <td>Tokyo</td>
      <td>33</td>
      <td>2008/11/28</td>
      <td>$162,700</td>
      <td>5407</td>
      <td>a.satou@datatables.net</td>
    </tr>
    <tr>
      <td>Brielle</td>
      <td>Williamson</td>
      <td>Integration Specialist</td>
      <td>New York</td>
      <td>61</td>
      <td>2012/12/02</td>
      <td>$372,000</td>
      <td>4804</td>
      <td>b.williamson@datatables.net</td>
    </tr>
  </tbody>
</table>



</div></div></div>




































<table id="dtHorizontalExample" class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
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
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Name</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Email</th>				           
			            <th colspan="4" style="horizontal-align : middle;text-align:center; width: 50%;">Demo</th>
			            <th colspan="4" style="horizontal-align : middle;text-align:center; width: 50%;">Paid</th>
			            <th colspan="8" style="horizontal-align : middle;text-align:center; width: 50%;">Courses</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Days in Month</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Total Income</th>
			            <th rowspan="3" style="vertical-align : middle;text-align:center;">Change</th>				           
			            
			        </tr>
			        <tr>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Dayd</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Nightd</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Dayp</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">Nightp</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">I Lv.1</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">I Lv.3</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">II Lv.1</th>
			            <th colspan="2" style="horizontal-align : middle;text-align:center; width: 20%;">II Lv.2</th>
			              
			        </tr>   
			            
			        <tr>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Countd</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amountd</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Countd</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amountd</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Countp</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amountp</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Countp</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amountp</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count1</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount1</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count3</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount3</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count2</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount2</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Count4</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount4</th>
			            <th style="horizontal-align : middle;text-align:center; width: 20%;">Amount4</th>
			            
			            
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
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"> <%=resultSet.getString("tname") %></td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("temail") %> </td>
			             <td style="horizontal-align : middle;text-align:center; width: 20%;"> <%=resultSet.getString("demo_d_cnt") %></td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("demo_d_amt") %> </td>
			             <td style="horizontal-align : middle;text-align:center; width: 20%;"> <%=resultSet.getString("demo_n_cnt") %></td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("demo_n_amt") %> </td>
			             <td style="horizontal-align : middle;text-align:center; width: 20%;"> <%=resultSet.getString("paid_d_cnt") %></td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("paid_d_amt") %> </td>
			             <td style="horizontal-align : middle;text-align:center; width: 20%;"> <%=resultSet.getString("paid_n_cnt") %></td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("paid_n_amt") %> </td>
			             <td style="horizontal-align : middle;text-align:center; width: 20%;"> <%=resultSet.getString("ccnto") %></td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("co_amt") %> </td>
			             <td style="horizontal-align : middle;text-align:center; width: 20%;"> <%=resultSet.getString("ct_cnt") %></td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("ct_amt") %> </td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"> <%=resultSet.getString("cr_cnt") %></td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("cr_amt") %> </td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("cf_cnt") %> </td>
			            
			            
			            
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"> <%=resultSet.getString("cf_amt") %></td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("days") %> </td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;"><%=resultSet.getString("gross_tot") %> </td>
			            <td style="horizontal-align : middle;text-align:center; width: 20%;">Edit </td>
			            
			            
			        </tr>
		 	   
		 	   
		 	   
				<%}%>
										
					
                 <%
 
                }
				catch(Exception e)
				{
					out.println("wrong entry"+e);
				}
				%> 
                </tbody>  
      </table>
















</body>
</html>