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


<title>Addsubject</title>

<style>
 .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
  .toggle.ios .toggle-handle { border-radius: 20px; }
  img.statusimg{
	width: 30px;
	hegith: 30px;
	cursor: pointer;
}
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
					<div class="col-sm-12" style="margin-top:15px;">
						<fieldset>
							<div class="col-sm-12" >
							<a href="addsubjectselection.jsp" class=" navbar-left btn btn-primary  btnownstyle"><i class="fa fa-undo"></i>Back</a>
							</div>
							<div class="col-sm-12" >
								<legend>
									<h3 >
										<i class="fa fa-pencil"></i><b>Subject </b><font size="4">Management</font>
									</h3>
								</legend>
							</div>
							<div class="form-group">
								<!--form input student's detail-->
								<div class="col-sm-12">
									<div class="col-sm-12">
										<p class="col-sm-2 mylabel" style="margin-top: 15px;">Subject
										<p>
										<div class="col-sm-4 form-group">
											<input class="form-control txttext" type="text" id="subjectname"
												 name="cid"
												placeholder="Enter Subject's Name" />
										</div>
										<p class="col-sm-2 mylabel" style="margin-top: 10px;">Percentage 
										<p>
										<div class="col-sm-4 form-group">
											
											<select name="subpercent" class="  form-control combo txttext"  id="subpercent" >
												<option value="">---SELECT PERCENTAGE---</option>
												<option value="15">15%</option>
												<option value="20">20%</option>
												<option value="25">25%</option>
												<option value="30">30%</option>
												<option value="35">35%</option>
												<option value="45">45%</option>
												<option value="50">50%</option>
												
										    </select>
											
										</div>
										
									</div>
									
									<div class="col-sm-12">
										<p class="col-sm-2 mylabel" style="margin-top: 10px;">Create 
										<p>
										<div class="col-sm-10 form-group">
											
											<input class="form-control txttext  datepicker" type="text"
												id="createdate"  name="cname"
												placeholder="" />
											
										</div>
									</div>
									<div class="col-sm-12">
										<p class="col-sm-2 mylabel" style="margin-top: 15px;">
											Description 
										<p>
										<div class="col-sm-10 form-group">
											<textarea class="form-control txttext" id="subdescription"
												name="listadd" 
												placeholder="( some info)"></textarea>
										</div>
										
									</div>

									<div class="col-sm-12">
										<div class="col-sm-8"></div>
										<div class="col-sm-4">
											<div class="col-sm-12">
												<button type="button" onclick="addSubject()" id="btnsave"
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
								<legend>
									<h4>
										<i class="fa fa-list-alt"></i>List of Subjects
									</h4>
								</legend>
							</div>
							<div id="listsubject"></div>
							

						</fieldset>
					</div>
				</form>
				</div>
			</div>
			<!--end table  -->
			</div>
		</div>
	</div>
		<script src="plugin/Zebra_Datepicker-master/public/javascript/zebra_datepicker.js"></script>
		<script src="plugin/sweetalert/sweetalert.min.js"></script>
		<script
			src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
		<script>
			getCurrentDate();
			listSubject();
			$(document).ready(function() {
				
				$('input.datepicker').Zebra_DatePicker();
			});
			function listSubject(){
				$.ajax({
					url : "admingetlistsubject",
					type :"POST",
					success:function(data){
						
						var table="<table class='display' id='myTable'  cellspacing='0' width='100%'>";
						table+="<thead style='text-align:center'>";
						table+="<tr>";
						table+="<th class='col-sm-1'>Subject_ID</th>";
						table+="<th class='col-sm-1'>Subject</th>";
						table+="<th class='col-sm-1'>create-date</th>";
						table+="<th class='col-sm-1'>Score-Percentage</th>";
						table+="<th class='col-sm-1'>Action</th>";
						table+="<th class='col-sm-1'>Status</th>";
						table+="</tr>";
						table+="</thead style='text-align:center'>";
						table+="<tbody>";
						for(var i=0;i<data.length;i++){
							table+="<tr style='cursor:auto;color:#616161;' id=''>";
							table+="<td>"+data[i].subject_id+"</td>";
							table+="<td>"+data[i].subject_name+"</td>";
							table+="<td>"+data[i].creat_date+"</td>";
							table+="<td>"+data[i].sub_percent+"%</td>";
							table+="<td><button  class='btnmystyle btn btn-success btnedit' type='button' onclick=getEditSubject('"+data[i].subject_id+"') > <span class='glyphicon glyphicon-pencil'></span></button></td>";
							if(data[i].status==0 || data[i].status=="0"){
								table+="<td><img class='statusimg' src='images/uncheck.png' onclick=editSubjectStatus('"+data[i].subject_id+"',1)></td>	";
							}else{
								table+="<td><img class='statusimg' src='images/check.png' onclick=editSubjectStatus('"+data[i].subject_id+"',0) ></td>	";
							}
							
							table+="</tr>";
						}
						
						table+="</tbody>";
						table+="</table>";	

					
					
						$("#listsubject").html(table);
						invokeDataTable();
					}
					
				});
			}
			function getEditSubject(id){
				$.ajax({
					url : "admingeteditsubject",
					type : "POST",
					data:{
						subjectid:id,
					},
					success:function(data){
						
						$("#subjectname").val(data.subject_name);
						$("#createdate").val(data.creat_date);
						$("#subdescription").val(data.description);
						$("#subpercent").val(data.sub_percent);
						$("#btnsave").html("<b  class='boldstyle'><i class='fa fa-pencil'></i>E</b>dit");
						$("#btnsave").attr("onclick","editSubject('"+id+"')");
					}
				});
			}
			function editSubject(id){
				
				$.ajax({
					url: "adminupdatesubject",
					type:"POST",
					data:{
						subjectid:id,
						subjectname:$("#subjectname").val(),
						createdate:$("#createdate").val(),
						subdescription:$("#subdescription").val(),
						subpercent:$("#subpercent").val()
					},
					success:function(data){
						
						if(data==true){
							swal("Subject has been updated", "", "success");
							clearValue();
							listSubject();
							$("#btnsave").html("<b class='boldstyle'><i class='fa fa-plus'></i>S</b>ave");
							
							$("#btnsave").attr("onclick","addSubject()");
						}else{
							swal("Error", "", "error");
						}
						
					}
					
				});
			}
			function clearValue(){
				$("#subjectname").val("");
				getCurrentDate();
				$("#subdescription").val("");
			}
			function editSubjectStatus(id,status){
								$.ajax({
					url: "adminupdatesubjectstatus",
					type:"POST",
					data:{
						subjectid:id,
						status:status
					},
					success:function(data){
					
						if(data==true){
							listSubject();
						}else{
							
						}
						
					}
					
				});
				
			}
			function addSubject(){
				$.ajax({
					url:"adminaddsubject",
					type:"POST",
					data:{
						subjectname:$("#subjectname").val(),
						createdate:$("#createdate").val(),
						subdescription:$("#subdescription").val(),
						subpercent:$("#subpercent").val()
					},
					success:function(data){
						
						if(data==true){
							listSubject();
							swal("Subject has been added!", "", "success");
							clearValue();
						}else{
							swal("Error!", "", "fail")
						}
						
						//clearValue();
					}
				});
			}
			function invokeDataTable(){
				$('#myTable').DataTable();
			}
			function getCurrentDate(){
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth()+1; //January is 0!
				var yyyy = today.getFullYear();

				if(dd<10) {
				    dd='0'+dd
				} 

				if(mm<10) {
				    mm='0'+mm
				} 

				today = mm+'/'+dd+'/'+yyyy;
				$("#createdate").val(today);
				
			}
		</script>
		
		
		<script>
		$("#clname").datepicker({
			dateFormat : "mm/dd/yyyy"
		})
	</script>
</body>
</html>