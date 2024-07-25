<%@include file="header.jsp" %>
<%@page import="java.sql.*" %>
<%
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
    //String uid=request.getParameter("uid");
    String uid= (String)session.getAttribute("uid"); 
    session.setAttribute("uid",uid);
    
   
    String query="select * from student where email='"+uid+"'";
    Statement st=con.createStatement();
    rs=st.executeQuery(query);
    if(rs.next())
    {
        String ccode=rs.getString("ccode");
       
        session.setAttribute("name",rs.getString("name"));
        session.setAttribute("fname",rs.getString("fname"));
        session.setAttribute("email",rs.getString("email"));
        session.setAttribute("gender",rs.getString("gender"));
        session.setAttribute("contact",rs.getString("contact"));
        session.setAttribute("module",rs.getString("module"));
        session.setAttribute("ccode",rs.getString("ccode"));
        session.setAttribute("fee",rs.getString("fee"));
        session.setAttribute("adhar",rs.getString("adhar"));
        session.setAttribute("address",rs.getString("address"));
        session.setAttribute("doa",rs.getString("doa"));
        session.setAttribute("dob",rs.getString("dob"));
        
        
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
                                    <h4>My Profile</h4>
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
                                                    <h3>My Profile</h3>
							<img src="../Profile/<%=(String)session.getAttribute("uprofile")%>" alt="alt" class="circle1"/></h1><br/>
						</div>
						
					</div><br/>
					
                                              <form action="" method="post"  enctype="multipart/form-data" name="form" >
						
						
	
	   
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
                 <div class="col">
                             <div class="form-group">
                                 <label for="designation">Gender</label><br>
                                  <input type="text" class="form-control"id="gender" name="gender"  value="<%=(String)session.getAttribute("gender")%>" readonly />
                                     <div id="g" class="error"></div>
                             </div>
                 </div>
                                 
        </div>
        <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" class="form-control" id="email"  name="email" placeholder="Enter Email ID" value="<%=(String)session.getAttribute("email")%>" readonly >
                                    <div id="e" class="error"></div>
                            </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label>Contact</label>
                                    <input type="text" class="form-control" id="contact"  name="contact" placeholder="Enter Contact" value="<%=(String)session.getAttribute("contact")%>" readonly>
                                    <div id="co" class="error"></div>
                            </div>
                    </div>
        </div>
        <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label>Date Of Birth</label>
                                    <input type="date" class="form-control" id="dob"  name="dob" placeholder="Enter Date Of Birth" value="<%=(String)session.getAttribute("dob")%>" readonly>
                                    <div id="db" class="error"></div>
                            </div>
                    </div>
                   <div class="col-md-6 col-sm-12">
								<div class="form-group">
                                                         <label>Date Of Addmission</label>
                                                           <input type="text" class="form-control" id="doa"  name="doa" placeholder="Enter Addmission Date"  value="<%=(String)session.getAttribute("doa")%>" readonly >

                                                          </div>
							</div>
        </div>
            <div class="row">
		<div class="col-md-12 col-sm-12">
			<div class="form-group">
				<label>Address</label>
				<input type="text" class="form-control" id="addess"  name="address" placeholder="Enter Address "  value="<%=(String)session.getAttribute("address")%>" readonly>
                                <div id="a" class="error"></div>
			</div>
		</div>
	</div>
        
            				<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<a href="index.jsp"
							class="btn btn-warning"> Back </a>
						
					</div>
				</div>
			</div>				</form>
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