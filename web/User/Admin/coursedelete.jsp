<%@page import="java.sql.*" %>
<%
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
    String ccode=request.getParameter("ccode");
   
    
   
    String query="select * from course where ccode='"+ccode+"'";
    Statement st=con.createStatement();
    rs=st.executeQuery(query);
    if(rs.next())
    {
       
        session.setAttribute("ccode",rs.getString("ccode"));
        session.setAttribute("cname",rs.getString("cname"));
        session.setAttribute("duration",rs.getString("duration"));
        session.setAttribute("fee",rs.getString("fee"));
        session.setAttribute("module",rs.getString("module"));
        session.setAttribute("career",rs.getString("career"));
    
        
    
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
                                    <h4>Form</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                    <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Form Basic</li>
                                    </ol>
                            </nav>
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
						<div class="pull-left">
							<h4 class="text-blue h4">Delete Course Form</h4>
							
						</div>
						
					</div><br/>
					
                                              <form action="../../delcourse" method="post"   name="form" >
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
                                                                        <div id="n" class="error"></div>
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
									<input type="number"  class="form-control" id="fee"  name="fee" placeholder="Enter Fee"  value="<%=(String)session.getAttribute("fee")%>" readonly>
                                                                        <div id="f" class="error"></div>
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
				<input type="text" class="form-control" id="career"  name="career" placeholder="Enter Career "  value="<%=(String)session.getAttribute("career")%>"readonly>
                                <div id="ca" class="error"></div>
			</div>
		</div>
	</div>
                                
	
		<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-danger">Delete</button>
						<a href="coursedisplay.jsp"
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
<%
    session.setAttribute("msg",null);
%>
 
