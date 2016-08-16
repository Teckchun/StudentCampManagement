<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Setting | HRD</title>
	<link rel="stylesheet" href="../admin/view/bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="../admin/view/plugin/fontawesome/css/font-awesome.min.css">	
  	<link rel="stylesheet" href="../admin/view/css/home.css">
  	<link rel="stylesheet" href="../admin/view/css/formstyle.css">
  	<link href="../admin/view/css/simple-sidebar.css" rel="stylesheet">
    <link rel="stylesheet" href="../admin/view/css/setting.css">
    <link rel="stylesheet" href="../admin/view/css/fixedbar.css">
    <link rel="stylesheet" href="../admin/view/plugin/boostrapvalidator/css/bootstrapValidator.css"/>
    <link rel="stylesheet" type="text/css" href="../admin/view/plugin/sweetalert/sweetalert.css">
  <link rel="icon" href="../admin/view/images/hrdlogo.png" type="image/png" >
   
  	<script src="../admin/view/js/jquery.js"></script>
  	<script src="../admin/view/bootstrape/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="../admin/view/plugin/boostrapvalidator/js/bootstrapValidator.js"></script>
	<link type="text/css" rel="stylesheet" href="../admin/view/plugin/theme-default/materialadmin.css?1425466319" />
  	<style>
  		span.tickicon{
  			color:#8BC34A;
  			font-size: 20px;
  			margin-left: -10px;
  			margin-top: 5px;
  		}
  		span.removeicon{
  			color:#F44336;
  			font-size: 20px;
  			margin-left: -10px;
  			margin-top: 5px;
  		}
  	</style>
