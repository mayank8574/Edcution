<%@include file="header.jsp" %>
<%@page import="java.sql.*"%>
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
						<h4 class="text-blue h4">Enquiry Data</h4>
                                                
					</div>
                                   
			</div>
			
					<div class="pb-20">
						<table class="table hover multiple-select-row data-table-export nowrap">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">Name</th>
									<th>Email</th>
									<th>Contact </th>
									<th>City</th>
                                                                        <th>message</th>
									<th>status</th>
                                                                        <th>Data Of Apply</th>
                                                                        <th class="datatable-nosort">Action</th>
								</tr>
							</thead>
							<tbody>
                                                             <% 
                                        Connection con;
                                        ResultSet rs;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con=DriverManager.getConnection("jdbc:mysql://localhost/cd","root","");
                                        String query="select * from enquiry";
                                        Statement st=con.createStatement();
                                        rs=st.executeQuery(query);
                                        int i=0;
                                        while(rs.next())
                                        {
                                         i++;
                                         String id =rs.getString("id");
                                    
                                        %>
								<tr>
									<td class="table-plus"><%=rs.getString("name")%></td>
									<td><%=rs.getString("email")%></td>
									<td><%=rs.getString("contact")%></td>
									<td><%=rs.getString("city")%></td>
                                                                        <td><%=rs.getString("message")%></td>
									<td><%=rs.getString("status")%></td>
									<td><%=rs.getString("doe")%></td>
                                                                        <td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href=""><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href=""><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href=""><i class="dw dw-delete-3"></i> Delete</a>
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