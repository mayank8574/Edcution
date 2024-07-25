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
                                                <a href="coursest.jsp" class="btn btn-primary"> Add Student</a>
					</div>
                                   
			</div>
			
					<div class="pb-20">
						<table class="table hover multiple-select-row data-table-export nowrap">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">Id</th>
                                                                        <th>Name</th>
									<th>Email ID</th>
									<th>Course Code</th>
									<th>Father Name</th>
									<th>Contact</th>
									
                                                                        <th class="datatable-nosort">Action</th>
								</tr>
							</thead>
							<tbody>
                                                             <% 
                                        Connection con;
                                        ResultSet rs;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
                                        String query="select * from student ";
                                        Statement st=con.createStatement();
                                        rs=st.executeQuery(query);
                                        int i=0;
                                        while(rs.next())
                                        {
                                         i++;
                                         String id =rs.getString("id");
                                    
                                        %>
								<tr>
									<td class="table-plus"><%=rs.getString("id")%></td>
                                                                        <td><%=rs.getString("name")%></td>
									<td><%=rs.getString("email")%></td>
									<td><%=rs.getString("ccode")%></td>
									<td><%=rs.getString("fname")%></td>
									<td><%=rs.getString("contact")%></td>
									
                                                                        <td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="studentview.jsp?id=<%=id%>"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="studentedit.jsp?id=<%=id%>"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="studentdelete.jsp?id=<%=id%>"><i class="dw dw-delete-3"></i> Delete</a>
                                                                                                <a class="dropdown-item" href="payment.jsp?id=<%=id%>"><i class="fa-solid fa-money-bill"></i> Payment</a>
                                                                                                <a class="dropdown-item" href="password.jsp?id=<%=id%>"><i class="fa-thin fa-key"></i> Reset Password</a>
                                                                                                <a class="dropdown-item" href="block.jsp?id=<%=id%>"><i class="fa-thin fa-key"></i> Block/Unblock</a>
											</div>
										</div>
									</td>
								</tr>
								 <% } %>
							</tbody>
						</table>
					</div>
				</div>
                                
                
				
			
			
	



<%@include file="footer.jsp" %>