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
  
	  	<!-- left menu -->
	  	<c:choose>
  			<c:when test="${sesslogin[3]=='teacher' }">
  				<%@include file="fixedbar/leftmenuinstructor.jsp" %>
  			</c:when>
  			<c:otherwise>
  				<%@include file="fixedbar/leftmenu.jsp" %>
  			</c:otherwise>
  		</c:choose>
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
						
						<!-- 4 boxes -->
						<div class="col-sm-12" style="height:30px;"></div>
							<div class="col-sm-12">
								<div class="col-sm-4 ">
									<a href="scoremanage.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#EF5350;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-bar-chart fa-5x iconstyle" ></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash">Student Score</h4>
										</div>
									</div>
									</a>
								</div>
								<div class="col-sm-4">
									<a href="studentresult.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#66BB6A;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-graduation-cap fa-5x iconstyle"></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash">Student Result</span></h4>
										</div>
										
									</div>
									</a>
								</div>
								<div class="col-sm-4">
									<a href="setting.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#42A5F5;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-cogs fa-5x iconstyle"></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash">Setting</h4>
										</div>
									
									</div>
									</a>
								</div>	
							</div>	
							
							<!-- END SITE ACTIVITY -->
					</div> <!-- end of 4 boxes -->
				</div> <!-- end of row -->
			</div> <!-- end of container-fluid -->
		</div>	<!-- end of row -->
	</div> <!-- end of content right -->
  </div> <!-- end of wrapper -->
</body>
</html>

