<%@include file="header.jsp" %>
<%
    if(session.getAttribute("msg")==null)
   session.setAttribute("msg",""); 
   

 %>
<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="title">
                                   <h4> Reset Password</h4><br/>
                                    <h3><%=(String)session.getAttribute("msg")%></h3>
                            </div>
                            
                    </div>
                    <div class="col-md-6 col-sm-12 text-right">
                            <div class="dropdown">
                                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                            January 2018
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
							
							<img src="../Profile/<%=(String)session.getAttribute("uprofile")%>" alt="alt" class="circle1"/></h1><br/>
						</div>
						
					</div><br/>
					
                                              <form action="../../studentpassword" method="post"  onsubmit="return validate();" name="form" >
                                                  <div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Old Password</label>
									<input type="text" class="form-control" id="opass"  name="opass" placeholder="Enter Course Code"  >
                                                                        <div id="o" class="error"></div>
								</div>
							</div>
							
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>New Password</label>
									<input type="text" class="form-control" id="npass"  name="npass" placeholder="Enter Course Code"  >
                                                                        <div id="n" class="error"></div>
								</div>
							</div>
							
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Re Enter New Password </label>
									<input type="text" class="form-control" id="rpass"  name="rpass" placeholder="Enter Duration" >
                                                                        <div id="r" class="error"></div>
								</div>
							</div>
							
						</div>
	
			<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<button type="change" class="btn btn-danger">Change</button>
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
<script>
   var n=/^[A-Za-z0-9 ]{4,30}$/;
   
   function validate()
   {
       var opass=form.opass.value;
       var npass=form.npass.value;
       var epass=form.rpass.value;
       flag=1;
       if(opass=="")
       {
          document.getElementById("o").innerHTML="Please Enter Old Password";
           if(flag==1)
           {
               form.opass.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("o").innerHTML=""; 
       }
       if(!n.test(npass))
       {
           document.getElementById("n").innerHTML="Please Enter New Password";
           if(flag==1)
           {
               form.npass.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("n").innerHTML="";
       }
       if(epass!=npass)
       {
           document.getElementById("r").innerHTML="Password Mismatch";
           if(flag==1)
           {
               form.rpass.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("r").innerHTML="";
       }
       
      
      
       if(flag==1)
           return true;
       else
           return false;
   }
</script>
<%
    session.setAttribute("msg",null);
%>


