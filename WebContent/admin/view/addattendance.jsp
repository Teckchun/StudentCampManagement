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
<link rel="stylesheet" href="css/simple-sidebar.css">
<link rel="stylesheet" href="css/fixedbar.css">
<link rel="stylesheet" type="text/css"
	href="plugin/sweetalert/sweetalert.css">
	

<script src="js/jquery.js"></script>
<script src="bootstrape/js/bootstrap.min.js"></script>
<title>Attendance</title>

<link rel="stylesheet"
	href="plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">

<link rel='stylesheet' href='plugin/fullcalendar/fullcalendar.css' />

<link rel='stylesheet' href='plugin/sentir/style-responsive.css' />





<link rel="icon" href="images/hrdlogo.png" type="image/png" >
<!-- PLUGINS CSS -->



<!-- PLUGINS CSS -->
<!-- MAIN CSS (REQUIRED ALL PAGE)-->
<!-- MAIN CSS (REQUIRED ALL PAGE)-->


<!-- <link href="plugin/assets/css/style-responsive.css" rel="stylesheet"> -->
<link href="plugin/assets/plugins/chosen/chosen.min.css"
	rel="stylesheet">



<style>
.fc-time{
display:none;
}
div.mybox {
	border-radius: 0;
}
.attendance{
	margin-bottom: 10px;
}

