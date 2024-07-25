<%
    char gen=' ';
    if(session.getAttribute("msg")==null)
    {
        session.setAttribute("msg","");
        session.setAttribute("name","");
        session.setAttribute("email","");
        session.setAttribute("city","");
        session.setAttribute("contact","");
        session.setAttribute("gender"," ");
        session.setAttribute("expreience","");
        
    
    }
    else
     gen=session.getAttribute("gender").toString().charAt(0);
 %>
 
<%@include file="header.jsp"%>
<div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                
                <h2 align="center">Career</h2>
                <h3 align="center" class="error"><%=(String)session.getAttribute("msg")%></h3>
              
            </div>
        </div>
    </div>
<div class="container mt-3">
		
		
                <form action="CareerData" method="post" onsubmit="return validate();" enctype="multipart/form-data" name="form" >
                    

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="name">Name</label> 
                                                <input type="text" class="form-control"id="name"  name="name" placeholder="Enter Name" value="<%=(String)session.getAttribute("name")%>"  />
                                                <div id="n" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="designation">Email-Id</label> 
                                                <input type="text"class="form-control" id="email" name="email" placeholder="Enter Email-Id" value="<%=(String)session.getAttribute("email")%>"  />
						<div id="e" class="error"></div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="contact">Contact</label> 
							 <input type="text" class="form-control"id="contact" name="contact" placeholder="Enter Contact Number" value="<%=(String)session.getAttribute("contact")%>" />    
							<div id="c" class="error"></div>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="city">City</label> 
                                                <input type="text" class="form-control"id="city" name="city" placeholder="Enter city" value="<%=(String)session.getAttribute("city")%>"  />
						<div id="b" class="error"></div>	
					</div>
				</div>
			</div>
                    <div class="row">
				<div class="col">
					<div class="form-group">
						<label for="cv"></label> 
                                                <input type="file" class="form-control"id="cv"  name="cv"  />
                                                <div id="p" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
                                            <label for="designation">Gender</label><br>
                                            <input type="radio" id="gender" name="gender" value="M"<%if (gen=='M'){ %> checked<%}%>/>&nbsp;&nbsp;&nbsp;Male&nbsp;&nbsp;&nbsp;
                                                <input type="radio" id="gender" name="gender" value="F"<%if (gen=='F'){ %> checked<%}%> />&nbsp;&nbsp;&nbsp;Female
						<div id="g" class="error"></div>
					</div>
				</div>
			</div>
                    

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="expreience">Expreience</label>
						<textarea class="form-control" id="expreience" name="expreience"
							rows="5" placeholder="Enter Expreience"/><%=(String)session.getAttribute("expreience")%></textarea>
						<div id="a" class="error"></div>
					</div>
                                    
				</div>
                               
				
			</div>
                        
                                                
			<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-primary">Submit</button>
						<a href="index.jsp"
							class="btn btn-warning"> Back </a>
					</div>
				</div>
			</div>
		</form>

	</div>

   
<%@include file="footer.jsp"%>
<script>
   var n=/^[A-Za-z ]{3,30}$/;
   var c=/^[0-9]{7,12}$/;
   var e=/^([a-zA-Z0-9\.])+\@(([a-zA-Z0-9])+\.)+([a-zA-Z0-9]{2,3})+$/;
   function validate()
   {
       var name=form.name.value;
       var email=form.email.value;
       var contact=form.contact.value;
       var city=form.contact.value;
       var expreience=form.expreience.value;
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
       if(!e.test(email))
       {
           document.getElementById("e").innerHTML="Enter valid email";
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
           document.getElementById("c").innerHTML="Enter Contact Number";
           if(flag==1)
           {
               form.contact.focus;
           }
           flag=0;
       }
       else{
           document.getElementById("c").innerHTML="";
       }
        if(city=="")
       {
           document.getElementById("b").innerHTML="Enter City Name";
           if(flag==1)
           {
               form.city.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("b").innerHTML="";
       }
       if(expreience=="")
       {
          document.getElementById("a").innerHTML="Write Expreience ";
          if(flag==1)
          {
              form.expreience.focus;
          }
          flag=0;
       }
       else{
             document.getElementById("a").innerHTML="";
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
