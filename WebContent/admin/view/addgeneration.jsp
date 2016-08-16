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

<link rel="icon" href="images/hrdlogo.png" type="image/png" >

<title>Generation</title>
<link rel="stylesheet" type="text/css"
	href="plugin/sweetalert/sweetalert.css">
<script src="js/jquery.js"></script>

<script src="bootstrape/js/bootstrap.min.js"></script>


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
	cursor: pointer;
	width: 30px;
	hegith: 30px;
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
				
				<form role="form" data-toggle="validator" role="form" id='myform' >
					<div class="col-sm-12" >
						<fieldset>
							
							<div class="col-sm-12">
								<legend>
									<h3>
										<i class="fa fa-pencil"></i><b>Generation </b><font size="4">Management</font> 
										
									</h3>
								</legend>
							</div>
							<div class="form-group">
								<!--form input student's detail-->
								<div class="col-sm-12">
									<div class="col-sm-12">

										<p class="col-sm-2 mylabel" style="margin-top: 15px;">Generation
										<p>
										<div class="col-sm-10 form-group">
											<div class="formbox-style"><input class="form-control txttext" type="text"
												id="generationname"  name="cid"
												placeholder="Enter Generation's Name (Example: 1st Generation)" />
											</div>
											
										</div>




										
									</div>
									<div class="col-sm-12">
										<p class="col-sm-2 mylabel" style="margin-top: 15px;">Start
										<p>
										<div class="col-sm-4 form-group" >
											<input class="form-control txttext datepicker" type="text"
												id="orientation"  name="cname"
												placeholder="" />
										</div>
										
										<p class="col-sm-2 mylabel" style="margin-top: 4px;">Finish
										<p>
										<div class="col-sm-4 form-group">
											<input class="form-control txttext  datepicker" type="text"
												id="finish"  name="cname"
												placeholder="" />
										</div>
										
									</div>
									<div class="col-sm-12">
										<p class="col-sm-2 mylabel form-group" style="margin-top: 15px;">
											Description :
										<p>
										<div class="col-sm-10">
											<textarea class="form-control txttext" id="gendescription"
												name="listadd" 
												placeholder="( some info)"></textarea>
										</div>
										
									</div>

									<div class="col-sm-12" style="margin-top: 20px;">
										<div class="col-sm-8"></div>
										<div class="col-sm-4">
											<div class="col-sm-12" >
												<Button type="button" onclick="adminAddGeneration()" id="btnsave"
													class=" navbar-right btn btn-primary  btnownstyle "
													 ><b class="boldstyle"><i
												class="fa fa-plus"></i>S</b>ave</Button>
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
											<i class="fa fa-list-alt"></i><i>List of Generation</i>
										</h4>
										
									</legend>
									</div>
								</div>

			
								
								<div id="displaylistgeneration">
								
								</div>
								

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
					<h3 class="modal-title" style="font-weight:bold; font-style:italic"  ><i class=" fa fa-globe"></i>Generation Detail<span id="month"> </span></h3>
				</div>
				<div class="" >
					<!--form input student's detail-->
					<div class="col-sm-12"
						style="margin-top: 20px; padding-bottom: 50px;">
						<div class="col-sm-12">
								<h4 class="col-sm-12 mylabel"
									style="margin-top: 15px; text-align: center">
									<span id="gendetail" ></span> 
								</h4>
							</div>
							<div class="col-sm-12">
								<p class="col-sm-2 mylabel" style="margin-top: 15px;">From :
								
								<p>
								
								<div class="col-sm-4 form-group">
									<input class="form-control txttext " type="text" id="popuporientation"
										 name="cid" />
								</div>
								<p class="col-sm-1 mylabel" style="margin-top: 4px;">To:
								<p>
								<div class="col-sm-4 form-group" >
									<input class="form-control txttext " type="text" id="popupfinish"
									name="cid" />
								</div>




							</div>
							<div class="col-sm-12">
								<p class="col-sm-2 mylabel" style="margin-top: 15px;">
									Description :
								<p>
								<div class="col-sm-9 form-group">
									<textarea class="form-control txttext"
										name="popupdescription" id="popupdescription"
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

	
	<script src="plugin/Zebra_Datepicker-master/public/javascript/zebra_datepicker.js"></script>
	<script src="js/validator.js"></script>
	<script src="plugin/sweetalert/sweetalert.min.js"></script>
	<script
		src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
	<script>
	
		listGeneration();
		function adminAddGeneration(){
		
			if($("#generationname").val()=="" || 	$("#orientation").val()=="" ||   $("#finish").val()==""){
				swal("Error!", "Please fill out generation inforamtion", "error");
				return;
			}
			$.ajax({
				url:"adminaddgeneration",
				type:"POST",
				data:{
					generationname:$("#generationname").val(),
					orientation:$("#orientation").val(),
					finish:$("#finish").val(),
					gendescription:$("#gendescription").val()
				},
				success:function(data){
					if(data==true){
						listGeneration();
						clearValue();
						swal("Generation has been added!", "", "success");
					}
					else{
						swal("Error!", "", "error");
					}
					
				}
			});
		}
		function listGeneration(){
			$.ajax({
				url:"adminlistgeneration",
				type:"POST",
				success:function(data){
					listGenerationTable(data);
				}
			});
		}
		
		function listGenerationTable(data){
			var generations="<table class='display' id='myTable' cellspacing='0' width='100%''>";
			generations+="<thead>";
			generations+="<tr>";
			generations+="<th class='col-sm-1'>ID</th>";
			generations+="<th class='col-sm-1'>Generation Name</th>";
			generations+="<th class='col-sm-1'>Orientation Date</th>";
			generations+="<th class='col-sm-1'>Finish Date</th>";
			generations+="<th class='col-sm-1'>Action</th>";
			generations+="<th class='col-sm-1'>Status</th>";
			generations+="</tr>";
			generations+="</thead>";
			generations+="<tbody>"; 
		
			//var rightnow = new Date();
			
		
			for(var i=0;i<data.length;i++){
				generations+="<tr  style='cursor:auto;color:#616161;' id='"+data[i].id+"'>";
				generations+="<td >G-"+data[i].id+"</td>";
				generations+="<td>"+data[i].name+"</td>";
				generations+="<td>"+data[i].orient_date+"</td>";
				
				//var backthen = new Date(data[i].finish_date);
				 
				generations+="<td>"+data[i].finish_date+"</td>";
				generations+="<td><button onclick='getUpdateGeneration("+data[i].id+")' class='btnmystyle btn btn-success btnedit' type='button'> <span class='glyphicon glyphicon-pencil'></span></button>";
				generations+="&nbsp;&nbsp;<button class='btnmystyle btn btn-primary btnview' onclick='getViewGeneration("+data[i].id+")' type='button' data-toggle='modal' data-target='#myModal'>";
				generations+="<span class='glyphicon glyphicon-eye-open'></span>";
				generations+="</button></td>";
				if(data[i].status==0){
					generations+="<td><img class='statusimg' src='images/uncheck.png' onclick='updateStatus("+data[i].id+",1)' ></td>";
				}else{
					generations+="<td><img class='statusimg' src='images/check.png' onclick='updateStatus("+data[i].id+",0)' ></td>";
				}
			
				
				generations+="</tr>";
			}
			generations+="</tbody>";
			generations+="</table>";
			$("#displaylistgeneration").html(generations);
			
			invokeDataTable();
		}
		
		
		function editGeneration(id){
			if($("#generationname").val()=="" || 	$("#orientation").val()=="" ||   $("#finish").val()==""){
				swal("Error!", "Please fill out generation inforamtion", "error");
				return;
			}
			$.ajax({
				url:"adminupdategeneration",
				type:"POST",
				data:{
					genid:id,
					generationname:$("#generationname").val(),
					orientation:$("#orientation").val(),
					finish:$("#finish").val(),
					gendescription:$("#gendescription").val()
				},
				success:function(data){
					if(data==true){
						listGeneration();
						clearValue();
						$("#btnsave").html("<b class='boldstyle'><i class='fa fa-plus'></i>S</b>ave");
						$("#btnsave").attr("onclick","adminAddGeneration()");
						swal("Information has been updated!", "", "success");
					}
					else{
						swal("Update failed!", "", "error");
					}
				}
			});
		}
		/* function addStyle(id){

			$("tr").css("background","none");
			$("#"+id).css("background","#DCEDC8");
			$("#"+id).css("transition","all 0.2s linear");
		
		} */
		function clearValue(){
			$("#generationname").val("");
			$("#orientation").val("");
		    $("#finish").val("");
			$("#gendescription").val("");
		}
		function getUpdateGeneration(id){
			$.ajax({
				url : "admingetupdategeneration",
				type : "POST",
				data:{
					generationid:id,
				},
				success:function(data){
				
					$("#generationname").val(data.name);
					$("#orientation").val(data.orient_date);
				    $("#finish").val(data.finish_date);
					$("#gendescription").val(data.description);
					$("#btnsave").html("<b  class='boldstyle'><i class='fa fa-pencil'></i>E</b>dit");
					$("#btnsave").attr("onclick","editGeneration("+id+")");
				}
			});
		}
		
		function getViewGeneration(id){
			$.ajax({
				url : "admingetupdategeneration",
				type : "POST",
				data:{
					generationid:id,
				},
				success:function(data){
					$("#gendetail").html(data.name),
					$("#popuporientation").val(data.orient_date),
				    $("#popupfinish").val(data.finish_date),
					$("#popupdescription").val(data.description)
				}
			});
		}
		function updateStatus(id,status){
			
			$.ajax({
				url : "adminupdategenstatus",
				type : "POST",
				data:{
					generationid:id,
					genstatus:status
				},
				success:function(data){
					listGeneration();
				}
			});
		}
		function invokeDataTable(){
			$('#myTable').DataTable();
		}
		
		$(document).ready(function() {
	
		});
	</script>
	
	<script>
	
		$(document).ready(function() {

			// assuming the controls you want to attach the plugin to 
			// have the "datepicker" class set
			$('input.datepicker').Zebra_DatePicker();

		});
	</script>

	<script>
		
	</script>


	<script>
		$('#myform').validator();
		$('#myform').validator().on('submit', function(e) {
			if (e.isDefaultPrevented()) {
				// handle the invalid form...
			} else {
				// everything looks good!
			}
		})
	</script>
	<script>
		$("#clname").datepicker({
			dateFormat : "mm/dd/yyyy"
		})
	</script>

</body>
</html>