.bcolor {
	width: 70px;
	height: 70px;
	margin-top: 5px;
	border: 2px solid black;
}
.modal-header
         {
             padding:9px 15px;
             border-bottom:1px solid #eee;
             background-color: #0480be;
             color:white;
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

	<%@include file="fixedbar/topmenu.jsp"%>


	<!-- wrapper div -->
	<div id="wrapper" style="margin-top: 54px;">

		<!-- left menu -->
		<%@include file="fixedbar/leftmenu.jsp"%>
		<!-- end of left menu -->

		<!--content right-->
		<div id="page-content-wrapper">
			<div class="col-sm-12 style-wrapper" style="padding-bottom: 20px;">
			<div class="row">
		
	
				
				<fieldset>
					<div class="col-sm-12" style="margin-top: 15px;" >
							<!-- <a href="attendancelist.jsp" class=" navbar-left btn btn-primary  btnownstyle"><i class="fa fa-undo"></i>Back</a> -->
							
							</div>
					<div class="col-sm-12" >
						<legend><h3><i class="fa fa-pie-chart"></i><b>Attendant </b><font size="4"> Management</font></h3></legend>
					<!-- <button type='button'  data-toggle='modal' data-target='#myModal'  class="btn btn-primary attendance" >Check Attendance</button> -->
					</div>
					
					</fieldset>
					<div class='col-sm-12' style='padding-bottom: 10px;'>
						<div class="col-sm-7">
							<div class='row'>
								<button onclick='getMonthAttendance()' class='navbar-left btn btn-primary  btnownstyle' data-toggle='modal' data-target='#myModal' type='button'>
									<b class="boldstyle"><i class="fa fa-bar-chart"></i>C</b>ount <b class="boldstyle">A</b>ttendance
								</button>
								<button onclick="printAttList()" style="margin-left: 5px;" type="button" class="btn btn-primary btnstyle"><img class='iconimage' src="images/pdf.png"/>&nbsp;&nbsp;<b class="boldstyle">P</b>rint</button>
											
							</div>
						</div>
					</div>
				<div class="col-sm-7">
					
					<div class="panel panel-success">
					
						<div class="panel-heading">Calendar</div>
						<div class="panel-body">
							<div id='calendar'></div>
						</div>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="panel panel-success">
						<div class="panel-heading">
							Attendance For: <label id="attdate"><span id="datef"></span></label>
						</div>
						<div class="panel-body">
								<div class="form-group">
									<label>Select type</label> 
									<select class="form-control " id="atype">
										<option value="Late">Late</option>
										<option value="Permission">Permission</option>
										<option value="Absent">Absent</option>
									</select> <label> Select Students</label> 						
									 <div id='stulist' >
									    <select id='stuname' class='form-control chosen-select col-sm-12' multiple tabindex='4'> 
										
										<!--    <option value="United States">United States</option>
										<option value="United Kingdom">United Kingdom</option>
										<option value="Afghanistan">Afghanistan</option>
										<option value="Aland Islands">Aland Islands</option>
										<option value="Albania">Albania</option>
										<option value="Algeria">Algeria</option>
										<option value="American Samoa">American Samoa</option>
										<option value="Andorra">Andorra</option>
										<option value="Angola">Angola</option>
										<option value="Anguilla">Anguilla</option>
										<option value="Antarctica">Antarctica</option>
										<option value="Antigua and Barbuda">Antigua and
											Barbuda</option>  -->  
									</select>    
									</div>		
								</div>
								<button role="button"  class="btnmystyle  btn btn-success" id="btn-save" onclick="addattendance()">Save</button>
								<!-- <div id="calendarTrash" class="calendar-trash"><img src="images/trash.png"></img></div> -->
						</div>
					</div>
						
				
			
				 </div>
				<div class='col-sm-12'>
						<!-- <div class="panel panel-success">
						<div class="panel-heading">Attendance List: <label><span id="attnlist"></span></label></div>
						<div class="panel-body" id="tblAttn">
				
						</div>
					</div> -->
				</div>
	
	</div>
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
					<h3 class="modal-title" style="font-weight:bold; font-style:italic"  ><i class="fa fa-pie-chart"></i>Attendant Details</h3>
				</div>
				<div class="" >
					<!--form input student's detail-->
					<div class="col-sm-12"
						style="margin-top: 20px; padding-bottom: 50px;">
					
						<div class="col-sm-12" style="margin-top:12px;">
							<fieldset>
								<legend>
									<h4 class="mylabel">
										<i class="fa fa-pencil"></i><b style="boldstyle">Attendant </b><font size="3">Description ( Month: <b><span id='dmonth'></span></b> ) </font>
									</h4>
								</legend>
							</fieldset>
							<div class="attendanceresult" id="attendanceresult">
											
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
		<!-- Modal -->
	<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color:#1d9c73; color:WHITE">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" style="font-weight:bold; font-style:italic"  >Attendance list</h3>
				</div>
				
					<!--form input student's detail-->
					<div class="col-sm-12"
						style="margin-top: 20px; padding-bottom: 50px;">
						<div class="col-sm-12">
							<p class="col-sm-1 mylabel" style="margin-top: 15px;">From
											
							<p>
							<div class="col-sm-4 form-group" >
								<input class="form-control  datepicker" type="text"
												id="orientation"  name="cname"
												placeholder="" />
							</div>
							<p class="col-sm-1 mylabel" style="margin-top: 4px;">To
							<p>
							<div class="col-sm-4 form-group">
								<input class="form-control  datepicker" type="text"
												id="finish"  name="cname"
												placeholder="" />
							</div>
							<button  class="col-sm-2" type="button"> Check </button>
						</div>
						
						<div class="col-sm-12" id="scorespecific">
							
						</div>


					</div>
					<!--close input student's detail-->


				
				<div class="modal-footer">

					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->

				</div>
			</div>

		</div>
	</div>
	<script src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
	<script src="plugin/sweetalert/sweetalert.min.js"></script>

	<!--END MODAL-->


				<!-- Calendar event div -->


				<script>
					function editatt(){
					//	alert(1);
					}
					function deleteatt(){
						deletelist(id);
					}
					function printAttList(){
						 var moment = $('#calendar').fullCalendar('getDate').format();
						 var mydate=new Date(moment);
						// alert(mydate.getMonth()+1);
						 //alert(mydate.getFullYear());
						 var month=mydate.getMonth()+1;
						 var year=mydate.getFullYear();
				 		
				 		window.open("getatt?month="+month+"&year="+year,"_blank");
				 	}
					
				</script>

				<script type="text/javascript">				
				$(document).ready(function(){		
					var date = new Date();
					var d = date.getDate();
					var m = date.getMonth();
					var y = date.getFullYear();
					
					  	$('#calendar').fullCalendar({
					  		
							 dayClick: function(date, jsEvent, view) {
								 	dd = date.format();
							 		$("#datef").html(dd);
							 		$("#attnlist").html(dd);
							 		attendancelist();
							   //     $(this).css('background-color', '#8BC34A');
							  },
							 header: {
								left: 'prev,next today',
								center: 'title',
						//		right: 'month,agendaWeek,agendaDay'
							 },
							 eventMouseover: function(event, jsEvent, view) {
						            if (view.name !== 'agendaDay') {
						                $(jsEvent.target).attr('title', event.title);
						            }
						     },           
					         eventClick: function(event) {
					            /* var modal = $("#modal");
					            modal.find(".modal-title").html(event.title);
					            modal.modal(); */
					         },
					        
									 
							/* defaultDate: '2015-02-12', */
							 selectable: true,
							 selectHelper: true,
							 select: function(start, end) {
							// var eventData;		 		
						/* 		if (title) {
									eventData = {
										title: title,
										start: start
									};
						
								} */
								//	$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
								//	$('#calendar').fullCalendar('unselect');
					   		   }, eventRender: function(event, element) {
				                    element.html(getAttendanceType(event.absence, event.permission, event.late)+": "+event.title+"<i  class='fa fa-close pull-right text-danger' style='cursor:pointer;font-size:15px;' onclick=confirmdelete('"+event.att_id+"') id='"+event.att_id+"'></i>");
				                },
					//		editable: true,
						/*	eventLimit: true, // allow "more" link when too many events
					*/		/*  events:{url: 'http://192.168.178.253:8080/HRD_Management/attendance_sum.hrd'  }, */
							 
							 events:{  url: 'selectattendance'/*, color:'#1d9c73' */}
			
						 	 /* eventSources: [
							               // your event source
							                {  
							            	   
							                   url: 'http://192.168.178.253:8080/HRD_Management/attendance_sum.hrd', // use the `url` property
							                   color: 'yellow',    // an option!
							                   textColor: 'black'  // an option!
							               } 
							               // any other sources...
							 ]  */

							});  // end of fullcalendar		
					 // end of calendar function
					 function getAttendanceType(absence,per,late){
						var text="";
						if(absence>0){
							text+="<b  style='font-size: 15px;'>A</b>";
						}
						if(per>0){
							text+="<b style='font-size: 15px;'>P</b>";
						}
						if(late>0){
							text+="<b style='font-size: 15px;'>L</b>";
						}
						text+="";
						return text;
					}
					  	
				});	

			</script>
				<script>
 					/*  $('#calendar').fullCalendar({
					
					 events: source,
					 header: {
					 left: '',
					 center: 'prev title next',
					 right: ''
					 },
					 eventClick:  function(event, jsEvent, view) {
					 //set the values and open the modal
					 $("#eventInfo").html(event.description);
					 $("#eventLink").attr('href', event.url);
					 $("#eventContent").dialog({ modal: true, title: event.title });
					 }
					 });  */ 
					
				</script>

				<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" id="mybtn" data-target="#myModal">Open Modal</button>
 -->	
	
	<script>

		liststudent();

		function getMonthAttendance(){
			 
			 var moment = $('#calendar').fullCalendar('getDate').format();
			 var mydate=new Date(moment);
			// alert(mydate.getMonth()+1);
			 //alert(mydate.getFullYear());
			 var month=mydate.getMonth()+1;
			 var year=mydate.getFullYear();
			 $("#dmonth").html(getMonthScore(month));
			$.ajax({
				url : "getattendantdetail",
				type : "POST",
				data :{
					month : month,
					year : year
				},
				success : function(data){
					//alert(data);
					$("#attendanceresult").html(listAttTable(data));
	 				invokeDataTable();
				}
			});
					
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
		function invokeDataTable(){
	 		$('#myTable').DataTable();
	 	}
		function liststudent(){
			$.ajax({
				url : "selectallstudents",
				method : "GET",
				success : function(data){
					listallstudent(data);
				}
			});
		}
		function listallstudent(data){
									
			for(var i=0; i<data.length; i++){
				// new option(text,value);
				$("#stuname").append(new Option(""+ data[i].fname +" "+ data[i].lname +"", ""+ data[i].stu_id +""));
				/* $("#stuname").append(new Option(""+ data[i].lname +" "+ data[i].fname +"", ""+ data[i].lname + data[i].fname +"")); */
			}
			chooseselect();
		}
		function chooseselect(){
			"use strict";
			var configChosen = {
			  '.chosen-select'           : {},
			  '.chosen-select-deselect'  : {allow_single_deselect:true},
			  '.chosen-select-no-single' : {disable_search_threshold:10},
			  '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
			  '.chosen-select-width'     : {width:"100%"}
			}
			for (var selector in configChosen) {
			  $(selector).chosen(configChosen[selector]);
			}
		}
	
		function listAttTable(data){
	 		
		 	//var tbattendance=data[0].student_name;
	 		 var tbattendance="<table class='display' id='myTable' cellspacing='0' width='100%'>";
	 		tbattendance+="<thead>";
	 		tbattendance+="<tr>";
	 		
	 		tbattendance+="<th class='col-sm-1'>Image</th>";
	 		tbattendance+="<th class='col-sm-1'>Name</th>";
	 		tbattendance+="<th class='col-sm-1'>Gender</th>";
	 		tbattendance+="<th class='col-sm-1'>Class</th>";
	 	
	 		tbattendance+="<th class='col-sm-1'>L</th>";
	 		tbattendance+="<th class='col-sm-1'>P</th>";
	 		tbattendance+="<th class='col-sm-1'>A</th>";
	 		//tbattendance+="<th class='col-sm-1'>Action</th>";
	 		tbattendance+="</tr>";
	 		tbattendance+="</thead>";
	 		tbattendance+="<tbody>";
	 		for(var i=0;i<data.length;i++){
	 			tbattendance+="<tr  class='myrow'>";
	 	 		
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
		function checkGender(data){
			var gender="";
			if(data==0 || data=='0'){
				gender="M";
			}else{
				gender="F";
			}
			return gender;
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
	function addattendance(){
		
		
		
		var items = [];
		$('#stuname option:selected').each(function(){ items.push($(this).val()); });
		var result = items.join(', ');
		//alert(dd);
		if($("#attdate").html()==""){
			swal("Error", "Please fill out the attendance!", "error");
			return;
		}
		$.ajax({
			url : "addattendance",
			method: "POST",
			data : {
				atype   : $("#atype").val(),  
				stuname : result,
				datef   : dd
			},
			success: function(data){
				swal("New Attendance Saved!", "DONE!", "success");
				$('#calendar').fullCalendar('refetchEvents');	
				//$("#stuname").val("");
				$('#stuname').val('').trigger('chosen:updated');
				attendancelist();
			}	
		});
	}
		
	attendancelist();
	function attendancelist(){
		$.ajax({
			url: "selectattendancelist",
			method: "POST",
			data: { datef: dd },
			success: function(data){			
				$("#tblAttn").html(listattendancestu(data));		
			}
		});
	}
	
	function listattendancestu(data){
		var str = "";
			str += '<table class="table" id="myTable" cellspacing="0" width="100%">'+
					'<thead>'+
							'<th>Name</th>'+
							'<th>Date</th>'+
							'<th>Late</th>'+
							'<th>Absent</th>'+
							'<th>Permission</th>'+
							'<th>Action</th>'+
					'</thead>';	
			
			str +=  '<tbody>';	
			for(var i=0;i<data.length;i++){
				var ilate,iabsense,ipermission = "";
				
				if(data[i].late == 0) ilate = "<img src='images/inactive.png'style='display:none'/>";	
				else ilate = "<img src='images/check1.png'/>";
				
				if(data[i].absent == 0) iabsense = "<img src='images/inactive.png'style='display:none'/>";	
				else iabsense = "<img src='images/check1.png'/>";
				
				if(data[i].permission == 0) ipermission = "<img src='images/inactive.png'style='display:none'/>";	
				else ipermission = "<img src='images/check1.png'/>";
				
				var btndelete = '<button type="button" onclick="confirmdelete('+ data[i].id +')" class="btn btn-danger">Delete</button>';
				str += '<tr>'+
						'<td>'+ data[i].student_name +'</td>'+
						'<td>'+ data[i].at_date +'</td>'+
						'<td>'+ ilate +'</td>'+
						'<td>'+ iabsense +'</td>'+
						'<td>'+ ipermission +'</td>'+
						'<td>'+ btndelete +'</td>'+
					'</tr>';	
			}
		
			str += '</tbody>'; 
			str += '</table>';
			return str;
	}
	
	
	
	function confirmdelete(id){
		//var c = swal("Do you want to delete?");
		swal({   title: "Are you sure?",  
				text: "You will not be able to recover this imaginary file!",   
				type: "warning",   showCancelButton: true,   
				confirmButtonColor: "#DD6B55",   
				confirmButtonText: "Yes, delete it!",   
				closeOnConfirm: false }, 
				function(){   deletelist(id);swal("Deleted!", "Your imaginary file has been deleted.", "success"); });
		
		/* if( c == true){
			
		} */
	}
	function deletelist(id){
		$.ajax({
			url : "deleteattendance",
			method: "POST",
			data : { id : id},
			success: function(data){
				swal("Attendance Delete!", "DONE!", "success");
				$('#calendar').fullCalendar('refetchEvents');
				attendancelist();
			}
		});
		
	}
	
	$("#btn-save").click(function() {

		/* swal("New Attendance Saved!", "DONE!", "success"); */
		
		
		
		/* var type = $("#atype").val();
		var stu = $("#stuname").val(); 
		alert(stu); */
		//alert(stu.length+" "+type);
		
		/* for(var i=0;i<stu.length;i++){
			alert(i.length);
		} */
	});
				
	</script>
	
		<!-- PLUGINS -->
		<!-- required -->
		
		<script src="plugin/assets/plugins/nicescroll/jquery.nicescroll.js"></script>
		<script src="plugin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="plugin/assets/plugins/owl-carousel/owl.carousel.min.js"></script>
		<script src="plugin/assets/plugins/chosen/chosen.jquery.min.js"></script>
		<script src="plugin/assets/js/apps.js"></script>
		<!--required  -->

		<script src='plugin/fullcalendar/lib/moment.min.js'></script>
	<!--<script src='plugin/fullcalendar/fullcalendar.js'></script> -->
		<script src='plugin/fullcalendar/fullcalendar.min.js'></script>
		
</body>
</html>