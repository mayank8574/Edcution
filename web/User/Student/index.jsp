
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@page import="java.time.format.DateTimeFormatter" %> 
<%@page import="java.time.LocalDateTime" %>
<%
    String date,time;
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    LocalDateTime now = LocalDateTime.now();  
   //System.out.println(dtf.format(now));
   date=dtf.format(now);
 %>
	<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
            <div class="min-height-200px">
                    <div class="page-header">
                            <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                            <div class="title">
                                                    <h4>Welcome </h4>
                                            </div>
                                            <nav aria-label="breadcrumb" role="navigation">
                                                    
                                            </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-12 text-right">
                                            <div class="dropdown">
                                                            <%=date%>
                                            </div>
                                    </div>
                            </div>
                    </div>
<%@include file="footer.jsp" %>