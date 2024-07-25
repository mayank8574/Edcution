<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>DataTable</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">DataTable</li>
								</ol>
							</nav>
                                                    
						</div>
						<div class="col-md-6 col-sm-12 text-right">
							<div class="dropdown">
								<a class="btn btn-primary dropdown-toggle" href="#" role="button" data-toggle="dropdown">
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
                  
				<div class="card-box mb-30">
					<div class="pd-20">
						<h4 class="text-blue h4">Data Table with Export Buttons</h4>
                                                
					</div>
                                   
			</div>
			
					<div class="pb-20">
						<table class="table hover multiple-select-row data-table-export nowrap">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">Course code</th>
									<th>Course Name</th>
									<th>Duration </th>
									<th>Fee</th>
									
                                                                        
								</tr>
							</thead>
							<tbody>
                                                             <% 
                                        Connection con;
                                        ResultSet rs;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
                                        String query="select * from course";
                                        Statement st=con.createStatement();
                                        rs=st.executeQuery(query);
                                        int i=0;
                                        while(rs.next())
                                        {
                                         i++;
                                         String ccode =rs.getString("ccode");
                                    
                                        %>
								<tr>
									<td class="table-plus"><%=rs.getString("ccode")%></td>
									<td><%=rs.getString("cname")%></td>
									<td><%=rs.getString("duration")%></td>
									<td><%=rs.getString("fee")%></td>
									
                                                                        
											
											
												<td><a href="student.jsp?ccode=<%=ccode%>"
								class="btn btn-primary"> Select </a></td>
												
								
								
								</tr>
								 <% } %>
							</tbody>
						</table>
					</div>
				</div>
                                
                
				
			
			
	



<%@include file="footer.jsp" %>