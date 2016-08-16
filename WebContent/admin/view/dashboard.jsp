<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="your,keywords">
<meta name="description" content="Short explanation about this website">

    <link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="plugin/fontawesome/css/font-awesome.min.css">	
 	<link rel="stylesheet" href="css/home.css">
  	<link rel="stylesheet" href="css/formstyle.css">
  	<link rel="stylesheet" href="css/simple-sidebar.css">
  	<link rel="stylesheet" href="css/fixedbar.css">
  	<link rel="icon" href="images/hrdlogo.png" type="image/png" >
	<link type="text/css" rel="stylesheet" href="plugin/theme-default/materialadmin.css?1425466319" />

    <script src="js/jquery.js"></script>
  	<script src="bootstrape/js/bootstrap.min.js"></script>
     <title>Dashboard</title>
	
<style>
	a.detail-info{
	 text-decoration: none;
	}
		a.detail-info:hover{
			color: #1d9c73;
			font-weight: bold;
		}
	</style>
</head>
<body>
	
  	<%@include file="fixedbar/topmenu.jsp" %>
  
  	<!-- wrapper div -->
  	<div id="wrapper" style="margin-top:54px;">
  		<c:choose>
  			<c:when test="${sesslogin[3]=='teacher' }">
  				<%@include file="fixedbar/leftmenuinstructor.jsp" %>
  				<c:redirect url="dashboardteacher.jsp"></c:redirect>
  			</c:when>
  			<c:otherwise>
  				<%@include file="fixedbar/leftmenu.jsp" %>
  			</c:otherwise>
  		</c:choose>
	  	<!-- left menu -->
	  
	    <!-- end of left menu -->
    
    <!--content right-->
	<div id="page-content-wrapper" >
		<div class="row">
			<!--open fluid-->
			<div id="test2" class="container-fluid" >
				<!--content row-->
				<div class="row">
					<div class="col-sm-12" >
						<div class="col-sm-12">
							<img src="images/student.png" style="margin-top:-20px" class="img-responsive col-sm-12 imgstyle"/>
						</div>
						<div class="col-sm-12">
							<p class="describe" class="col-sm-12" style="">សូមស្វាគមន៍មកកាន់ទំព័រគ្រប់គ្រងសិស្ស</p>
						</div>	
						<%-- <c:out value="${sesslogin }"></c:out> --%>
						<!-- 4 boxes -->
						<div class="col-sm-12" style="height:30px;"></div>
							<div class="col-sm-12">
								<div class="col-sm-3 ">
									<a href="studentlist.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#EF5350;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-users fa-5x iconstyle" ></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash"><span id="stdcount"></span></h4>
										</div>
									</div>
									</a>
								</div>
								<div class="col-sm-3">
									<a href="classlist.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#66BB6A;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-sitemap fa-5x iconstyle"></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash"><span id="cclass"></span></h4>
										</div>
										
									</div>
									</a>
								</div>
								<div class="col-sm-3">
									<a href="scoremanage.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#42A5F5;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-bar-chart fa-5x iconstyle"></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash">Score Management</h4>
										</div>
									
									</div>
									</a>
								</div>	
								<div class="col-sm-3">
									<a href="addattendance.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#78909C;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-pie-chart fa-5x iconstyle"></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash">Student Attendance</h4>
										</div>
									</div>
									</a>
								</div>	
							</div>	
							
							<!-- BEGIN NEW REGISTRATIONS -->
							<div class="col-md-4">
								<div class="col-md-12">
								<div class="card-box">
									 <div class="card-head" style="background:#42A5F5;color:white">
										<header class="box-text-style"><i class="fa fa-line-chart"></i>TOP MONTHLY STUDENTS</header>
										<div class="tools hidden-md">
											<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
										</div>
									</div>
									<div id="display">
										
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
						</div><!-- END NEW REGISTRATIONS -->
						
						
						<!-- BEGIN NEW REGISTRATIONS -->
							<div class="col-md-4">
								<div class="col-md-12">
								<div class="card-box">
									<div class="card-head" style="background:#42A5F5;color:white">
										<header class="box-text-style"><i class="fa fa-users"></i>New Staffs</header>
										<div class="tools hidden-md">
											<a class="btn btn-icon-toggle btn-close"><i class="md md-close"></i></a>
										</div>
									</div><!--end .card-head -->
									<div id="mytest">
										<!-- <ul class="list divider-full-bleed ul-style">
											<li class="tile">
												<div class="tile-content">
													<div class="tile-icon">
														<img src="images/user.jpg" alt="" />
													</div>
													<div class="tile-text">Ann Laurens</div>
												</div>
												<a class="btn btn-flat ink-reaction eye-wrapper">
													<i class="fa fa-eye eye-icon" ></i>
												</a>
											</li>
											
											
										</ul> -->
									</div><!--end .card-body -->
								</div><!--end .card -->
							</div><!--end .col -->
						</div><!-- END NEW REGISTRATIONS -->
									
						<!-- BEGIN SITE ACTIVITY -->
							<div class="col-md-4">
								<div class="col-sm-12">
								<div class="mycard">
									<div class="row">
									
										<div class="col-md-12">
											<div class="card-head" style="background:#42A5F5;color:white">
												<header class="box-text-style"><i class="fa fa-bar-chart"></i>TOTAL's STATS</header>
											</div>
											<div class="card-body height-8">
												<a href="studentlist.jsp" class="detail-info"><strong><span id="stdcountstat"></span></strong> Students</a>
											
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-primary-dark" style="width:100%"></div>
												</div>
												<a href="stafflist.jsp" class="detail-info"><span id="cteacher"></span></a>
												
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-primary-dark" style="width:50%"></div>
												</div>
												<a href="stafflist.jsp" class="detail-info"><span id="admincountstat"></span><strong> Admins</strong></a>
												
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-primary-dark" style="width:80%"></div>
												</div>
												<a href="usermanage.jsp" class="detail-info"><span id="cuser"></span></a>
												
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-primary-dark" style="width:100%"></div>
												</div>
												<a href="classlist.jsp" class="detail-info"><span id="tclass"></span></a>
												
												<div class="progress progress-hairline">
													<div class="progress-bar progress-bar-primary-dark" style="width:100%"></div>
												</div>
											</div><!--end .card-body -->
										</div><!--end .col -->
									</div><!--end .row -->
								</div><!--end .card -->
								</div>
							</div><!--end .col -->
							<!-- END SITE ACTIVITY -->
					</div> <!-- end of 4 boxes -->
				</div> <!-- end of row -->
			</div> <!-- end of container-fluid -->
		</div>	<!-- end of row -->
	</div> <!-- end of content right -->
  </div> <!-- end of wrapper -->
	<script>
	// chun
	listsnewstaff();
		/*countstudent  */
		$.ajax({
			url:"countstudent",
			method:"GET",
			success: function(data){
				$("#stdcount").append(data+"&nbsp;Students");
				$("#stdcountstat").append(data);
			}
			
			
		});
		/*count admin  */
		$.ajax({
			url:"countadmin",
			method:"GET",
			success:function(data){
				
				$("#admincountstat").append(data)
			}
			
			
			
		})
		
		//kheang
		$.ajax({
			url: "countclass" , 
			method: "GET",	
			success: function(data){
				$("#cclass").append(data+"&nbsp;Classes");
				$("#tclass").append(data+"&nbsp;Classes");
			}
		});
		$.ajax({
			url : "countstaff",
			method: "GET",
			success: function(data){
				$("#cteacher").append(data+"&nbsp;Teachers");
			}
		});
		$.ajax({
			url : "countuser",
			method : "GET",
			success : function(data){
				 $("#cuser").append(data+"&nbsp;Users"); 
				
			}
		});
		
		
		//kheang
		listtopstudent();
		function listtopstudent(){
			$.ajax({
				url : "gettopstudent",
				method : "GET",
				success : function(data){
					$("#display").html(listtopscore(data));
				}
			});
		}
		function listtopscore(data){
			 var str="";
			 if(data.length == 0){
					
					str += "<ul class='list divider-full-bleed ul-style'>"+ 
					"<li class='tile'>"+
							"<div class='tile-content'>"+
							"<div class='tile-text' align='center'>No records to display</div>"+	
							"</div>"+
							
					"</li>"+
					"</ul>";
				}else{
				for(var i=0; i<data.length; i++){
					
					str += "<ul class='list divider-full-bleed ul-style'>"+ 
						"<li class='tile'>"+
								"<div class='tile-content'>"+
										"<div class='tile-icon'>"+
											"<img src='../../imgprofiles/"+data[i].stu_profile+"' alt=''' />"+
										"</div>"+
									"<div class='tile-text'>" + data[i].stu_name +"</div>"+
								"</div>"+
								/* "<a class='btn btn-flat ink-reaction eye-wrapper'>"+
									"<i class='fa fa-eye eye-icon' ></i>"+
								"</a>"+ */
						"</li>"+
					"</ul>";
					}
				}
				
				return str;
		}
		
		
		//chun
		function listsnewstaff()
		{
			$.ajax({
				
				url:"newstaff",
				method:"GET",
				
				success: function(data){
				$("#mytest").html(listnewstaffdetails(data));
					
				}
			})
			
			
		}
		function listnewstaffdetails(data)
		{
			var str="";
		
			for(var i=0; i<data.length; i++){
				
			 str+="<ul class='list divider-full-bleed ul-style' >"+
			"<li class='tile'>"+
			"<div class='tile-content'>"+
				"<div class='tile-icon'>"+
					"<img src='imgprofile/"+data[i].imagesrc+"' />"+
				"</div>"+
				"<div class='tile-text'>"+data[i].name+"</div>"+
			"</div>"+
			/* "<a class='btn btn-flat ink-reaction eye-wrapper'>"+
				"<i class='fa fa-eye eye-icon' ></i>"+ */
			"</a>"+
			"</li>"+
		
		
		"</ul>";
			 
			/*  str+="<table>"+"<tr>"+"<th>"+data[i].name+"</th>"+"</tr>"; */
			}
			return str;
			
		}
		
	</script>
	

		

</body>
</html>

