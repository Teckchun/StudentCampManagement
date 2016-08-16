<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
<link rel="stylesheet"
	href="plugin/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/formstyle.css">
<link rel="stylesheet" href="css/studentlist.css">
<link rel="stylesheet" href="css/simple-sidebar.css">
<link rel="stylesheet" href="css/fixedbar.css">
<link rel="stylesheet"
	href="plugin/Zebra_Datepicker-master/public/css/default.css" />
<link rel="stylesheet"
	href="plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
<link rel="stylesheet" href="plugin/bootstrap-toggle-master/css/bootstrap-toggle.min.css"/>
<link rel="stylesheet" type="text/css"
	href="plugin/sweetalert/sweetalert.css">
	<link rel="icon" href="images/hrdlogo.png" type="image/png" >
<script src="js/jquery.js"></script>
<script src="bootstrape/js/bootstrap.min.js"></script>
<script src="plugin/bootstrap-toggle-master/js/bootstrap-toggle.min.js"></script>
<style>
.modal-header
         {
             padding:9px 15px;
             border-bottom:1px solid #eee;
             background-color: #0480be;
             color:white;
         }
             .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
  .toggle.ios .toggle-handle { border-radius: 20px; }
  img.statusimg{
	width: 30px;
	hegith: 30px;
	cursor: pointer;
}
         </style>
