<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Score Info | HRD</title>
<link rel="stylesheet"
	href="../admin/view/bootstrape/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../admin/view/plugin/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../admin/view/css/home.css">
<link rel="stylesheet" href="../admin/view/css/studentlist.css">
<link rel="stylesheet" href="../admin/view/css/formstyle.css">
<link href="../admin/view/css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../admin/view/plugin/sweetalert/sweetalert.css">
<link rel="stylesheet" href="../admin/view/css/fixedbar.css">
<link rel="icon" href="../admin/view/images/hrdlogo.png"
	type="image/png">
<script src="../admin/view/js/jquery.js"></script>
<script src="../admin/view/bootstrape/js/bootstrap.min.js"></script>


<style>
span.description-text {
	font-weight: bold;
	font-style: italic;
}

span.space {
	border-bottom: 1px solid #E0E0E0;
	padding-bottom: 10px;
	display: inline-block;
	width: 100%;
}
</style>

<!--  data table-->
<script
	src="../admin/view/plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
<link rel="stylesheet"
	href="../admin/view/plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
	<link type="text/css" rel="stylesheet" href="../admin/view/plugin/theme-default/materialadmin.css?1425466319" />
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
						<div class="col-sm-12">



							<div class="col-sm-12" style="margin-top:15px;">



								<legend>

									<h3>
										<i class="fa fa-pencil"></i><b>Student </b> <font size="4">Monthly Score( <span
											id="course-detail"></span> , <span id="generation-detail"></span>)
											</font>
									</h3>

								</legend>


								<div class="col-sm-12" style="padding-bottom: 20px;">
									<div class="col-sm-12">
										
										<button id="btnprint" disabled type="button" onclick="printTranscript()" class="btn btn-primary btnstyle"><img class='iconimage' src="../admin/view/images/printer.png"/>&nbsp;&nbsp;<b class="boldstyle">P</b>rint <b class="boldstyle">T</b>ranscript</button>
										<button id="btnprintcertificate" disabled type="button" onclick="printCertificate()" class="btn btn-success btnstyle"><img class='iconimage' src="../admin/view/images/certificate.png"/>&nbsp;&nbsp;<b class="boldstyle">P</b>rint <b class="boldstyle">C</b>ertificate</button>
									</div>
								</div>
								<!-- picture showing -->
								<div class="col-sm-12">
									<div class="col-sm-12">

										<div class="fileinput fileinput-new" data-provides="fileinput">
											<div class="fileinput-preview thumbnail"
												data-trigger="fileinput" id="profileshow"
												style="width: 200px; height: 150px;"></div>
											<!-- <div>
                                                   <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
                                                   <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                              </div> -->
										</div>
									</div>
								</div>
								<!--close picture showing -->
								<div class="col-sm-12">
									<p class="col-sm-2 mylabel" style="margin-top: 15px;">Student's
										Name :
									<p>
									<div class="col-sm-5 form-group">
										<input class="form-control txttext" type="text" name="txtfname"
											placeholder="Student Name" id="stuname" disabled />
									</div>
									<p class="col-sm-1 mylabel">Gender:
									<p>
									<div class="col-sm-4 form-group">
										<input class="form-control txttext" type="text" name="txtlname"
											placeholder="Gender" id="gender" disabled />
									</div>



								</div>
								<div class="col-sm-12">
									<p class="col-sm-2 mylabel" style="margin-top: 15px;">Class
										:
									<p>
									<div class="col-sm-10 form-group">
										<input class="form-control txttext" type="text" name="txtfname"
											placeholder="Class" id="stuclass" disabled />
									</div>
								</div>
								<!--col-12-->
								<div class="col-sm-12" style="padding-bottom: 20px;">
									<div class="col-sm-12">
										<span class="description-text space" style="color: #1d9c73;">Score
											details</span>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="col-sm-12" id="tablescore"></div>
								</div>



							</div>
							<!-- close col-12 -->





						</div>
					</div>
					<!--close row-->
				</div>
				<!--close fluid-->
				
			</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-md">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color:#1d9c73; color:WHITE">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" style="font-weight:bold; font-style:italic"  >Score Details for <span id="month"> </span></h3>
				</div>
				<div class="" style="text-align: center">
					<!--form input student's detail-->
					<div class="col-sm-12"
						style="margin-top: 20px; padding-bottom: 50px;">
						<div class="col-sm-12">
							<h4 class="col-sm-12 mylabel"
								style="margin-top: 15px; text-align: center">
								<span id="gendetail"></span>
							</h4>
						</div>
						
						<div class="col-sm-12" id="scorespecific">
							
						</div>


					</div>
					<!--close input student's detail-->


				</div>
				<div class="modal-footer">

					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->

				</div>
			</div>

		</div>
	</div>

	</div>

	<!--END MODAL-->


