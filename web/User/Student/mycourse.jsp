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
    if(rs.next())
    {
        String ccode=rs.getString("ccode");
        session.setAttribute("ccode",rs.getString("ccode"));
        session.setAttribute("fee",rs.getString("fee"));
        
        query="select * from course where ccode='"+ccode+"'";
        
        rs=st.executeQuery(query);
        if(rs.next())
         {
           
           session.setAttribute("cname",rs.getString("cname"));
           session.setAttribute("duration",rs.getString("duration"));
           session.setAttribute("module",rs.getString("module"));
           session.setAttribute("career",rs.getString("career"));
          
         }
        
      
    }
    

  
 %>
<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="title">
                                    <h4>My Course</h4>
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
							<h4 class="text-blue h4">My Course Details</h4>
							
						</div>
						
					</div><br/>
					
                                              <form action="" method="post"  enctype="multipart/form-data" name="form" >
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Course Code</label>
									<input type="text" class="form-control" id="ccode"  name="ccode" placeholder="Enter Course Code"  value="<%=(String)session.getAttribute("ccode")%>" readonly >
                                                                        <div id="c" class="error"></div>
								</div>
							</div>
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Course Name</label>
									<input type="text" class="form-control" id="cname"  name="cname" placeholder="Enter Course Name"  value="<%=(String)session.getAttribute("cname")%>" readonly>
                                                                        <div id="cn" class="error"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Duration</label>
									<input type="text" class="form-control" id="duration"  name="duration" placeholder="Enter Duration"  value="<%=(String)session.getAttribute("duration")%>" readonly>
                                                                        <div id="d" class="error"></div>
								</div>
							</div>
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>fee</label>
									<input type="number"  class="form-control" id="fee"  name="fee" placeholder="Enter Fee"  value="<%=(String)session.getAttribute("cf")%>" readonly>
                                                                        
								</div>
							</div>
                                                     </div>
                                                <div class="row">
                                                        <div class="col-md-12 col-sm-12">
                                                                <div class="form-group">
                                                                        <label>Module</label>
                                                                        <input type="text" class="form-control" id="module"  name="module" placeholder="Enter Module"  value="<%=(String)session.getAttribute("module")%>" readonly>
                                                                        <div id="m" class="error"></div>
                                                                </div>
                                                        </div>
                                                </div>
	                                        <div class="row">
                                                    <div class="col-md-12 col-sm-12">
                                                            <div class="form-group">
                                                                    <label>Career</label>
                                                                    <input type="text" class="form-control" id="career"  name="career"   value="<%=(String)session.getAttribute("career")%>" readonly>
                                                                    
                                                            </div>
                                                    </div>
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
