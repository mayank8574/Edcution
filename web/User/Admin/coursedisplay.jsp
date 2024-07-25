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
                                                    <h4>Course Information</h4>
                                            </div>
                                            <nav aria-label="breadcrumb" role="navigation">
                                                    <ol class="breadcrumb">
                                                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                                            <li class="breadcrumb-item active" aria-current="page">DataTable</li>
                                                    </ol>
                                            </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-12 text-right">
                                            <div class="dropdown">
                                                            <%=date%>
                                            </div>
                                    </div>
                            </div>
                    </div>
				<div class="card-box mb-30">
					<div class="pd-20">
						<h4 class="text-blue h4">Data Table with Export Buttons</h4>
                                                <a href="course.jsp" class="btn btn-primary"> Add Course </a>
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
									<th>Module</th>
									
                                                                        <th class="datatable-nosort">Action</th>
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
									<td><%=rs.getString("module")%></td>
									
                                                                        <td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="couerseview.jsp?ccode=<%=ccode%>"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="courseedit.jsp?ccode=<%=ccode%>"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="coursedelete.jsp?ccode=<%=ccode%>"><i class="dw dw-delete-3"></i> Delete</a>
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