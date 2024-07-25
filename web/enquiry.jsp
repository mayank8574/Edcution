<%@include file="header.jsp" %>
<div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>Enquiry Form</h2>
                
            </div>
        </div>
    </div>

     <!--  ************************* Gallery Starts Here ************************** -->
     <div class="container mt-3">
         <form action="Enq" method="post" onsubmit="return validate();"  name="form" >
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="name">Name</label> 
                                                <input type="text" class="form-control" id="name"  name="name" placeholder="Enter Name"  />
                                                <div id="n" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="designation">Email-Id</label> 
                                                <input type="text"class="form-control" id="email" name="email" placeholder="Enter Email-Id"  />
						<div id="e" class="error"></div>
					</div>
				</div>
			</div>
                     <div class="row">
				<div class="col">
					<div class="form-group">
						<label for="contact">Contact</label> 
                                                <input type="text" class="form-control"id="contact"  name="contact" placeholder="Enter Contact Number"  />
                                                <div id="c" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="city">City</label> 
                                                <input type="text"class="form-control" id="city" name="city" placeholder="Enter City"  />
						<div id="b" class="error"></div>
					</div>
				</div>
			</div>
                        
                   
                    

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="message">Message</label>
						<textarea class="form-control" id="message" name="message"
							rows="5" placeholder="Enter Address"/></textarea>
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




<%@include file="footer.jsp" %>
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
       var message=form.message.value;
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
       if(message=="")
       {
          document.getElementById("a").innerHTML="Write Message ";
          if(flag==1)
          {
              form.message.focus;
          }
          flag=0;
       }
       else{
             document.getElementById("a").innerHTML="";
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
       if(flag==1)
           return true;
       else
           return false;
       
      
   }
   </script>