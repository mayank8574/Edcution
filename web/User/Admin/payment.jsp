<%@include file="header.jsp" %>
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
    int cf=0,pf,rem;
    if(rs.next())
    {
        session.setAttribute("name",rs.getString("name"));
        session.setAttribute("fname",rs.getString("fname"));
        session.setAttribute("fee",rs.getString("fee"));
        cf=Integer.parseInt(rs.getString("fee"));
    }
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
    
    
    if(session.getAttribute("msg")==null)
     {
     session.setAttribute("msg","");
     session.setAttribute("payment","Select Payment Mode");
     session.setAttribute("bank","Select Bank Name");
     session.setAttribute("rf","rf");
     
     }     
    
%>
<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                            <div class="title">
                                    <h4>Payment</h4>
                                    <h3><%=(String)session.getAttribute("msg")%></h3>
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
					
                     <form action="../../payment" method="post"  onsubmit="return validate();" name="form" >
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
									<label>Father Name</label>
									<input type="text"  class="form-control" id="fname"  name="fname" placeholder="Enter Adhar Number" value="<%=(String)session.getAttribute("fname")%>" readonly>
                                                                        
								</div>
							</div>
						</div>      
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
                                                                        <label>Remaining Fee</label>
                                                                        <input type="number" class="form-control" id="rf"  name="rf" placeholder="Enter Paid fee" value="<%=(String)session.getAttribute("rf")%>">
                                                                        <div id="rf" class="error"></div>
                                                                </div>
                                                         </div>
							
						</div>
	
	   
                               
	   
        
        
           
        
            				<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-primary">Submit</button>
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
<%
    session.setAttribute("msg",null);
%>
<script>
function validate()
{
    var payment=form.payment.value;
    var bank=form.bank.value;
    var rfee=form.rfee.value;
    flag=1;
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
       if(rfee=="")
       {
           document.getElementById("rf").innerHTML="Please Enter Paid Ammount ";
           if(flag==1)
           {
               form.rfee.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("rf").innerHTML="";
       }
       if(flag==1)
           return true;
       else
           return false;

}
    
    
</script>