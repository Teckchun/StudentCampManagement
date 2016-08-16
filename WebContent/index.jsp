<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<title> Login</title>

		<!-- BEGIN META -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="keywords" content="your,keywords">
		<meta name="description" content="Short explanation about this website">
		<!-- END META -->

		<!-- BEGIN STYLESHEETS -->
		
		<link type="text/css" rel="stylesheet" href="admin/view/plugin/theme-default/bootstrap.css?1422792965" />
		<link type="text/css" rel="stylesheet" href="admin/view/plugin/theme-default/materialadmin1.css?1425466319" />
		<link type="text/css" rel="stylesheet" href="admin/view/plugin/theme-default/font-awesome.min.css?1422529194" />
		<link type="text/css" rel="stylesheet" href="admin/view/plugin/theme-default/material-design-iconic-font.min.css?1421434286" />
		<link rel="stylesheet" type="text/css" href="admin/view/plugin/sweetalert/sweetalert.css">
    <link rel="icon" href="admin/view/images/hrdlogo.png" type="image/png" >
		<!-- END STYLESHEETS -->
		<!-- BEGIN JAVASCRIPT -->
			
				
		
				<!-- END JAVASCRIPT -->
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script type="text/javascript" src="../../assets/js/libs/utils/html5shiv.js?1403934957"></script>
		<script type="text/javascript" src="../../assets/js/libs/utils/respond.min.js?1403934956"></script>
		<![endif]-->
	</head>
	<body class="menubar-hoverable header-fixed ">

		<!-- BEGIN LOGIN SECTION -->
		<section class="section-account">
			 <div class="img-backdrop" style="background-image: url('admin/view/images/loginbg.jpg');"></div> 
			<div class="spacer"></div>
			<div class="card contain-sm style-transparent">
				<div class="card-body">
					<div class="row">
						<div class="col-sm-10">
							<br/>
							<span class="text-lg text-bold text-primary">WELCOME TO KOREA SOFTWARE HRD</span>
							<br/><br/>
							<form class="form floating-label"  accept-charset="utf-8">
								<div class="form-group">
									<input type="text" class="form-control" onkeypress="checkLogin(event)" id="username" name="username">
									<label for="username">Username</label>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" onkeypress="checkLogin(event)" id="password" name="password">
									<label for="password">Password</label>
									<!-- <p class="help-block"><a href="#">Forgotten?</a></p> -->
								</div>
								<br/>
								<div class="row">
									<div class="col-xs-6 text-left">
										<div class="checkbox checkbox-inline checkbox-styled">
											<label>
												<!-- <input type="checkbox"> <span>Remember me</span> -->
											</label>
										</div>
									</div><!--end .col -->
									<div class="col-xs-6 text-right">
										<button class="btn btn-primary btn-raised" onclick="checkLoginClick()" type="button">Login</button>
									</div><!--end .col -->
								</div><!--end .row -->
							</form>
						</div><!--end .col -->
				
							</div><!--end .row -->
						</div><!--end .card-body -->
					</div><!--end .card -->
				</section>
				<!-- END LOGIN SECTION -->

		 <script src="admin/view/js/jquery.js"></script>	
         <script src="admin/view/plugin/theme-default/js/AppForm.js"></script>
         <script src="admin/view/plugin/sweetalert/sweetalert.min.js"></script>
		<script>
		function checkLogin(e){
			if (e.keyCode == 13) {
				$.ajax({
					url:"actionlogin",
					type:"POST",
					data:{
						username:$("#username").val(),
						pass:$("#password").val()
					},
					success: function(data){
						
						if(data=="user/dashboard.jsp"){
							location.href=data;}
						else{
							swal("Login Failed!", "Username or Password are incorrect!", "error");
								
						}
					}
					
				});
		    }
			
		}
		function checkLoginClick(){
			
				$.ajax({
					url:"actionlogin",
					type:"POST",
					data:{
						username:$("#username").val(),
						pass:$("#password").val()
					},
					success: function(data){
						
						if(data=="user/dashboard.jsp"){
							location.href=data;}
						else{
							swal("Login Failed!", "Username or Password are incorrect!", "error");
								
						}
					}
					
				});
		    
			
		}
		
	</script>
 </body>
</html>
