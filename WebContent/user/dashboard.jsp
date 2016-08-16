<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

 
    <link rel="stylesheet" href="../admin/view/bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="../admin/view/plugin/fontawesome/css/font-awesome.min.css">	
 	<link rel="stylesheet" href="../admin/view/css/home.css">
  	<link rel="stylesheet" href="../admin/view/css/formstyle.css">
  	<link rel="stylesheet" href="../admin/view/css/simple-sidebar.css">
 <link rel="icon" href="../admin/view/images/hrdlogo.png" type="image/png" >
  
  	<link rel="stylesheet" href="../admin/view/css/fixedbar.css">
  	
		<link type="text/css" rel="stylesheet" href="../admin/view/plugin/theme-default/materialadmin.css?1425466319" />
  
    <script src="../admin/view/js/jquery.js"></script>
  	<script src="../admin/view/bootstrape/js/bootstrap.min.js"></script>
     <title>Dashboard | HRD</title>
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
	  	<%@include file="fixedbar/leftmenu.jsp" %>
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
							<img src="../admin/view/images/student.png" style="margin-top:-20px" class="img-responsive col-sm-12 imgstyle"/>
						</div>
						<%-- <c:out value="${sesslogin }"></c:out> --%>
						<%-- <c:out value="${sesslogin }"></c:out> --%>
						<!-- 4 boxes -->
						<div class="col-sm-12" style="height:30px;"></div>
							<div class="col-sm-12">
								<div class="col-sm-3 ">
									<a href="personalinfo.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#EF5350;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-user fa-5x iconstyle" ></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash">Personal Infomation</h4>
										</div>
									</div>
									</a>
								</div>
								<div class="col-sm-3">
									<a href="studentresult.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#66BB6A;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-graduation-cap fa-5x iconstyle"></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash">Student Result</h4>
										</div>
										
									</div>
									</a>
								</div>
								<div class="col-sm-3">
									<a href="scoreinfo.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#42A5F5;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-bar-chart fa-5x iconstyle"></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash">Score Information</h4>
										</div>
									
									</div>
									</a>
								</div>	
								<div class="col-sm-3">
									<a href="scoreinfo.jsp">
									<div class="col-sm-12 thumbnail mybox" style="height: 170px;background:#78909C;">
										<div class="col-sm-12" align="center">
											<i class="fa fa-print fa-5x iconstyle"></i>
										</div>
										<div class="col-sm-12">
											<h4 class="textdash">Print Transcript</h4>
										</div>
									</div>
									</a>
								</div>	
								
								
							</div>	
							
					</div> <!-- end of 4 boxes -->
				</div> <!-- end of row -->
			</div> <!-- end of container-fluid -->
		</div>	<!-- end of row -->
	</div> <!-- end of content right -->
  </div> <!-- end of wrapper -->
	
</body>
</html>

