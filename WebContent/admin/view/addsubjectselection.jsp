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
<link rel="stylesheet" href="plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="plugin/sweetalert/sweetalert.css">
	
   <link rel="icon" href="images/hrdlogo.png" type="image/png" >
   
<script src="js/jquery.js"></script>
<script src="bootstrape/js/bootstrap.min.js"></script>

<title>Add Selection | HRD</title>

<style>
 .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
  .toggle.ios .toggle-handle { border-radius: 20px; }
</style>
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
							<div class="col-sm-12" >
								<legend>
									<h3 >
										<i class="fa fa-pencil"></i><b>Subject </b><font size="4">Connection</font>
									</h3>
								</legend>
							</div>
							<div class="form-group">
								<!--form input student's detail-->
								<div class="col-sm-12">
									<div class="col-sm-4">
									
										
											<p class="col-sm-12 mylabel" style="">Subject's
												Name :
											<p>
											<div class="col-sm-10 form-group">
												<select id="subject" name="subject" style="margin-top: -2px;" class="form-control txttext combo"   >
													
											    </select>
											   
											</div>
											<div class="col-sm-1"><div class="row">
												<button class='btn btnmystyle btn-primary' onclick="linktoaddsub();" style="height:30px;" type='button'>
													<span class='glyphicon glyphicon-plus'></span>
												</button>
											</div></div>
									
										
									</div>
									
									
									<div class="col-sm-4">
										<p class="col-sm-12 mylabel" style="">Instrutors :
										</p>
										<div class="col-sm-12 form-group" style="margin-top: 4px;">
											<select name="instructors" id="instructors" class="form-control txttext combo" style="margin-top: -5px;" >
									
							   				 </select>
										</div>
									</div>
									
									<div class="col-sm-4">
										<p class="col-sm-12 mylabel" style="">Class
										<p>
										<div class="col-sm-12 form-group">
											<select name="classlist" id="classlist" style="margin-top: -2px;" class="form-control txttext combo"   >
											
										    </select>
										</div>
										
									</div>
									
									
								
									
								

									<div class="col-sm-12" style="margin-top: 5px;">
										<div class="col-sm-8"></div>
										<div class="col-sm-4">
											<div class="col-sm-12">
												<button type="button" onclick="insertSubjectSelection();" id="btnsave"
													class=" navbar-right btn btn-primary  btnownstyle "
													  ><b class="boldstyle"><i class='fa fa-plus'></i>S</b>ave</button>
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
											<i class="fa fa-list-alt"></i><i>List of Selections</i>
										</h4>
									</legend>
								</div>
							</div>

							<div id="subselectiontb"></div>

						</fieldset>
					</div>
				</form>
				</div>
			</div>
			<!--end table  -->
		</div>
	 </div>
