<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stafflist | HRD</title>
<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
<link rel="stylesheet"
	href="plugin/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/studentlist.css">
<link rel="stylesheet" href="css/formstyle.css">
<link rel="icon" href="images/hrdlogo.png" type="image/png" >
<link href="css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="plugin/sweetalert/sweetalert.css">
<link rel="stylesheet"
	href="plugin/jasny-bootstrap/css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="css/fixedbar.css">



<script src="js/jquery.js"></script>
<script src="bootstrape/js/bootstrap.min.js"></script>
<script src="plugin/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>


<link rel="stylesheet"
	href="plugin/Zebra_Datepicker-master/public/css/default.css"
	type="text/css" />

<style>
p.mylabel {
	margin-top: 5px;
}
.scorestyle{
color:white;
border-radius:3px;
padding:2px 10px 2px 10px;
font-weight:bold;
}

#sid, #fn, #ln, #ap, #dob, #plb, #padd, #stt, #endt, #stdate, #mphone,
	#memail, #faname, #faphone, #faadd, #maphone, #mname, #madd, #ecphon {
	/*	   border-color:rgb(128,128,255);*/
	
}
</style>
<style>
a.mylink {
	display: inline;
}

img.circle {
	width: 35px;
	height: 35px;
}

.toggle.ios, .toggle-on.ios, .toggle-off.ios {
	border-radius: 20px;
}

.toggle.ios .toggle-handle {
	border-radius: 20px;
}
 img.statusimg{
	width: 30px;
	hegith: 30px;
	cursor: pointer;
}
</style>

<!--  data table-->
<script
	src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
<link rel="stylesheet"
	href="plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
