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
	<title>Attendance</title>
  
  	<script src="js/jquery.js"></script>
  	<script src="bootstrape/js/bootstrap.min.js"></script>
 	 <!--color picker-->
 	
  	
 	 
	<style>
		div.mybox{
			border-radius:0;
		}
		.bcolor{
		width: 70px;
		height: 70px;
		margin-top:5px;
		border:2px solid black;
		}
		img.circle{
		width: 35px;
		height: 35px;
		
	}
	.scorestyle{
color:white;
border-radius:3px;
padding:2px 10px 2px 10px;
font-weight:bold;
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
			<div class="col-sm-12 style-wrapper" >
			<div class="row">
						<form role="form" class="form form-validate" novalidate="novalidate">
							<div class="col-sm-12" >
								<fieldset>
									<div class="col-sm-12" >
										<legend><h3><i class="fa fa-pie-chart"></i><b>Attendance</b> <font size="4">Management</font></h3></legend>
									</div>
									<div class="col-sm-12">
											<a href="addattendance.jsp"
												class="navbar-left btn btn-primary  btnownstyle"><i
												class="fa fa-plus"></i><b class="boldstyle">A</b>dd <b class="boldstyle">A</b>ttendance</a>
											
											<button onclick="printAttList()" style="margin-left: 5px;" type="button" class="btn btn-primary btnstyle"><img class='iconimage' src="images/pdf.png"/>&nbsp;&nbsp;<b class="boldstyle">P</b>rint</button>
											
											
									</div>
									
									<div class="col-sm-12" style="margin-top:10px;">
										<div class="row">
											<p class="col-sm-1 mylabel" style="margin-top: 15px;">Start
											<p>
											<div class="col-sm-4 form-group" >
												<input class="form-control txttext datepicker" type="text"
													id="startdate"  name="cname"
													placeholder="" />
											</div>
											
											<p class="col-sm-1 mylabel" style="margin-top: 4px;">To
											<p>
											<div class="col-sm-4 form-group">
												<input class="form-control txttext  datepicker" type="text"
													id="todate"  name="cname"
													placeholder="" />
											</div>
											<div class="col-sm-2">
												<div class="col-sm-12">
												<button style="margin-left: 5px;" type="button" onclick="listAttendanceStudent()"  style="color:white;" class="btn btnownstyle navbar-right  btn-primary" ><b class="boldstyle"><i class="fa fa-check"></i>C</b>heck <b class="boldstyle">L</b>ist</button>
											
											</div>
											</div>
										</div>
									</div>
									
									<div class="col-sm-12">
									
										<div class="attendanceresult" id="attendanceresult">
											
										</div>
									
									</div>
								</fieldset>
							</div>
						</form> 
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
					<h3 class="modal-title" style="font-weight:bold; font-style:italic"  ><i class="fa fa-pie-chart"></i>Attendant Details<span id="month"> </span></h3>
				</div>
				<div class="" >
					<!--form input student's detail-->
					<div class="col-sm-12"
						style="margin-top: 20px; padding-bottom: 50px;">
						<div class="col-sm-12">
							<div class="col-sm-4" id='imgatt'>
								
							</div>
							<div class="col-sm-8" >
								<div id='stuname'></div>
								<p class='mylabel'>Gender : <span id='stugender'>Male</span></p>
								<p class='mylabel'>Class : <span id='stuclass'>Siem Reap</span></p>
								
							</div>
						</div>
						<div class="col-sm-12" style="margin-top:12px;">
							<fieldset>
								<legend>
									<h4 class="mylabel">
										<i class="fa fa-pencil"></i><b style="boldstyle">Attendant </b><font size="3">Description (Start: <b><span id='start'></span></b> To: <b><span id='to'></span></b>) </font>
									</h4>
								</legend>
							</fieldset>
							<div class="listattdetail" id="listattdetail">
								
							
							</div>
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
 	<script src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
 	
 	<script>
 	getMinusDate();
 	getCurrentDate();
 	listAttendanceStudent();
 	function printAttList(){
 		var start=$("#startdate").val();
 		var end=$("#todate").val();
 		window.open("getatt?start="+start+"&end="+end,"_blank");
 	}
 	function listAttendanceStudent(){
 		$.ajax({
 			url : "getlistattendance",
 			type : "POST",
 			data:{
 				startdate:$("#startdate").val(),
 				todate:$("#todate").val()
 			},
 			success:function(data){
 				
 				$("#attendanceresult").html(listAttTable(data));
 				invokeDataTable();
 			}
 			
 			
 		});
 	}
 	function listAttTable(data){
 		
 	
 		var tbattendance="<table class='display' id='myTable' cellspacing='0' width='100%'>";
 		tbattendance+="<thead>";
 		tbattendance+="<tr>";
 		tbattendance+="<th class='col-sm-1'>ID</th>";
 		tbattendance+="<th class='col-sm-1'>Image</th>";
 		tbattendance+="<th class='col-sm-1'>Name</th>";
 		tbattendance+="<th class='col-sm-1'>Gender</th>";
 		tbattendance+="<th class='col-sm-1'>Class</th>";
 	
 		tbattendance+="<th class='col-sm-1'>Late</th>";
 		tbattendance+="<th class='col-sm-1'>Permission</th>";
 		tbattendance+="<th class='col-sm-1'>Absence</th>";
 		//tbattendance+="<th class='col-sm-1'>Action</th>";
 		tbattendance+="</tr>";
 		tbattendance+="</thead>";
 		tbattendance+="<tbody>";
 		for(var i=0;i<data.length;i++){
 			tbattendance+="<tr   onclick=getstudentatt('"+data[i].stu_id.trim()+"')  class='myrow' data-toggle='modal' data-target='#myModal'>";
 	 		tbattendance+="<td>"+data[i].stu_id+"</td>";
 	 		tbattendance+="<td><img src='../../imgprofiles/"+data[i].profilesrc+"' class='img-circle circle'/></td>";
 	 		tbattendance+="<td>"+data[i].student_name+"</td>";
 	 		tbattendance+="<td>"+checkGender(data[i].studentgeneder)+"</td>";
 	 		tbattendance+="<td>"+data[i].class_name+"</td>";
 	 	
 	 		tbattendance+="<td>"+attendanceLate(data[i].late)+"</td>";
 	 		tbattendance+="<td>"+attendancePermission(data[i].permission)+"</td>";
 	 		tbattendance+="<td>"+attendanceAbsent(data[i].absent)+"</td>";
 	 	//	tbattendance+="<td><button onclick=getstudentatt('"+data[i].stu_id.trim()+"') class='btn btn-primary btnedit' type='button'  data-toggle='modal' data-target='#myModal'> <span class='glyphicon glyphicon-eye-open'></span></button></td>";
 	 		tbattendance+="</tr>";
 		}
 		tbattendance+="	</tbody>";
 		tbattendance+="</table>";
		return tbattendance;
	
 	}
 	function getstudentatt(id){
 		
 		$.ajax({
 			url : "getspecificattdetail",
 			type: "POST",
 			data:{
 				id : id,
 				startdate:$("#startdate").val(),
 				todate:$("#todate").val()
 			},
 			success:function(data){
 				$("#start").html($("#startdate").val());
 				$("#to").html($("#todate").val());
 				$("#imgatt").html("<img id='imgatt' src='../../imgprofiles/"+data[0].profilesrc+"' style='width: 120px;height: 120px;border-radius:100%;'/>");
 				$("#stuname").html("<p style='text-align:center;font-size:40px;font-style:normal;' class='mylabel'>"+data[0].student_name+"</p>");
 				$("#stugender").html(checkGender(data[0].studentgeneder));
 				$("#stuclass").html(data[0].class_name);
 				$("#listattdetail").html(detailTable(data));
 				invokeDataTable2();
 			}
 			
 		});
 		
 	}
 	function detailTable(data){
 		var tb="<table class='display' id='myTableDetail' cellspacing='0' width='100%'>";
 		tb+="<thead>";
 		tb+="<tr>";
 		tb+="<th>Attendant_Type </th>";
 		tb+="<th>Attendant_Date</th>";
 		tb+="</tr>";
 		tb+="</thead>";
 		tb+="<tbody>";
 		for(var i=0;i<data.length;i++){
 			tb+="<tr class='myrow' style='height:50px;'>";
 			tb+="<td>"+sattendancePermission(data[i].permission)+""+sattendanceLate(data[i].late)+""+sattendanceAbsent(data[i].absent)+"</td>";
 			tb+="<td style='background:#E0F2F1;font-weight:bold;color:gray;'>"+data[i].at_date+"</td>";
 			tb+="</tr>";
 		}
	
		tb+="</tbody>";
		tb+="</table>";
		return tb;
 	}
 	function sattendanceLate(data){
 		var late="";
 		if(data>0){
 	  		late+="<span class='scorestyle' style='background:#FFD600;'>Late</span>";
 		}else{
 			late="";
 		}
 		return late;
 	}
 	function sattendancePermission(data){
 		var late="";
 		if(data>0){
 	  		late+="<span class='scorestyle' style='background:#03A9F4;'>Permission</span>";
 		}else{
 			late="";
 		}
 		return late;
 	}
 	function sattendanceAbsent(data){
 		var late="";
 		if(data>0){
 	  		late+="<span class='scorestyle' style='background:#EF5350;'>Absence</span>";
 		}else{
 			late="";
 		}
 		return late;
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
 	
 	function getMinusDate(){
 		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth(); //January is 0!
		var yyyy = today.getFullYear();

		if(dd<10) {
		    dd='0'+dd
		} 

		if(mm<10) {
		    mm='0'+mm
		} 

		today = yyyy+'/'+mm+'/'+dd;
		
		$("#startdate").val(today);
		
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

		today = yyyy+'/'+mm+'/'+dd;
		$("#todate").val(today);
		
	}
 	function invokeDataTable(){
 		$('#myTable').DataTable();
 	}
 	function invokeDataTable2(){
 		$('#myTableDetail').DataTable();
 	}
 	function attendanceLate(data){
 		var late="";
 		if(data>0){
 	  		late+="<span class='scorestyle' style='background:#F9A825;'>"+data+"</span>";
 		}else{
 			late="<span class='scorestyle' style='background:#F9A825;'>Never</span>";
 		}
 		return late;
 	}
 	function attendancePermission(data){
 		var late="";
 		if(data>0){
 	  		late+="<span class='scorestyle' style='background:#03A9F4;'>"+data+"</span>";
 		}else{
 			late="<span class='scorestyle' style='background:#03A9F4;'>Never</span>";
 		}
 		return late;
 	}
 	function attendanceAbsent(data){
 		var late="";
 		if(data>0){
 	  		late+="<span class='scorestyle' style='background:#EF5350;'>"+data+"</span>";
 		}else{
 			late="<span class='scorestyle' style='background:#EF5350;'>Never</span>";
 		}
 		return late;
 	}
 	</script>
 	
 	<script>
	$(document).ready(function() {

		// assuming the controls you want to attach the plugin to 
		// have the "datepicker" class set
		$('input.datepicker').Zebra_DatePicker();
		

	});
	</script>
</body>
</html>




































