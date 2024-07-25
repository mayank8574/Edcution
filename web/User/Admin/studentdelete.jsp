<%@page import="java.sql.*" %>
<%
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
    String id=request.getParameter("id");
    session.setAttribute("id",id);
    
   
    String query="select * from student where id='"+id+"'";
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
        query="select * from course where ccode='"+ccode+"'";
        
        rs=st.executeQuery(query);
        if(rs.next())
         {
           session.setAttribute("cname",rs.getString("cname"));
           session.setAttribute("duration",rs.getString("duration"));
            session.setAttribute("cfee",rs.getString("fee"));
         }
        query="select * from fee where id='"+id+"'";
        rs=st.executeQuery(query);
        if(rs.next())
         {
           session.setAttribute("pmode",rs.getString("pmode"));
           session.setAttribute("bname",rs.getString("bname"));
           session.setAttribute("pfee",rs.getString("pfee"));
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
                                   <h4> Student Delete Form</h4>
                            </div>
                            
                    </div>
                    <div class="col-md-6 col-sm-12 text-right">
                            <div class="dropdown">
                                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                            January 2018
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#">Export List</a>
                                            <a class="dropdown-item" href="#">Policies</a>
                                            <a class="dropdown-item" href="#">View Assets</a>
                                    </div>
                            </div>
                    </div>
                </div>
            </div>
            <!-- horizontal Basic Forms End -->

				<!-- Form grid Start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div align="center">
							
							<img src="../Profile/<%=(String)session.getAttribute("profile")%>" alt="alt" class="circle1"/></h1><br/>
						</div>
						
					</div><br/>
					
                                              <form action="../../bb" method="post"  enctype="multipart/form-data" name="form" >
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
									<label>Course fee</label>
									<input type="number"  class="form-control" id="fee"  name="fee" placeholder="Enter Fee"  value="<%=(String)session.getAttribute("cfee")%>" readonly>
                                                                        
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
									<label>Paid Fee</label>
									<input type="number"  class="form-control" id="pfee"  name="pfee" placeholder="Enter Paid Fee" value="<%=(String)session.getAttribute("pfee")%>" readonly>
                                                                        <div id="pf" class="error"></div>
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
        <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label for="payment">Payment Mode</label> 
							   <input type="text" class="form-control" id="payment" 
                                         name="payment"  value="<%=(String)session.getAttribute("pmode")%>" readonly/>
                            </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label for="bank">Bank Name</label> 
							    <input type="text" class="form-control" id="bank" 
                                         name="bank"  value="<%=(String)session.getAttribute("bname")%>" readonly/>
							
                            </div>
                    </div>
            </div>
            	<div class="row">
                        <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                        <label>Date Of Addmission</label>
                                        <input type="text" class="form-control" id="doa"  name="doa" placeholder="Enter Addmission Date"  value="<%=(String)session.getAttribute("doa")%>" readonly >

                                </div>
                        </div>

		</div>	
			<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-danger">Delete</button>
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