</head>
<body>
	<%@include file="fixedbar/topmenu.jsp"%>

	<!-- wrapper div -->
	<div id="wrapper" style="margin-top: 54px;">

		<!-- left menu -->
		<%@include file="fixedbar/leftmenu.jsp"%>
		<!-- end of left menu -->

		<!--content right-->
		<div id="page-content-wrapper">
			<div class="col-sm-12 style-wrapper" >
			<div class="row">
				<!--open fluid-->
				<div id="test2" class="container-fluid">
					<!--content row-->
					<div class="row">
						<!-- open col-12 -->
						<div class="col-sm-12">

							<div class="col-sm-12">
								<!-- open col-12 -->
								<div class="col-sm-12">
									<div class="row">
										<form role="form">
											<fieldset>
												<div class="col-sm-12" >
													<div class="row" style="margin-top: 20px;">
													<legend>
														<h3>
															<i class="fa fa-pencil"></i><b>Staff </b><font size="4">Management</font>
														</h3>
													</legend>
													</div>
												</div>
												<div class="form-group">
													<div class="row">
													<div class="col-sm-12">
														<div class="col-sm-12">

															<div class="fileinput fileinput-new"
																data-provides="fileinput">
																<div class="fileinput-preview thumbnail"
																	data-trigger="fileinput"
																	style="width: 200px; height: 150px;" id="proimg">
																	<img id="image" />
																</div>
																<div>
																	<span class="btn btn-default btn-file"><span
																		class="fileinput-new">Select image</span><span
																		class="fileinput-exists">Change</span><input
																		type="file" name="staffimg" id="staffimg"></span> <a
																		href="#" class="btn btn-default fileinput-exists"
																		data-dismiss="fileinput">Remove</a>
																</div>
															</div>
														</div>
													</div>

													<!--form input student's detail-->
													<div class="col-sm-12"
														style=" padding-bottom: 10px;">

														<div class="col-sm-12">
															<p class="col-sm-2 mylabel" style="margin-top: 15px;">Full
																Name
															<p>
															<div class="col-sm-4 form-group">
																<input class="form-control txttext" type="text"
																	name="txtfname" placeholder="Full Name"
																	 id="fn" />
															</div>

															<p class="col-sm-1 mylabel">Gender 
															<p>
															<div class="col-sm-2 form-group">

																<select name="gender" class="form-control combo txttext"
																	id="gender">
																	<option value="0">Male</option>
																	<option value="1">Female</option>
																</select>
															</div>
															<p class="col-sm-1 mylabel">Position 
															<p>
															<div class="col-sm-2 form-group ">

																<select name="gender" class="form-control combo txttext"
																	id="position">
																	<option value="admin">Admin</option>
																	<option value="teacher">Teacher</option>
																</select>
															</div>
															
														</div>
														
														
														<div class="col-sm-12">
															<p class="col-sm-2 mylabel" style="margin-top: 15px;">Date
																of Birth :
															<p>
															<div class="col-sm-10 form-group">
																<input class="form-control txttext datepicker"
																	type="text" name="dob"
																	placeholder="Your Birth's Date" id="dob" />
															</div>
															
														</div>

														<div class="col-sm-12">
															<p class="col-sm-2 mylabel" style="margin-top: 15px;">P-Address
														
															<p>
															<div class="col-sm-10 form-group">
																<textarea class="form-control txttext" name="listadd"
																	placeholder="( N , Serg Khat , Khan , city/province... )"
																	onkeypress="focusMe(this)" id="padd"></textarea>
															</div>
															
														</div>


														<div class="col-sm-12">
															<p class="col-sm-2 mylabel" style="margin-top: 15px;">Contact
																
															<p>
															<p class="col-sm-1 mylabel">Phone
															<p>
															<div class="col-sm-3 form-group">
																<input class="form-control txttext" type="text"
																	name="txtstuphone" placeholder="Phone"
																	onkeypress="focusMe(this)" id="mphone" />
															</div>
															<p class="col-sm-1 mylabel">Email
															<p>
															<div class="col-sm-5 form-group">
																<input class="form-control txttext" type="text"
																	name="txtstuemail" placeholder="Email"
																	onkeypress="focusMe(this)" id="memail" />
															</div>
															
														</div>
														<div class="col-sm-12">
															<div class="col-sm-5"></div>
															<div class="col-sm-4" id="errm"
																style="text-align: center; background-color: rgb(237, 31, 41); visibility: hidden;">
																<span id="error"></span>
															</div>
															<div class="col-sm-3">
																<div class="col-sm-12">
																	<button type="button"
																		class=" navbar-right btn btn-primary  btnownstyle "
																		 onclick="saveAllInfo()" id="btnsave"><b class="boldstyle"><i class='fa fa-plus'></i>S</b>ave</button>

																</div>
															</div>
														
														</div>

													</div>

													<!--close input student's detail-->
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
								<!-- close col-12 -->
								<div class="col-sm-12">
									<div class="row">
									<legend>
										<h4>
											<i class="fa fa-list-alt"></i><i>List of Staffs</i>
										</h4>
										
									</legend>
									</div>
								</div>
								<div id="display">
									
								</div>

								<div class="col-sm-12">
									
								</div>
							</div>

						</div>
						<!-- close col-12 -->
					</div>
					<!--close row-->
				</div>
				<!--close fluid-->
			</div>
		 </div>
		</div>
	</div>
	<script type="text/javascript"
		src="plugin/Zebra_Datepicker-master/public/javascript/zebra_datepicker.js"></script>
	<script>
	
		$(document).ready(function() {
			$('input.datepicker').Zebra_DatePicker();
		});
	</script>
	<script src="plugin/sweetalert/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
		
		});
	</script>
	<script>
		$("#staffimg").change(function(){
			
				
		});
	     var ischange=false; 
		$("#staffimg").change(function(){
			ischange=true;
		}); 
		function invokeTableStyle() {
			$('#myTable').DataTable();
		}
		function saveAllInfo() {
			saveInfo();
			myuploadimg();
		}
		function myuploadimg() {
			var data1;
			data1 = new FormData();
			data1.append('file', $('#staffimg')[0].files[0]);
			$.ajax({
						url : "uploadimage",
						type : "POST",
						cache : false,
						contentType : false,
						processData : false,
						data : data1,
						success : function(data) {
							if (data == true) {
								swal(
										"Your Profile image has been updated successfully",
										"", "success")
							} else {
								swal(
										"Error",
										"", "error")
							}
						}
					});
		}
		function saveInfo() {
			var fullPath = document.getElementById('staffimg').value;
			var filename="";
			if (fullPath) {
				var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
				 filename = fullPath.substring(startIndex);
				if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
					filename = filename.substring(1);
				}
			
			}
			$.post("savestaff", {
				name : $("#fn").val(),
				gender : $("#gender").val(),
				position : $("#position").val(),
				dob : $("#dob").val(),
				phone : $("#mphone").val(),
				pob : $("#padd").val(),
				email : $("#memail").val(),
				profile : filename
			}, function(data) {
				if(data==true){
					listStaff();
					clearValue();
					swal("Information has been saved", "DONE!", "success");
				}else{
					swal("Error", "", "error");
				}
				
			});
		}
		
		function list(data) {
			var str = "<table class='display' id='myTable' cellspacing='0' width='100%'>"
					+ "<thead>"
					+ "<tr>"
					+ "<th>ID</th>"
					+ "<th>Image</th>"
					+ "<th>Name</th>"
					+ "<th>Gender</th>"
					+ "<th>Email</th>"
					+ "<th>Phone</th>"
					+ "<th>Position</th>"
					+ "<th>Action</th>"
					+ "<th>Status</th>"
					+ "</tr>"
					+ "</thead><tbody>";
			for (var i = 0; i < data.length; i++) {
				str += "<tr style='cursor:auto;color:#616161;' ><td>"
						+ data[i].id
						+ "</td>"
						
						+ "<td><img src='imgprofile/"+data[i].profile+"' class='img-circle circle' /></td>"
						+ "<td>"
						+ data[i].name
						+ "</td>"
						+ "<td>"
						+ checkGender(data[i].gender)
						+ "</td>"
						+ "<td>"
						+ data[i].email
						+ "</td>"
						+ "<td>"
						+ data[i].phone
						+ "</td>"
						+ "<td>"
						+ staffposition(data[i].position)
						+ "</td>"
						+ "<td><button   class='btnmystyle btn btn-success btnedit'  type='button' onclick=toEdit('"+data[i].id.trim()+"')>"
						+ "<span class='glyphicon glyphicon-pencil'></span>"
						+ "</button></td>"
						if(data[i].status==0){
							str+="<td><img class='statusimg' src='images/uncheck.png' onclick=updateStatus('"+data[i].id.trim()+"',1)></td>";
							
						}else{
							str+="<td><img class='statusimg' src='images/check.png'  onclick=updateStatus('"+data[i].id.trim()+"',0) ></td>";
							
						}
						+ "</tr>";
			}
			str += "</tbody></table>";
			return str;
		}
		function clearValue(){
			
			 $("#fn").val("");
			$("#dob").val("");
			$("#padd").val("");
			$("#mphone").val("");
			$("#memail").val("");
		//	$("#image").attr("src","imgprofile/"+data.profile);
		}
		function updateStatus(id,status){
			
	 		$.ajax({
				url : "adminupdatestaffstatus",
				type : "POST",
				data:{
					staffid:id,
					staffstatus:status
				},
				success:function(data){
					listStaff();
				}
			});
	 	}
		function listStaff() {
			$.get("listallstaff", function(data) {
				$("#display").html(list(data));
				invokeTableStyle();
			});
		}
		listStaff();
		function toEdit(id) {
			 $.get("getstaff", 
		       {
				id :id
			   }, function(data) {
				  
				   
				  $("#fn").val(data.name);
				var g = data.gender;
				if (g =='0' || g== 0)
					g = "0";
				else
					g = "1";
				$("#gender").val(g);
				$("#position").val(data.position);
				$("#dob").val(data.dob);
				$("#padd").val(data.address);
				$("#mphone").val(data.phone);
				$("#memail").val(data.email);
			
				$("#proimg img").attr("src","imgprofile/"+data.profile);
				$("#btnsave").html("<b  class='boldstyle'><i class='fa fa-pencil'></i>E</b>dit");
				$("#btnsave").attr("onclick","myEdit('"+id+"')");
				defaultimg=data.profile;
			});
		}
		
		function myEdit(id){
			var fullPath = document.getElementById('staffimg').value;
			var filename="";
			
			if(ischange){
				
				if (fullPath) {
					var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
					 filename = fullPath.substring(startIndex);
					if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
						filename = filename.substring(1);
					}
					
				}
				myuploadimg();
			   }else{
					filename=defaultimg;
			   } 
			
			 $.post("editstaff",
					{
				     id:id,
				     name : $("#fn").val(),
				     gender : $("#gender").val(),
				     position : $("#position").val(),
					 dob : $("#dob").val(),
					 phone : $("#mphone").val(),
					 address : $("#padd").val(),
					 email : $("#memail").val(),
					 profile :filename
					},function(data){
					
						$("#btnsave").html("<b class='boldstyle'><i class='fa fa-plus'></i>S</b>ave");
						$("#btnsave").attr("onclick","saveAllInfo()");
						listStaff();
						swal("Information has been udated", "DONE!", "success");
						clearValue();
					});
		}
		function checkGender(data){
			var gender="";
			if(data==0 || data=='0'){
				gender="Male";
			}else{
				gender="Female";
			}
			return gender;
		}	
		function staffposition(position){
	  		var myposition="";
	  		if(position=="teacher"){
	  			myposition+="<span class='scorestyle' style='background:#2196F3;'>"+position+"</span>";
	  		}else{
	  			myposition+="<span class='scorestyle' style='background:#4CAF50;'>"+position+"</span>";
	  		}
	  		
	  		return myposition;
	  	}
	</script>
</body>
</html>

















