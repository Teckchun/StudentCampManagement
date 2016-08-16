<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Studentlist | HRD</title>
	<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
 	<link rel="stylesheet" href="plugin/fontawesome/css/font-awesome.min.css">	
  	<link rel="stylesheet" href="css/home.css">
  	<link rel="stylesheet" href="css/studentlist.css">
  	<link rel="stylesheet" href="css/formstyle.css">
  	<link href="css/simple-sidebar.css" rel="stylesheet">
   <link rel="icon" href="images/hrdlogo.png" type="image/png" >
   
   
  	<script src="js/jquery.js"></script>
  	<script src="bootstrape/js/bootstrap.min.js"></script>
  	
  	<!--  data table-->
<script
	src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
<link rel="stylesheet"
	href="plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
  <style>
	a.mylink{
		display:inline;
	}
	span.bold-style{
		color: #1d9c73;
		font-style: italic;
		
	}
	img.circle{
		width: 35px;
		height: 35px;
		
	}
  </style>
</head>
<body>
    <c:set var="id" value="${param.id}"></c:set>
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
				<!--open fluid-->
				<div id="test2" class="container-fluid" >
					<!--content row-->
					<div class="row">
						<div class="col-sm-12" >
							
							<div class="col-sm-12">
							<form role="form">
							<fieldset>
								<div class="row">
								<div class="col-sm-12" style="margin-top: 30px;" >
								<a href="classlist.jsp" class=" navbar-left btn btn-primary  btnownstyle"><i class="fa fa-undo"></i><b class="boldstyle">B</b>ack</a>
								</div>
									<div class="col-sm-12" >
									
								
							             <input type="hidden" value="${id}" id="clid"/> 
											<legend><h3><i class="fa fa-users"></i><b>List of students</b></h3></legend>
									</div>
									<div class="col-sm-12" style="padding-bottom:15px;">
										<!-- <div class="col-sm-1"><div class="row">
											<strong><p style="font-size:16px;font-style:italic">Description:</p></strong>
										</div></div>
										<div class="col-sm-11">
										    <p style="font-size:16px;"> <span class="bold-style">Siem Reap</span> class in <span class="bold-style">Basic</span> course and <span class="bold-style">1st-Generation</span>.Taugh by <span class="bold-style">Bunnrong</span></p>
										 
										</div> -->
									</div>
									<div class="col-sm-12" id="display">
									</div>
								</div>
							</fieldset>
							</form>
							</div>
							
						</div>
					</div>
					<!--close content row-->
				</div>
				<!--close fluid-->
			</div>
			<!--close content row-->
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			
			//alert($("#clid").val());
		});
	function invokeDataTable(){
		$('#myTable').DataTable();
	}
	function listStudent(){
	
		$.get("getsudentinclass",
				{
			     classid:$("#clid").val()
				},function(data){
					$("#display").html(list(data))
					//alert(list(data));
					invokeDataTable();
				});
	}
	listStudent();
	function list(data){
		var str='<table class="display" id="myTable" cellspacing="0"width="100%">'+
			'<thead>'+
				'<tr>'+
					'<th>ID</th>'+
					'<th>Image</th>'+
					'<th>Name</th>'+
					'<th>Gender</th>'+
					'<th>Generation</th>'+
					'<th>Course</th>'+
					'<th>Class</th>'+
					'<th>University</th>'+
					'<th>Email</th>'+
					'<th>Phone</th>'+
				'</tr>'+
			'</thead>'+
			'<tbody>';
			for(var i=0;i<data.length;i++){
				str+='<tr style="cursor:auto;color:#616161;">'+
					'<td>'+data[i].stu_id+'</td>'+
					'<td><img src="../../imgprofiles/'+data[i].img+'" class="img-circle circle"/></td>'+
					'<td>'+data[i].lname+'  '+data[i].fname+'</td>'+
					'<td>'+checkGender(data[i].gender)+'</td>'+
					'<td>'+data[i].g_name+'</td>'+
					'<td>'+data[i].course+'</td>'+
					'<td>'+data[i].class_name+'</td>'+
					'<td>'+data[i].universit+'</td>'+
					'<td>'+data[i].email+'</td>'+
					'<td>'+data[i].phone+'</td></tr>';
			}
			str+='</tbody>'+'</table>';
			return str;
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
	</script>
</body>
</html>