<script src="../admin/view/plugin/sweetalert/sweetalert.min.js"></script>

	<script>
		checkStudentDate();
		function checkStudentDate(){
			
			$.ajax({
				url :"checkcourseenddate",
				type : "POST",
				success: function(data){		
					if(data==true){
					
						$("#btnprint").removeAttr("disabled");
						$("#btnprintcertificate").removeAttr("disabled");
					}else{
						$("#btnprint").attr("disabled","disabled");
						$("#btnprintcertificate").attr("disabled","disabled");
					}
					
				}
			});
		}
		function printCertificate(){
			$.ajax({
				url :"checkcourseenddate",
				type : "POST",
				success: function(data){
					
					if(data==true){
						var stuidjs = '<c:out value="${sesslogin[0] }"></c:out>';
						window.open("getscertificate?id="+stuidjs+"&hour=500&date=2015.08.06","_blank");
					}else{
						swal("Certificate can't be printed!", "you haven't finished your course", "error");
					}
					
				}
			});
		
		}
		function printTranscript() {
			$.ajax({
				url :"checkcourseenddate",
				type : "POST",
				success: function(data){
					
					if(data==true){
						var stuidjs = '<c:out value="${sesslogin[0] }"></c:out>';
						window.open("gettranscript?id=" + stuidjs + "", "_blank");
					}else{
						swal("Transcript can't be printed!", "you haven't finished your course", "error");
					}
					
				}
			});
			

		}
		function getScoreDetail(scoremonth){
			$("#month").html(getMonthScore(scoremonth));
			$.ajax({
				url :"getscoredetail",
				type : "POST",
				data:{
					scoremonth: scoremonth
				},
				success: function(data){		
					
					$("#scorespecific").html(listScoreSpecific(data));
					invokeDataTable1();
				}
			});
		}
		function listScoreSpecific(data){
			var stable="<table class='display' id='myTable1' cellspacing='0' width='100%'>";
			stable+="<thead>";
			stable+="<tr >";
			stable+="<th>Subject</th>";
			stable+="<th>Score</th>";
			stable+="</tr>";
			stable+="</thead>";
			stable+="<tbody>";
			for(var i=0;i<data.length;i++){
				stable+="<tr class='myrow'  style='height: 50px'>";
				stable+="<td>"+data[i].subject+"</td>";
				stable+="<td>"+data[i].score+"</td>";
				stable+="</tr>";
			}
		
			stable+="</tbody></table>";
			return stable;
		}
		function invokeDataTable1(){
			$('#myTable1').DataTable({
				
				"paging":   false,
		        "ordering": true,
		        "info":     false,
		        "bFilter": false
				
				
			});
		}
		$(document)
				.ready(
						function() {

							$.ajax({
								url : "listscoredetail",
								type : "POST",
								success : function(data) {
									$("#tablescore")
											.append(getTableScore(data));
									invokeDataTable();
								}
							});
							
							$
									.ajax({
										url : "liststuscoredetail",
										type : "POST",
										success : function(data) {

											$("#course-detail").append(
													data.course_type);
											$("#generation-detail").append(
													data.generation_name);
											var proimg = "<img style='width:135px;height:140px;' src='../imgprofiles/"+data.stu_profile+"'>";
											$("#profileshow").append(proimg);
											$("#stuname").val(data.stu_name);
											var gender = "";
											if (data.stu_gender == 0
													|| data.stu_gender == '0') {
												gender = "Male";
											} else
												gender = "Female";
											$("#gender").val(gender);
											$("#stuclass").val(data.cls_name);
										}
									});

							function invokeDataTable() {
								$('#myTable').DataTable();
							}
							function getTableScore(data) {

								var table = "<table class='display' id='myTable' cellspacing='0' width='100%'>";
								table += "<thead><tr>";
								table += "<th >Month</th>";
								table += "<th >Score</th>";
								table += "<th >Scholarship</th>";
								table += "<th >Action</th></tr></thead>";
								table += "<tbody>";
								for (var i = 0; i < data.length; i++) {
									table += "<tr class='myrow' >";

									table += "<td >"
											+ getMonthScore(data[i].month)
											+ "</td>";
									table += "<td>" + data[i].score + "</td>";
									table += "<td>$ "
											+ generateScholarship(data[i].score)
											+ "</td></td>";
									table += "<td>"
											+ "<button class='btn btn-primary btnview' onclick=getScoreDetail('"
											+ data[i].month
											+ "') type='button' data-toggle='modal' data-target='#myModal'><span class='glyphicon glyphicon-eye-open'></span></button>"
											+ "</td>"
								}
								table += " </tbody></table>";
								return table;
							}
							function getMonthScore(data) {
								var month = "";
								if (data == 1 || data == '1') {
									month = "January";
								} else if (data == 2 || data == '2') {
									month = "February";
								} else if (data == 3 || data == '3') {
									month = "March";
								} else if (data == 4 || data == '4') {
									month = "April";
								} else if (data == 5 || data == '5') {
									month = "May";
								} else if (data == 6 || data == '6') {
									month = "June";
								} else if (data == 7 || data == '7') {
									month = "July";
								} else if (data == 8 || data == '8') {
									month = "August";
								} else if (data == 9 || data == '9') {
									month = "September";
								} else if (data == 10 || data == '10') {
									month = "October";
								} else if (data == 11 || data == '11') {
									month = "November";
								} else if (data == 12 || data == '12') {
									month = "December";
								}
								return month;

							}
							function generateScholarship(score) {
								var money = 0;

								if (score < 70) {
									money = 0;
								} else if (score <= 75) {
									money = 50;
								} else if (score <= 80) {
									money = 60;
								} else if (score <= 85) {
									money = 70;
								} else if (score <= 90) {
									money = 80;
								} else if (score <= 95) {
									money = 90;
								} else {
									money = 100;
								}
								return money;
							}
						});
		function getMonthScore(data) {
			var month = "";
			if (data == 1 || data == '1') {
				month = "January";
			} else if (data == 2 || data == '2') {
				month = "February";
			} else if (data == 3 || data == '3') {
				month = "March";
			} else if (data == 4 || data == '4') {
				month = "April";
			} else if (data == 5 || data == '5') {
				month = "May";
			} else if (data == 6 || data == '6') {
				month = "June";
			} else if (data == 7 || data == '7') {
				month = "July";
			} else if (data == 8 || data == '8') {
				month = "August";
			} else if (data == 9 || data == '9') {
				month = "September";
			} else if (data == 10 || data == '10') {
				month = "October";
			} else if (data == 11 || data == '11') {
				month = "November";
			} else if (data == 12 || data == '12') {
				month = "December";
			}
			return month;

		}
	</script>


</body>
</html>