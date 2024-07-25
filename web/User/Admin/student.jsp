<%@page import="java.sql.*" %>
<%
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
    if(request.getParameter("ccode")!=null)
    {
        String ccode=request.getParameter("ccode");
        session.setAttribute("ccode",ccode);


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
        }
    }

  char gen=' ';
  if(session.getAttribute("msg")==null)
  {
     session.setAttribute("msg","");
     session.setAttribute("name",""); 
     session.setAttribute("email","");
     session.setAttribute("adhar",""); 
     session.setAttribute("fname",""); 
     session.setAttribute("dob",""); 
     session.setAttribute("contact","");
     session.setAttribute("gender","");
     session.setAttribute("address","");
     session.setAttribute("payment","Select Payment Mode");
     session.setAttribute("bank","Select Bank Name");
     session.setAttribute("pfee","");
     session.setAttribute("doe","");
}  
 else
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
                                    <h4 >Form</h4>
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
							<h4 class="text-blue h4">Add Student Form</h4>
							<h3><%=(String)session.getAttribute("msg")%></h3>
						</div>
						
					</div><br/>
					
                                              <form action="../../studentadd" method="post" onsubmit="return validate();" enctype="multipart/form-data" name="form" >
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Course Code</label>
									<input type="text" class="form-control" id="ccode"  name="ccode" placeholder="Enter Course Code"  value="<%=(String)session.getAttribute("ccode")%>" readonly >
                                                                        
								</div>
							</div>
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Course Name</label>
									<input type="text" class="form-control" id="cname"  name="cname" placeholder="Enter Course Name"  value="<%=(String)session.getAttribute("cname")%>" readonly>
                                                                        
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Duration</label>
									<input type="text" class="form-control" id="duration"  name="duration" placeholder="Enter Duration"  value="<%=(String)session.getAttribute("duration")%>" readonly>
                                                                        
								</div>
							</div>
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>fee</label>
									<input type="number"  class="form-control" id="fee"  name="fee" placeholder="Enter Fee"  value="<%=(String)session.getAttribute("fee")%>" readonly>
                                                                        
								</div>
							</div>
						</div>
	<div class="row">
		<div class="col-md-12 col-sm-12">
			<div class="form-group">
				<label>Module</label>
				<input type="text" class="form-control" id="module"  name="module" placeholder="Enter Module"  value="<%=(String)session.getAttribute("module")%>" readonly>
                               
			</div>
		</div>
	</div>
	   
                                <div class="row">
							<div class="col-md-6 col-sm-12">
								<div class="form-group">
									<label>Name</label>
									<input type="text" class="form-control" id="name"  name="name" placeholder="Enter Name" value="<%=(String)session.getAttribute("name")%>">
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
                                 <input type="text" class="form-control" id="fname"  name="fname" placeholder="Enter Father Name" value="<%=(String)session.getAttribute("fname")%>">
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
                                    <input type="text" class="form-control" id="email"  name="email" placeholder="Enter Email ID" value="<%=(String)session.getAttribute("email")%>">
                                    <div id="e" class="error"></div>
                            </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label>Contact</label>
                                    <input type="text" class="form-control" id="contact"  name="contact" placeholder="Enter Contact" value="<%=(String)session.getAttribute("contact")%>">
                                    <div id="co" class="error"></div>
                            </div>
                    </div>
        </div>
        <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label>Date Of Birth</label>
                                    <input type="date" class="form-control" id="dob"  name="dob" placeholder="Enter Date Of Birth" value="<%=(String)session.getAttribute("dob")%>">
                                    <div id="db" class="error"></div>
                            </div>
                    </div>
                    <div class="col">
					<div class="form-group">
						<label for="Profile"></label> 
                                                <input type="file" class="form-control"id="image"  name="image"  />
                                                
						
					</div>
				</div>
        </div>
            <div class="row">
		<div class="col-md-12 col-sm-12">
			<div class="form-group">
				<label>Address</label>
				<input type="text" class="form-control" id="addess"  name="address" placeholder="Enter Address "  value="<%=(String)session.getAttribute("address")%>">
                                <div id="a" class="error"></div>
			</div>
		</div>
	</div>
        <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label for="subject">Payment Mode</label> 
							    <select id="payment" name="payment" class="form-control">
							    	<option value="<%=(String)session.getAttribute("payment")%>" label="<%=(String)session.getAttribute("payment")%>"></option>
                                                                <option value="Cash" label="Cash"></option>
							        <option value="UPI" label="UPI"></option>
							        <option value="Cheque" label="Cheque"></option>
							        <option value="Net Banking" label="Net Banking"></option>
							    </select>
							<div id="p" class="error"></div>
                            </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label for="subject">Bank Name</label> 
							    <select id="bank" name="bank" class="form-control">
							    	<option value="<%=(String)session.getAttribute("bank")%>" label="<%=(String)session.getAttribute("bank")%>"></option>
							        <option value="Punjab National Bank" label="Punjab National Bank"></option>
							        <option value="Central Bank Of India" label="Central Bank Of India"></option>
							        <option value="State Bank Of India" label="State Bank Of India"></option>
                                                                 <option value="Other" label="Other"></option>
							    </select>
							<div id="b" class="error"></div>
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                    <label>Paid fee</label>
                                    <input type="number" class="form-control" id="pfee"  name="pfee" placeholder="Enter Paid fee" value="<%=(String)session.getAttribute("pfee")%>">
                                    <div id="pf" class="error"></div>
                            </div>
                    </div>
                   
        </div>				
			<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-primary">Submit</button>
						
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
 <script>
   var n=/^[A-Za-z ]{3,30}$/; 
   var fname=/^[A-Za-z ]{3,30}$/;
   var an=/^[0-9]{12,12}$/;
   var c=/^[0-9]{7,12}$/;
   var e=/^([a-zA-Z0-9\.])+\@(([a-zA-Z0-9])+\.)+([a-zA-Z0-9]{2,3})+$/;
   function validate()
   {
       var name=form.name.value;
       var email=form.email.value;
       var Fn=form.fname.value;
       var adharno=form.adhar.value;
       var contact=form.contact.value;
       var address=form.address.value;
       var dob=form.dob.value;
       var gender=form.gender.value;
       
       var payment=form.payment.value;
       var bank=form.bank.value;
       var pfee=form.pfee.value;
       
       flag=1;
       if(!n.test(name))
       {
           document.getElementById("n").innerHTML="Enter a valid Name";
           if(flag==1)
           {
               form.name.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("n").innerHTML="";
       }
       if(!an.test(adharno))
       {
           document.getElementById("ad").innerHTML="Enter Valid AdharNumber";
           if(flag==1)
           {
               form.adhar.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("ad").innerHTML="";
       }
       if(!fname.test(Fn))
       {
           document.getElementById("f").innerHTML="Enter  Father Name";
           if(flag==1)
           {
               form.fname.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("f").innerHTML="";
       }
       if(!e.test(email))
       {
           document.getElementById("e").innerHTML="Enter Email Id";
           if(flag==1)
           {
               form.email.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("e").innerHTML="";
       }
       if(!c.test(contact))
       {
           document.getElementById("co").innerHTML="Enter Contact Number";
           if(flag==1)
           {
               form.contact.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("co").innerHTML="";
       }
       if(address=="")
       {
           document.getElementById("a").innerHTML="Enter Address";
           if(flag==1)
           {
               form.address.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("a").innerHTML="";
       }
       
       if(gender=="")
       {
           document.getElementById("g").innerHTML="Enter  Gender ";
           if(flag==1)
           {
               form.gender.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("g").innerHTML="";
       }
       if(dob=="")
       {
           document.getElementById("db").innerHTML="Enter Date Of Birth ";
           if(flag==1)
           {
               form.dob.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("db").innerHTML="";
       }
       if(payment=="Select Payment Mode")
       {
           document.getElementById("p").innerHTML="Please Select Payment Mode  ";
           if(flag==1)
           {
               form.payment.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("p").innerHTML="";
       }
       if(payment=="Cheque")
       {
            if(bank=="Select Bank Name")
            {
                document.getElementById("b").innerHTML="Select Bank Name ";
                if(flag==1)
                {
                    form.bank.focus;
                }
               flag=0;
            }
            else{
                document.getElementById("b").innerHTML="";
             }
       }
       
       
       if(pfee=="")
       {
           document.getElementById("pf").innerHTML="Please Enter Paid Ammount ";
           if(flag==1)
           {
               form.pfee.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("pf").innerHTML="";
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