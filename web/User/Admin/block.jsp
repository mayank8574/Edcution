<%@page import="java.sql.*" %>
<%
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
    String id=request.getParameter("id");
    session.setAttribute("id",id);
    String State=" ";
   
    String query="select * from student where id='"+id+"'";
    Statement st=con.createStatement();
    rs=st.executeQuery(query);
    if(rs.next())
    {
        String ccode=rs.getString("ccode");
       
        session.setAttribute("name",rs.getString("name"));
        session.setAttribute("fname",rs.getString("fname"));
        session.setAttribute("adhar",rs.getString("adhar"));
        query="select * from login where id='"+id+"'";
        
        rs=st.executeQuery(query);
        if(rs.next())
         {
           
          session.setAttribute("status",rs.getString("status"));
          State=rs.getString("status");
          session.setAttribute("temp",rs.getString("status"));
         }
    }
    
       
  
 %>

<%@include file="header.jsp" %>
<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="title">
                                    <h4>Block Unblock Form</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                    
                            </nav>
                    </div>
                    <div class="col-md-6 col-sm-12 text-right">
                            <div class="dropdown">
                                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                            August 2024
                                    </a>
                                    
                            </div>
                    </div>
                </div>
            </div>
            <!-- horizontal Basic Forms End -->

				<!-- Form grid Start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div align="center">
							<h4 class="text-blue h4"> Student Block Unblock Form</h4><br/>
                                                        <img src="../Profile/<%=(String)session.getAttribute("profile")%>" alt="alt" class="circle1"/></h1><br/>
							
						</div>
						
					</div><br/>
					
                                              <form action="../../block" method="post" onsubmit="return validate();" enctype="multipart/form-data" name="form" >
						
						
			   
                                <div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Name</label>
									<input type="text" class="form-control" id="name"  name="name" placeholder="Enter Name" value="<%=(String)session.getAttribute("name")%>" readonly>
                                                                        <div id="n" class="error"></div>
								</div>
							</div>
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Adhar Number</label>
									<input type="number"  class="form-control" id="adhar"  name="adhar" placeholder="Enter Adhar Number" value="<%=(String)session.getAttribute("adhar")%>" readonly>
                                                                        <div id="ad" class="error"></div>
								</div>
							</div>
						</div>
	   <div class="row">
                <div class="col-md-6 col-sm-12">
                         <div class="form-group">
                                 <label>Father Name</label>
                                 <input type="text" class="form-control" id="fname"  name="fname" placeholder="Enter Father Name" value="<%=(String)session.getAttribute("fname")%>" readonly>
                                 <div id="f" class="error"></div>
                         </div>
                 </div>
                 
                                 
        </div>
                
        
            	
                                        
			<div class="row mt-4">
				<div class="col">
					<div class="form-group">
                                             <%
                                               if(State.equals("A")) 
                                               {
                                               %>
                                               <button type="submit" class="btn btn-danger">Block</button>
                                               <%
                                                }
                                                else
                                                {%>
                                                <button type="submit" class="btn btn-primary">Unblock</button>
                                                 <%}
                                              %>
						
                                                
						<a href="studentdisplay.jsp"
							class="btn btn-warning"> Back </a>
					</div>
				</div>
			</div>
				</form>
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
