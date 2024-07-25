<%@include file="header.jsp"%> 
<div class="page-nav no-margin row">
        <div class="container">
            <div class="row">
                <h2>About University of  Toranto</h2>
                <ul>
                    <li> <a href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li><i class="fas fa-angle-double-right"></i> About Us</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- ######## Page  Title End ####### -->

     <div style="margin-top:0px;" class="row no-margin">
        
        <iframe style="width:100%" src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d249759.19784092825!2d79.10145254589841!3d12.009924873581818!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1448883859107"  height="450" frameborder="0" style="border:0" allowfullscreen></iframe>


      </div>

      <div class="row contact-rooo no-margin">
        <div class="container">
           <div class="row">
               
          
            <div style="padding:20px" class="col-sm-6">
            <h2 style="font-size:18px">Contact Form</h2>
            <form action="Contact" onsubmit="return validate();" method="post"  name="form" >

                <div class="row">
                    <div style="padding-top:10px;" class="col-sm-3"><label>Enter Name :</label></div>
                    <div class="col-sm-8"><input type="text" placeholder="Enter Name" name="name" id="name" class="form-control input-sm"  ></div>
                    <div id="n" class="error"></div>
                </div>
                <div style="margin-top:10px;" class="row">
                    <div style="padding-top:10px;" class="col-sm-3"><label>Email Address :</label></div>
                    <div class="col-sm-8"><input type="text" name="email" id="email" placeholder="Enter Email Address" class="form-control input-sm"  ></div>
                    <div id="e" class="error"></div>
                </div>
                 <div style="margin-top:10px;" class="row">
                    <div style="padding-top:10px;" class="col-sm-3"><label>Mobile Number:</label></div>
                    <div class="col-sm-8"><input type="text" name="mobile" id="mobile" placeholder="Enter Mobile Number" class="form-control input-sm"  ></div>
                    <div id="m" class="error"></div>
                </div>
                 <div style="margin-top:10px;" class="row">
                    <div style="padding-top:10px;" class="col-sm-3"><label>Enter  Message:</label></div>
                    <div class="col-sm-8">
                      <textarea rows="5" name="message" id="message" placeholder="Enter Your Message" class="form-control input-sm"></textarea>
                    </div>
                        <div id="a" class="error"></div>
                </div>
                 <div style="margin-top:10px;" class="row">
                    <div style="padding-top:10px;" class="col-sm-3"><label></label></div>
                    <div class="col-sm-8">
                       
                     <button class="btn btn-success btn-sm">Send Message</button>
                    </div>
                </div>
            </div>
             <div class="col-sm-6">
                    
                  <div style="margin:50px" class="serv"> 
                
               
             
                              
              
          <h2 style="margin-top:10px;">Address</h2>

    Smart Hospital <br>
    Daman Street<br>
    K.K District<br>
    Phone:+91 9159669599<br>
    Email:info@smart-eye.in<br>
    Website:www.smart-eye.com<br>

 
       
            
                
                
              
           </div>    
                
             
         </div>

            </div>
        </div>
        
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
       var mobile=form.mobile.value;
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
       if(!c.test(mobile))
       {
           document.getElementById("m").innerHTML="Enter Mobile Number";
           if(flag==1)
           {
               form.mobile.focus;
           }
           flag=0;
       }
       else{
           document.getElementById("m").innerHTML="";
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
       if(flag==1)
           return true;
       else
           return false;
       
      
   }
   </script>
       
           