</head>
<body>
	<div id="myModal" class="modal fade">
	  <div class="modal-dialog">
		<div class="modal-content" >
			  <!-- dialog body -->
			  <div class="modal-body header-err">
				<button type="button" class="close" id="closeboxalert" data-dismiss="modal">&times;</button>
				<h5>ERROR !!!</h5>
			  </div>
			  <!-- dialog buttons -->
			  <div class="footer-err" align="center">
				
			  </div>
	  	</div>
	  </div>
	</div>

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
						<div class="col-sm-12 wrapper-cover" >
							<div class="row">
								<div class="col-sm-12 background-cover"  id="background-cover"> 
									
									<div class="col-sm-2 box-background" >
										<div class="col-sm-12 box-space"  >
											<div class="wrapper-btn">
												<div  class="fileUpload btn btn-primary btn-upload" >
													<span><i class="fa fa-camera"></i>Update Cover</span>
													<input type="file" class="upload" id="backgroudFeild"/>
												</div>
											</div>
										</div>
										<div class="col-sm-12" align="center" >
											
											<!--load image-->
											<div  class="box-img" id="img-box">
												<img src="images/pic.jpg" class="profile-image" id="profile-image"/>
												<div id="img-change" class="change-img">
													
												</div>
												
												<div class="fileUpload">
													<span><i class="fa fa-camera icon-camera"></i></span>
													<input type="file" class="upload" id="picField" name="picField"/>
												</div>
												
												<h5 class="update-profile-string">Update Profile <br>Picture</h5>
											</div>
											
											<!--close load image-->
										</div>
									</div>
									<div class="col-sm-10"></div>
								
									
								</div>
								<div class="col-sm-12 box-setting-menu" > 
									<div class="text-general" style="margin-top: 20px;">
										<h4 class="general-setting" style="display:inline;"><i class="fa fa-gear"></i>General Setting</h4>
									</div>
									<div  class="save-btn" style="display:inline;">
									<!-- 	<div class="col-sm-3">
											<div class="col-sm-12">
												<div class="row">
													<input type="submit" class=" navbar-left btn btn-primary  btnownstyle" style="margin-top: 10px;width: 110px;position:absolute;" value="Save Change" title="Save on profile and cover change only"/>
												</div>
											</div>
										</div> -->
										<div class="col-sm-8"></div>
										<div class="col-sm-1"></div>
									</div>
								</div>
								
								<!--content form setting-->
								<div class="col-sm-12 content-wrapper">
									<!--personal setting-->
									<div class="col-sm-12">
										<form name="personal"  id="defaultForm1"  class="form-horizontal">
											<fieldset>
												<legend><i class="fa fa-user"></i>Personal Setting</legend>
												<div class="col-sm-12 " >
														<p class="col-sm-2 mylabel"  style="margin-top:15px;">Username :<p>
														
															<div class="col-sm-4 form-group">
																<input class="form-control txttext" type="text" id="username" name="username" placeholder="Username"/>
															</div>
														
														
														<p class="col-sm-1 mylabel" style="margin-top: 5px;">Email<p>
														
															<div class="col-sm-4 form-group">
														    	<input class="form-control txttext" type="text" id="email"  name="email" placeholder="Email" disabled/>
														    </div>
													 
														<div class="col-sm-1" ></div>
												</div>
												
										

												
												<div class="col-sm-12" style="margin-top: 15px;padding-bottom: 20px;">
													<div class="col-sm-2">
														<div class="col-sm-12">
															<div class="row">
																<input type="button" id="btnpersonal" onclick="updateUserInfo()" class=" navbar-left btn btn-primary  btnownstyle" style="margin-top: 10px;" value="update"/>
															</div>
														</div>
													</div>
													<div class="col-sm-9 ">
														<div id="personal-err" class="col-sm-12 errmessage">
															<h4 class="text-err"><i class="fa fa-cog"></i>Please fill out the information!!!</h4>
														</div>
													</div>
													<div class="col-sm-1"></div>
												</div>
											</fieldset>
										</form>
									</div>
									<!--close personal setting-->
									<!--password setting-->
									<div class="col-sm-12">
										<form  id="defaultForm2" class="form-horizontal" name="pass">
											<fieldset>
												<legend><i class="fa fa-unlock-alt"></i>Password Setting</legend>
										
												<div class="col-sm-12">
													<p class="col-sm-2 mylabel" style="margin-top:15px;">Current Password:<p>
													<div class="col-sm-4 form-group">
														<input class="form-control txttext" id="cpass" type="password" name="cpassword" onkeyup="checkPassword()" placeholder="Your Current Password"/>
														
													</div>
													<div class="col-sm-6"><span id="statuscheckpass" ></span></div>
												</div>
												<div class="col-sm-12">
													<p class="col-sm-2 mylabel" style="margin-top:15px;">New Password:<p>
													<div class="col-sm-4 form-group">
														<input class="form-control txttext" type="password" id="newpass" name="password" placeholder="Your New Password" disabled/>
													</div>
													<div class="col-sm-6"></div>
												</div>
	
												<div class="col-sm-12">
													<p class="col-sm-2 mylabel" style="margin-top:15px;">Confirmed Password:<p>
													<div class="col-sm-4 form-group">
														<input class="form-control txttext" type="password" id="conpass" name="confirmPassword" placeholder="Your Confirmed Password" disabled/>
													</div>
													<div class="col-sm-6"></div>
												</div>
												<div class="col-sm-12" style="margin-top: 15px;padding-bottom: 50px;">
													<div class="col-sm-2">
														<div class="col-sm-12">
															<div class="row">
																<input type="button" id="btnpassword" onclick="updatePassword()" class=" navbar-left btn btn-primary  btnownstyle" style="margin-top: 10px;" value="update"/>
															</div>
														</div>
													</div>
													<div class="col-sm-9 form-group">
														<div id="pass-err" class="col-sm-12 errmessage">
															<h4 class="text-err"><i class="fa fa-cog"></i>Please fill out the information!!!</h4>
														</div>
														
		
													</div>
													<div class="col-sm-1"></div>
												</div>
											</fieldset>
										</form>
									</div>
									<!--close password setting-->
								</div>
								
								<!--close content form setting-->
							</div>
						</div>
					</div>
				<!--close row-->
				</div>
				<!--close fluid-->
			</div>
		</div>
	</div>
	
	<!-- Menu Toggle Script -->

	<script src="../admin/view/plugin/sweetalert/sweetalert.min.js"></script>
	<script>
		//server implementation 
		getUserSettingData();
		function getUserSettingData(){
			var stuidjs='<c:out value="${sesslogin[0] }"></c:out>';
			$.ajax({
				url: "usersetting",
				type: "POST",
				data:{
					stuid:stuidjs
				},
				success:function(data){
					
					listUserSetting(data);
				}
			});
		}
		function listUserSetting(data){
			$("#username").val(data.username);
			$("#email").val(data.email);
			$("#profile-image").attr("src","imguser/"+data.usersrc);
			$("#background-cover").attr({
				"style" : "background: url('imgbg/"+data.bgsrc+"');margin-top:0;height:310px;background-size:100% 310px"
			});
		}
		function checkPassword(){
			var stuidjs='<c:out value="${sesslogin[0] }"></c:out>';
			
			$.ajax({
				url : "passwordsetting",
				type : "POST",
				data :{
					stuid:stuidjs,
					stupass:$("#cpass").val()
				},
				success:function(data){
					
					if(data==false){
						$("#statuscheckpass").attr("class","glyphicon glyphicon-remove removeicon");
						$("#newpass").attr('disabled','disabled');
						$("#conpass").attr('disabled','disabled');
					}else{
						$("#statuscheckpass").attr("class","glyphicon glyphicon-ok tickicon")
						$("#newpass").removeAttr('disabled');
						$("#conpass").removeAttr('disabled');
					}
				}
				
			});				
		}
		function updatePassword(){
			var curpass=$("#cpass");
			var password=$("#newpass");
			var conpass=$("#conpass");
			if(curpass.val()=="" || curpass.val()==null || password.val()=="" || password.val()==null || conpass.val()=="" || conpass.val()==null){
				getNullCompare(curpass);
				getNullCompare(password);
				getNullCompare(conpass);
			}else{
				var stuidjs='<c:out value="${sesslogin[0] }"></c:out>';
				$.ajax({
					url : "changepassword",
					type : "POST",
					data :{
						stuid:stuidjs,
						stupass:$("#newpass").val()
					},
					success:function(data){
						if(data==true){
							swal("Your password has been updated successfully", "", "success")
						}else{
							swal("Error", "Updating password failed!", "error")
						}
					}
				});
			}
		}
		
		function getNullCompare(variable){
			if(variable.val()=="" || variable.val()==null){
				variable.attr("class","form-control txttext invalidInput");	
			}else{
				variable.attr("class","form-control txttext");
			}
		}
		
		function updateUserInfo(){
			
			
			$.ajax({
				url : "updateuserinfo",
				type : "POST",
				data :{
					username:$("#username").val(),
					email: $("#email").val()
				},
				success:function(data){
					
					if(data==true){
						swal("personal setting has been updated successfully", "", "success")
					}else{
						swal("personal setting failed!", "", "error")
					}
				}
			});
		}
		
		//server implementation closing
		function alertBox(){
			$("#myModal").on("show", function() {    // wire up the OK button to dismiss the modal when shown
				$("#myModal a.btn").on("click", function(e) {
					console.log("button pressed");   // just as an example...
					$("#myModal").modal('hide');     // dismiss the dialog
				});
			});

			$("#myModal").on("hide", function() {    // remove the event listeners when the dialog is dismissed
				$("#myModal a.btn").off("click");
			});
    
			$("#myModal").on("hidden", function() {  // remove the actual elements from the DOM when fully hidden
				$("#myModal").remove();
			});
    
			$("#myModal").modal({                    // wire up the actual modal functionality and show the dialog
				"backdrop"  : "static",
				"keyboard"  : true,
				"show"      : true                     // ensure the modal is shown immediately
					
			});
		}
		document.getElementById("picField").onchange=function(evt) {
			var tgt = evt.target || window.event.srcElement,
				files = tgt.files;
			var fileUpload = document.getElementById("picField");
			//validation on size image
			if (typeof (fileUpload.files) != "undefined") {
				var size = parseFloat(fileUpload.files[0].size / 1024).toFixed(2);
				if(size>3024){
					alertBox();
					var txt="<br><p><strong>RULE</strong> : you can't upload image with size more than <strong>3MB</strong>!!!</p><p>Your image's size : <strong>"+size+"KB</strong></p><br>";
					$(".footer-err").height("150px");
					$(".footer-err").html(txt);
					return;
				}
			} else {
				alert("This browser does not support HTML5.");
			}
			// FileReader support
			if (FileReader && files && files.length) {
				var fr = new FileReader();
				fr.onload = function () {
					
					var data1;
				    data1 = new FormData();
				    data1.append('file', $('#picField')[0].files[0]);
				   // data1.append(stuidjs);
					$.ajax({
						url : "updateuserimage",
						type : "POST",
						cache: false,
						contentType: false,
						processData: false,
						data : data1,
						success:function(data){
							if(data==true){
								swal("Your Profile image has been updated successfully", "", "success")
							}else{
								swal("Your Profile image failed", "", "error")
							}
						}
					});
					
					
					document.getElementById("profile-image").src = fr.result;
				}
				fr.readAsDataURL(files[0]);
			}
			// Not supported
			else {
				// fallback -- perhaps submit the input to an iframe and temporarily store
				// them on the server until the user's session ends.
			}
		}
		//background validation
		document.getElementById("backgroudFeild").onchange=function(evt) {
			var tgt = evt.target || window.event.srcElement,
				files = tgt.files;
			var fileUpload = document.getElementById("backgroudFeild");
			 //Check whether HTML5 is supported.
			if (typeof (fileUpload.files) != "undefined") {
				//Initiate the FileReader object.
				var reader = new FileReader();
				//Read the contents of Image File.
				reader.readAsDataURL(fileUpload.files[0]);
				reader.onload = function (e) {
					//Initiate the JavaScript Image object.
					var image = new Image();
					//Set the Base64 string return from FileReader as source.
					image.src = e.target.result;
					//Validate the File Height and Width.
					image.onload = function () {
						var height = this.height;
						var width = this.width;
						var size = parseFloat(fileUpload.files[0].size / 1024).toFixed(2);
						
						if(size>5124){
							alertBox();
							$(".footer-err").height("150px");
							var txt="<br><p><strong>RULE</strong> : you can't upload image with size more than <strong>5MB</strong>!!!</p><p>Your image's size : <strong>"+size+"KB</strong></p><br>";
							$(".footer-err").html(txt);
							return;
						}
						if (height < 150  || width < 600) {
							alertBox();
							$(".footer-err").height("240px");
							var txt="<br><p><strong>WARNING</strong> : your dimension of image can't be accepted!!!<br><br><Strong>Your Image's dimension</Strong><br>height : <strong>"+height+"</strong> pixels<br>width  :  <strong>"+width+"</strong> pixels<br><br><Strong>RULE</Strong><br> height must be <strong>150 pixels</strong> <br>width must be at least<strong> 600 pixels</strong>!!!</p>";
							$(".footer-err").html(txt);
							return;
						}
					
						// FileReader support
						if (FileReader && files && files.length) {
							var fr = new FileReader();
							fr.onload = function () {
								var data1;
							    data1 = new FormData();
							    data1.append('file', $('#backgroudFeild')[0].files[0]);
								$.ajax({
									url : "updatebgimage",
									type : "POST",
									cache: false,
									contentType: false,
									processData: false,
									data : data1,
									success:function(data){
										
										if(data==true){
											swal("Your cover has been updated successfully", "", "success");
										}else{
											swal("Your cover has been updated successfully", "", "error");
										}
									}
								});
								document.getElementById("background-cover").style.backgroundImage = "url('"+fr.result+"')";
							}
							fr.readAsDataURL(files[0]);
						}

						// Not supported
						else {
							// fallback -- perhaps submit the input to an iframe and temporarily store
							// them on the server until the user's session ends.
						}
					};
				}
			} else {
            alert("This browser does not support HTML5.");
			}
			
		}
	</script>
	<!-- Validation Script for form -->
		<!-- Validtor form -->
	<script type="text/javascript">
	$(document).ready(function() {
		$("#myModal").click(function(){
			
			$("#closeboxalert").click();
			/* $("#myModal").remove(); */
		});
	    $('#defaultForm1').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	username: {
	                message: 'The username is not valid',
	                validators: {
	                    notEmpty: {
	                        message: 'The username is required and can\'t be empty'
	                    },
	                    stringLength: {
	                        min: 6,
	                        max: 30,
	                        message: 'The username must be more than 6 and less than 30 characters long'
	                    },
	                    regexp: {
	                        regexp: /^[a-zA-Z0-9_\.]+$/,
	                        message: 'The username can only consist of alphabetical, number, dot and underscore'
	                    }
	                }
	            },   
	            email: {
	                validators: {
	                    notEmpty: {
	                        message: 'The email address is required and can\'t be empty'
	                    },
	                    emailAddress: {
	                        message: 'The input is not a valid email address'
	                    }
	                }
	            }

	            
	        }
	    });
	    $('#defaultForm2').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        
	          
	           
	            password: {
	                validators: {
	                    notEmpty: {
	                        message: 'The password is required and can\'t be empty'
	                    },
	                    identical: {
	                        field: 'confirmPassword',
	                        message: 'The password and its confirm are not the same'
	                    }
	                }
	            },
	            confirmPassword: {
	                validators: {
	                    notEmpty: {
	                        message: 'The confirm password is required and can\'t be empty'
	                    },
	                    identical: {
	                        field: 'password',
	                        message: 'The password and its confirm are not the same'
	                    }
	                }
	            }
	            
	        }
	    });
	});
	</script>
	
	<!-- Clost validator -->
	<!-- Validation Script for form with jquey-->
	<script>
		$(document).ready(function(){
	
        
			//variable of form personal setting
			/* var email = $("input[name='email']");
			var username = $("input[name='username']"); */
		
			//variable of form password setting
			var c = $("input[name='cpassword']");
			var n = $("input[name='password']");
			var con = $("input[name='confirmPassword']");
			//event for personal setting
			/* $("input#btnpersonal").click(function(){
				if(email.val()=="" || email.val()=="" || username.val()==null || useranme.val()==null ){
					$("#personal-err").slideDown("fast",function(){
						$(this).delay(4000);
						$(this).slideUp("fast");
					});
				}
				
			}); */
			//event for password setting
			$("input#btnpassword").click(function(){
				if(c.val()=="" || n.val()=="" || con.val()==""){
					$("#pass-err").slideDown("fast",function(){
						$(this).delay(4000);
						$(this).slideUp("fast");
					});
				}
				
			});
		});
	</script>
	
	
</body>
</html>