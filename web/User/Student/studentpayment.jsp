<%@include file="header.jsp" %>
<%@page import="java.sql.*" %>
<%
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
    String uid= (String)session.getAttribute("uid"); 
    session.setAttribute("uid",uid);
    String query="select * from student where email='"+uid+"'";
    Statement st=con.createStatement();
    rs=st.executeQuery(query);
    int cf=0,pf,rem;
    if(rs.next())
    {
        
        session.setAttribute("id",rs.getString("id"));
        session.setAttribute("fee",rs.getString("fee"));
        cf=Integer.parseInt(rs.getString("fee"));
    }
    
    String id= (String)session.getAttribute("id");
    query="select * from fee where id='"+id+"'";
    rs=st.executeQuery(query);
    pf=0;
    while(rs.next())
     {
       pf+=Integer.parseInt(rs.getString("pfee"));
     }
     rem=cf-pf;
     session.setAttribute("cf",cf+"");
     session.setAttribute("pf",pf+"");
     session.setAttribute("rem",rem+"");
    
%>
<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            

				<!-- Form grid Start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div align="center">
							<h4 class="text-blue h4">Payment History</h4>
							
						</div>
						
					</div><br/>
					
                                              <form action="" method="post" onsubmit="return validate();" enctype="multipart/form-data" name="form" >
						
					<div class="row">
							<div class="col-md-4 col-sm-12">
								<div class="form-group">
									<label>Course Fee</label>
									<input type="text" class="form-control" id="cfee"  name="cfee"  value="<%=(String)session.getAttribute("cf")%>" readonly>
                                                                        
								</div>
							</div>
							<div class="col-md-4 col-sm-12">
								<div class="form-group">
									<label>Paid Fee</label>
									<input type="number"  class="form-control" id="pfee"  name="pfee"  value="<%=(String)session.getAttribute("pf")%>" readonly>
                                                                        <div id="pf" class="error"></div>
								</div>
							</div>
                                                        <div class="col-md-4 col-sm-12">
								<div class="form-group">
									<label>Balance Fee</label>
									<input type="number"  class="form-control" id="bal"  name="bal"  value="<%=(String)session.getAttribute("rem")%>" readonly>
                                                                        <div id="pf" class="error"></div>
								</div>
							</div>
						</div> 		
	   
                                
            	
                    <div class="pd-20 card-box mb-30">
					
					<table class="table">
						<thead>
							<tr>
								<th scope="col">id</th>
								<th scope="col">Payment Mode</th>
								<th scope="col">Bank Name</th>
								<th scope="col">Paid fee</th>
								<th scope="col">Recipte Id</th>
                                                                <th scope="col">Date Of Payment</th>
                                                                
							</tr>
						</thead>
						<tbody>
                                      <% 
                                           
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
                                         query="select * from fee where id='"+(String)session.getAttribute("id")+"'";
                                        
                                        rs=st.executeQuery(query);
                                        int i=0;
                                        while(rs.next())
                                        {
                                         
                                          id =rs.getString("id");
                                    
                                        %>
							<tr>
								<th scope="row"><%=rs.getString("id")%></th>
								<td><%=rs.getString("pmode")%></td>
								<td><%=rs.getString("bname")%></td>
								<td><%=rs.getString("pfee")%></td>
								<td><%=rs.getString("rid")%></td>
                                                                <td><%=rs.getString("dof")%></td>
							</tr>
							<% } %>
						</tbody>
					</table>
					
				</div>
                                        
			<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<a href="studentdisplay.jsp"
							class="btn btn-warning"> Back </a>
						
					</div>
				</div>
			</div>
				
					<div class="collapse collapse-box" id="form-grid-form" >
						<div class="code-box">
							<div class="clearfix">
								<a href="javascript:;" class="btn btn-primary btn-sm code-copy pull-left"  data-clipboard-target="#form-grid"><i class="fa fa-clipboard"></i> Copy Code</a>
								<a href="#form-grid-form" class="btn btn-primary btn-sm pull-right" rel="content-y"  data-toggle="collapse" role="button"><i class="fa fa-eye-slash"></i> Hide Code</a>
							</div>
							<pre><code class="xml copy-pre" id="form-grid">

							</code></pre>
						</div>
					</div>
				</div>
				<!-- Form grid End -->
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>