<%@page import="java.sql.*" %>
<%
    char gen=' ';
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
    
    String id=" ";
    if(request.getParameter("id")!=null)
    {
        //request.getParameter("id");
        id=request.getParameter("id");
        session.setAttribute("id",id);
        String query="select * from student where id='"+id+"'";
        Statement st=con.createStatement();
        rs=st.executeQuery(query);
        if(rs.next())
        {


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
            session.setAttribute("profile",rs.getString("profile"));
            session.setAttribute("dob",rs.getString("dob"));
            session.setAttribute("temp",rs.getString("email"));
            session.setAttribute("temp1",rs.getString("adhar"));
            session.setAttribute("msg","");
        }
    }
    else
        id=session.getAttribute("id").toString();
 
        gen=session.getAttribute("gender").toString().charAt(0);   
    
    

  
 %>

<%@include file="header.jsp" %>
<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="title">
                                <h4 class="text-blue h4"> Student Update Form</h4><br/>
                                <h3  class="msg"><%=(String)session.getAttribute("msg")%></h3>
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
					
                                              <form action="../../studentedit" method="post"  enctype="multipart/form-data" name="form" >
						
						
		   
                                <div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Name</label>
									<input type="text" class="form-control" id="name"  name="name" placeholder="Enter Name" value="<%=(String)session.getAttribute("name")%>" >
                                                                        <div id="n" class="error"></div>
								</div>
							</div>
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Adhar Number</label>
									<input type="number"  class="form-control" id="adhar"  name="adhar" placeholder="Enter Adhar Number" value="<%=(String)session.getAttribute("adhar")%>">
                                                                        <div id="ad" class="error"></div>
								</div>
							</div>
						</div>
	   <div class="row">
                <div class="col-md-6 col-sm-12">
                         <div class="form-group">
                                 <label>Father Name</label>
                                 <input type="text" class="form-control" id="fname"  name="fname" placeholder="Enter Father Name" value="<%=(String)session.getAttribute("fname")%>" >
                                 <div id="f" class="error"></div>
                         </div>
                 </div>
                 <div class="col">
                             <div class="form-group">
                                 <label for="designation">Gender</label><br>
                                  <input type="radio" id="gender" name="gender" value="M" <%if (gen=='M'){ %>checked<%}%>/>&nbsp;&nbsp;&nbsp;Male&nbsp;&nbsp;&nbsp;
				  <input type="radio" id="gender" name="gender" value="F" <%if (gen=='F'){ %>checked<%}%>/>&nbsp;&nbsp;&nbsp;Female
                                                <div id="g" class="error"></div>          
                             </div>
                 </div>
                                 
        </div>
        <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" class="form-control" id="email"  name="email" placeholder="Enter Email ID" value="<%=(String)session.getAttribute("email")%>"  >
                                    <div id="e" class="error"></div>
                            </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label>Contact</label>
                                    <input type="text" class="form-control" id="contact"  name="contact" placeholder="Enter Contact" value="<%=(String)session.getAttribute("contact")%>" >
                                    <div id="co" class="error"></div>
                            </div>
                    </div>
        </div>
        <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label>Date Of Birth</label>
                                    <input type="date" class="form-control" id="dob"  name="dob" placeholder="Enter Date Of Birth" value="<%=(String)session.getAttribute("dob")%>" >
                                    <div id="db" class="error"></div>
                            </div>
                    </div>
                   <div class="col-md-6 col-sm-12">
				
					<div class="form-group">
						<label for="Profile"></label> 
                                                <input type="file" class="form-control"id="image"  name="image"  />
                                                <div id="p" class="error"></div>
						
					</div>
				  
		 </div>
        </div>
            <div class="row">
		<div class="col-md-12 col-sm-12">
			<div class="form-group">
				<label>Address</label>
				<input type="text" class="form-control" id="addess"  name="address" placeholder="Enter Address "  value="<%=(String)session.getAttribute("address")%>" >
                                <div id="a" class="error"></div>
			</div>
		</div>
	</div>
        
            				<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-primary">Edit</button>
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