</div>
	    <script src="plugin/sweetalert/sweetalert.min.js"></script>
		<script
			src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
		<script>
			getSubjectName();
			getClassName();
			getInstructorName();
			getListSubjectSelection();
			function linktoaddsub(){
				location.href='addsubject.jsp';
				
			}
			function getSubjectName(){
				$.ajax({
					url: "admingetsubjectname",
					type:"POST",
					success:function(data){
						var optionall=$("<option></optoin>");
	    				optionall.append("----SELECT SUBJECT-----");
	    				optionall.attr("value","");
	    				$("#subject").append(optionall);
	    				for(var i=0;i<data.length;i++){
	    					var option=$("<option></optoin>");
	    					option.append(data[i].subject_name);
	    					option.attr("value",data[i].subject_id);
	    					$("#subject").append(option);
	    				}
					}
					
				});
			}
			function getClassName(){
				$.ajax({
					url: "admingetclassname",
					type:"POST",
					success:function(data){
						var optionall=$("<option></optoin>");
	    				optionall.append("----SELECT CLASS-----");
	    				optionall.attr("value","");
	    				$("#classlist").append(optionall);
	    				for(var i=0;i<data.length;i++){
	    					var option=$("<option></optoin>");
	    					option.append(data[i].name+"("+data[i].course_name+" , "+data[i].generation+")");
	    					option.attr("value",data[i].id);
	    					$("#classlist").append(option);
	    				}
					}
					
				});
			}
			function getInstructorName(){
				$.ajax({
					url: "admingetinstructorname",
					type:"POST",
					success:function(data){
						var optionall=$("<option></optoin>");
	    				optionall.append("----SELECT INSTRUCTOR-----");
	    				optionall.attr("value","");
	    				$("#instructors").append(optionall);
	    				for(var i=0;i<data.length;i++){
	    					var option=$("<option></optoin>");
	    					option.append(data[i].name);
	    					option.attr("value",data[i].id);
	    					$("#instructors").append(option);
	    				}
					}
					
				});
			}
			function getListSubjectSelection(){
				$.ajax({
					url: "adminlistsubjectselection",
					type:"POST",
					success:function(data){
						
						$("#subselectiontb").html(tbSubject(data));
						invokeDataTable();
					}
					
				});
			}
			function tbSubject(data){
				var table="<table class='display' id='myTable'  cellspacing='0' width='100%'>";
				table+="<thead style='text-align:center'>";
				table+="<tr >";
				table+="<th class='col-sm-1'>ID</th>";
				table+="<th class='col-sm-1'>Subject</th>";
				table+="<th class='col-sm-1'>Instructor</th>";
				table+="<th class='col-sm-1'>class</th>";
				table+="<th class='col-sm-1'>Course</th>";
				table+="<th class='col-sm-1'>Generation</th>";		
				table+="<th class='col-sm-1'>create-date</th>";
				table+="<th class='col-sm-1'>action</th>";
				table+="</tr>";
				table+="</thead style='text-align:center'>";
				table+="<tbody>";
				for(var i=0;i<data.length;i++){
					table+="<tr style='cursor:auto;color:#616161;' id=''>";
					table+="<td>S-"+data[i].id+"</td>";
					if(data[i].subject_status==0){
						table+="<td style='color:red;'><strike>"+data[i].name+"</strike></td>";
					}else{
						table+="<td>"+data[i].name+"</td>";
					}
					table+="<td>"+data[i].staff_name+"</td>";
					table+="<td>"+data[i].class_name+"</td>";
					table+="<td>"+data[i].course+"</td>";
					table+="<td>"+data[i].generation+"</td>";
					
					table+="<td>"+data[i].c_date+"</td>";
					table+="<td ><button onclick='getEditSubSelection("+data[i].id+")' class='btnmystyle btn btn-success btnedit' type='button'><span class='glyphicon glyphicon-pencil'></span></button> 	";
					table+="<button onclick='deleteSubSelection("+data[i].id+")' class='btnmystyle btn btn-danger btnedit' type='button'><span class='glyphicon glyphicon-trash'></span></button></td></tr>";
				}
				
				table+="</tbody>";
				table+="</table>";
				return table;
			}
			function deleteSubSelection(id){
				swal({   title: "Are you sure?",  
					text: "You will not be able to recover this data!",   
					type: "warning",   showCancelButton: true,   
					confirmButtonColor: "#DD6B55",   
					confirmButtonText: "Yes, delete it!",   
					closeOnConfirm: false }, 
					function(){   
						$.ajax({
							url : "admindeletesubselect",
							type : "POST",
							data:{
								subselectid:id
							},
							success:function(data){
								if(data==true){
									getListSubjectSelection();
									swal("Deleted!", "Your data has been deleted.", "success");
								}else{
									swal("Error", "", "error");
								}
							}
						});
					 });
			}
			function getEditSubSelection(id){
				$.ajax({
					url : "admingetupdatesubselect",
					type : "POST",
					data:{
						subselectid:id,
					},
					success:function(data){
						$("#subject").val(data.sub_id);
						if($("#subject").val()=="" || $("#subject").val()==null){
							$("#subject").val("");
						}
						$("#classlist").val(data.class_id);
						$("#instructors").val(data.staff_id);
						$("#btnsave").html("<b  class='boldstyle'><i class='fa fa-pencil'></i>E</b>dit");
						$("#btnsave").attr("onclick","editSubSelection("+id+")");
					}
				});
			}
			function editSubSelection(id){
				if($("#classlist").val()=="" || $("#classlist").val()==null){
					alert(123);
					return;
				}
				
				$.ajax({
					url: "adminupdatesubselection",
					type:"POST",
					data:{
						subselectid:id,
						subject:$("#subject").val(),
						classlist:$("#classlist").val(),
						instructors:$("#instructors").val()
					},
					success:function(data){
						if(data==true){
							getListSubjectSelection();
							$("#btnsave").html("<b class='boldstyle'><i class='fa fa-plus'></i>S</b>ave");
							$("#btnsave").attr("onclick","insertSubjectSelection()");
							swal("Subject Selection has been updated successfully", "", "success");
						}else{
							swal("Subject has already been modified", "", "error");
						}
						
					}
					
				});
			}
			function invokeDataTable(){
				$('#myTable').DataTable();
			}
			function insertSubjectSelection(){
				
				$.ajax({
					url: "admininsertsubselection",
					type:"POST",
					data:{
						subject:$("#subject").val(),
						classlist:$("#classlist").val(),
						instructors:$("#instructors").val()
					},
					success:function(data){
						
						if(data==true){
							getListSubjectSelection();
							swal("Subject Selection has been added successfully", "", "success");
							
						}else{
							swal("Subject has already been modified", "", "error");
						}
						
					}
					
				});
			}
			
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
		$(".btn-delete").click(function(){
			
			 swal("Status has been changened", "DONE!", "success"); 
			
		})</script>
</body>
</html>