<title>Course</title>
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
				<form role="form">
					<div class="col-sm-12">
						<fieldset>
							<div class="col-sm-12">
								<legend>
									<h3>
										<i class="fa fa-pencil"></i><b>Course </b><font size="4">Management</font>
									</h3>
								</legend>
							</div>
							<div class="form-group">
								<!--form input student's detail-->
								<div class="col-sm-12">
									<div class="col-sm-12">
										<p class="col-sm-2 mylabel" style="margin-top: 15px;">Course
										<p>
										<div class="col-sm-4 form-group">
											<input class="form-control txttext" type="text" id="coursename"
												 name="coursename"
												placeholder="Enter Course's Name" />
										</div>

										<p class="col-sm-2 mylabel " style="margin-top: 4px;">
											Generation
										<p>
										<div class="col-sm-4 form-group">
											<div></div>
											<select class="form-control txttext combo"  id="generation"></select>
										</div>

										
									</div>
									<div class="col-sm-12">
										<p class="col-sm-2 mylabel" style="margin-top: 15px;">Start
										
										<p>
										<div class="col-sm-4 form-group">
											<input class="form-control txttext  datepicker" type="text"
												id="startdate"  name="cid" />
										</div>
										<p class="col-sm-2 mylabel" style="margin-top: 4px;">Finish
										
										<p>
										<div class="col-sm-4 form-group">
											<input class="form-control txttext datepicker" type="text"
												id="enddate"  name="cid" />
										</div>




									</div>
									<div class="col-sm-12">
										<p class="col-sm-2 mylabel" style="margin-top: 15px;">
											Description
										<p>
										<div class="col-sm-10 form-group">
											<textarea class="form-control txttext " id="coursedescription"
												name="coursedescription" 
												placeholder="( some info)"></textarea>
										</div>
										
									</div>

									<div class="col-sm-12" style="margin-top: 5px;">
										<div class="col-sm-8"></div>
										<div class="col-sm-4">
											<div class="col-sm-12 ">
												<button type="button"
													class=" navbar-right btn btn-primary  btnownstyle " id="btnsave"
													  onclick="addCourse()"><b class="boldstyle"><i
												class="fa fa-plus"></i>S</b>ave</button>
											</div>
										</div>
										
									</div>
								</div>
								<!--close input student's detail-->
							</div>
						</fieldset>
					</div>
				</form>
			</div>
			<!--end row  -->
			<div class="row">
				<div class="col-sm-12">
					<form role="form">
						<div class="col-sm-12">
							<fieldset>
								<div class="col-sm-12">
									<div class="row">
									<legend>
										<h4>
											<i class="fa fa-list-alt"></i><i>List of Course</i>
										</h4>
									</legend>
									</div>
								</div>
								<div id="showcourse"></div>
								
							</fieldset>
						</div>
					</form>
				</div>
			</div>
			<!--end table  -->
		</div>
		</div>
	</div>

		<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color:#1d9c73; color:WHITE">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" style="font-weight:bold; font-style:italic"  ><i class=" fa fa-globe"></i>Course Detail<span id="month"> </span></h3>
				</div>
				<div class="" >
					<!--form input student's detail-->
					<div class="col-sm-12"
						style="margin-top: 20px; padding-bottom: 50px;">
						<div class="col-sm-12">
								<h4 class="col-sm-12 mylabel"
									style="margin-top: 15px; text-align: center">
									 <span id="coursedetail"></span>
									</h4>
							</div>
							<div class="col-sm-12">
								<p class="col-sm-2 mylabel" style="margin-top: 15px;">From :
								
								<p>
								<div class="col-sm-4 form-group">
									<input class="form-control txttext " type="text" id="popstartdate"
										 name="startdate" />
								</div>
								<p class="col-sm-1 mylabel" style="margin-top: 4px;">To:
								<p>
								<div class="col-sm-4 form-group">
									<input class="form-control txttext " type="text" id="popenddate"
										 name="enddate" />
								</div>




							</div>
							<div class="col-sm-12">
								<p class="col-sm-2 mylabel" style="margin-top: 15px;">
									Description :
								<p>
								<div class="col-sm-9 form-group">
									<textarea class="form-control txttext" id="coursedes"
										name="listadd"
										placeholder="( some info)"></textarea>
								</div>
								<div class="col-sm-1"></div>
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


	<!--END MODAL-->
	



	<script src="plugin/sweetalert/sweetalert.min.js"></script>
	<script src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
	<script>
	
		adminListCourse();
		listGeneration();
		function adminListCourse(){
			$.ajax({
				url:"adminlistcourse",
				type:"POST",
				success:function(data){
					listCourseTable(data);
				}
			});
		}
		function listGeneration(){
			$.ajax({
				url:"adminlistcoursegen",
				type:"POST",
				success:function(data){
					var optionall=$("<option></optoin>");
    				optionall.append("----SELECT GENERATION-----");
    				optionall.attr("value","");
    				$("#generation").append(optionall);
    				for(var i=0;i<data.length;i++){
    					var option=$("<option></optoin>");
    					option.append(data[i].name);
    					option.attr("value",data[i].id);
    					$("#generation").append(option);
    				}
				}
			});
		}
		function listCourseTable(data){
			
			var coursetb="<table class='display' id='myTable' cellspacing='0' width='100%'>";
			coursetb+="<thead style='text-align: center'>";
			coursetb+="<tr>";
			coursetb+="<th class='col-sm-1'>ID</th>";
			coursetb+="<th class='col-sm-1'>Course Type</th>";
			coursetb+="<th class='col-sm-1'>Generation</th>";
			coursetb+="<th class='col-sm-1'>Start Date</th>";
			coursetb+="<th class='col-sm-1'>Finish Date</th>";
			coursetb+="<th class='col-sm-1'>Action</th>";
			coursetb+="<th class='col-sm-1'>Status</th>";
			coursetb+="</tr>";
			coursetb+="</thead style='text-align:center'>";
			coursetb+="<tbody>";
			for(var i=0;i<data.length;i++){
				coursetb+="<tr class='' style='cursor:auto;color:#616161;' id='"+data[i].id+"'>";
				coursetb+="<td>C-"+data[i].id+"</td>";
				coursetb+="<td>"+data[i].course_type+"</td>";
				coursetb+="<td>"+data[i].g_name+"</td>";
				coursetb+="<td>"+data[i].startdate+"</td>";
				coursetb+="<td>"+data[i].enddate+"</td>";
				coursetb+="<td>";
				if(data[i].g_status==0){
					
					coursetb+="";	
				}else{
					
					coursetb+="<button class='btn btnmystyle btn-success btnedit' onclick='getUpdateCourse("+data[i].id+")' type='button'><span class='glyphicon glyphicon-pencil'></span></button>";

				}
				coursetb+="&nbsp;&nbsp;<button onclick='getViewCourse("+data[i].id+")' class='btn btnmystyle btn-primary btnview' type='button' data-toggle='modal' data-target='#myModal'><span class='glyphicon glyphicon-eye-open'></span></button></td>";
				if(data[i].g_status==0){
					coursetb+="<td></td>";
				}else{
					if(data[i].status==0){
						coursetb+="<td><img class='statusimg' src='images/uncheck.png'  onclick='updateStatus("+data[i].id+",1)' /></td>";
					}else{
						coursetb+="<td><img class='statusimg' src='images/check.png'  onclick='updateStatus("+data[i].id+",0)' /></td>";
					}
					
				}
				coursetb+="</tr>";
			}
			
			coursetb+="</tbody>";
			coursetb+="</table>";
			
			$("#showcourse").html(coursetb);
			invokeDataTable();
		}
		function updateStatus(id,status){
			
			$.ajax({
				url : "adminupdatecoustatus",
				type : "POST",
				data:{
					couid:id,
					coustatus:status
				},
				success:function(data){
					adminListCourse();
				}
			});
		}
		function getViewCourse(id){
			$.ajax({
				url : "admingetupdatecourse",
				type : "POST",
				data:{
					courseid:id
				},
				success:function(data){
					
				    $("#coursedetail").html(data.course_type+" , "+data.g_name);
					$("#popstartdate").val(data.startdate);
					$("#popenddate").val(data.enddate);
					$("#coursedes").val(data.description);
				}
			});
		}
		function addCourse(){
			
			if( $("#coursename").val()=="" || $("#generation").val()=="" || $("#startdate").val()=="" || $("#enddate").val()==""){
				swal("Error!", "Please fill out course information", "error");
				return;
			}
			$.ajax({
				url:"adminaddcourse",
				type:"POST",
				data:{
					coursename: $("#coursename").val(),
					generation: $("#generation").val(),
					startdate : $("#startdate").val(),
					enddate:$("#enddate").val(),
					coursedescription:$("#coursedescription").val()
				},
				success:function(data){
					if(data==true){
						swal("Course has been added", "", "success");
						adminListCourse();
						clearValue();
					}else{
						swal("Error!", "", "error");
					}
					
				}
			});
		}
		function clearValue(){
			$("#coursename").val("");
		    $("#generation").val("");
			$("#startdate").val("");
			$("#enddate").val("");
			$("#coursedescription").val("");
		}
		function editCourse(id){
			
			if($("#generation").val()=="" || $("#generation").val()==null ){
				swal("Error", "Geration can't be null", "error");
				return;
			}
			$.ajax({
				url:"adminupdatecourse",
				type:"POST",
				data:{
					courseid:id,
					coursename: $("#coursename").val(),
					generation: $("#generation").val(),
					startdate : $("#startdate").val(),
					enddate:$("#enddate").val(),
					coursedescription:$("#coursedescription").val()
				},
				success:function(data){
					if(data==true){
						swal("Information has been updated", "", "success");
						adminListCourse();
						clearValue();
						$("#btnsave").html("<b class='boldstyle'><i class='fa fa-plus'></i>S</b>ave");
						$("#btnsave").attr("onclick","addCourse()");
					}else{
						swal("Error", "", "error");
					}
					
				}
			});
		}
		function getUpdateCourse(id){
			$.ajax({
				url : "admingetupdatecourse",
				type : "POST",
				data:{
					courseid:id
				},
				success:function(data){
					
				    $("#coursename").val(data.course_type);
					$("#generation").val(data.g_id.toString());
				    $("#startdate").val(data.startdate);
					$("#enddate").val(data.enddate);
					$("#coursedescription").val(data.description);
					$("#btnsave").html("<b  class='boldstyle'><i class='fa fa-pencil'></i>E</b>dit");
					$("#btnsave").attr("onclick","editCourse("+id+")");
				}
			});
		}
		
		function invokeDataTable(){
			$('#myTable').DataTable();
		}
	</script>
	<script>
		$(document).ready(function() {
			
		});
	</script>
	<script
		src="plugin/Zebra_Datepicker-master/public/javascript/zebra_datepicker.js"></script>
	<script>
		$(document).ready(function() {

			// assuming the controls you want to attach the plugin to 
			// have the "datepicker" class set
			$('input.datepicker').Zebra_DatePicker();

		});
	</script>
	<script>
		
	</script>
</body>
</html>