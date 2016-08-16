<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Achievement | HRD</title>
	<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="plugin/fontawesome/css/font-awesome.min.css">	
  	<link rel="stylesheet" href="css/home.css">
  	<link rel="stylesheet" href="css/studentlist.css">
  	<link rel="stylesheet" href="css/formstyle.css">
  	<link href="css/simple-sidebar.css" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="plugin/sweetalert/sweetalert.css">
  	<link rel="stylesheet" href="css/fixedbar.css">
  	<link rel="icon" href="images/hrdlogo.png" type="image/png" >
   
  	<script src="js/jquery.js"></script>
  	<script src="bootstrape/js/bootstrap.min.js"></script>
	<style>
		a.mylink{
			display:inline;
		}
		button.extra{
	
	margin-top: 15px;
}
	img.circle{
		width: 35px;
		height: 35px;
		
	}
    </style>
  
	<!--  data table-->
	<script src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
	<link rel="stylesheet" href="plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
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
			<div class="row"><div class="row">
				<!--open fluid-->
				<div id="test2" class="container-fluid" >
					<!--content row-->
					<div class="row">
						<div class="col-sm-12" >
							
							<div class="col-sm-12">
								
								
								<div class="col-sm-12" style="margin-top: 15px;">
								<legend>
									
										<h3 >
											<i class="fa fa-list-alt"></i><b>Achievement </b><font size="4">Printing List</font>
										</h3>
									
								</legend>
								</div>
						<div class="col-sm-12" style="padding-bottom: 20px;">
							<div class="row">
							<div class="col-sm-3">
								<div id="listgeneration">
									<select name="score_gener" class="form-control txttext combo"  id="gen">
										<option value="">---SELECT GENERATION---</option>		
								
									</select>
								</div>
								
							</div>
							
							<div class="col-sm-3">
								<div id="listcourse">
									<select name="course" class="  form-control txttext combo" id="course">
										<option value="">---SELECT COURSE---</option>
										
								    </select>
							    </div>
							</div>
							
							<div class="col-sm-3">
								<div id="listclass">
								<select name="classlist" class="  form-control txttext combo"  id="classlist">
									<option value="">---SELECT CLASS---</option>
								
							    </select>
							    </div>
							</div>
							
							<div class="col-sm-3">
								<div class="col-sm-12">
								
										
								 
								 <button type="button" id="btncerti" onclick="generateall()" class="btnmystyle btn btn-success navbar-right btnstyle"><img class='iconimage' src="images/certificate.png"/>&nbsp;&nbsp;<b class="boldstyle">P</b>rint <b class="boldstyle">A</b>ll</button>
								</div>
							
							</div>
							</div>
						</div>
					<!--col-12-->
								<div class="col-sm-12" id="resultshow">
							
								</div>
							</div>
							
						</div>
				</div>
				<!--close row-->
				</div>
				<!--close fluid-->
			</div></div>
			</div>
		</div>
	</div>
	<script src="plugin/sweetalert/sweetalert.min.js"></script>
	<script>
    $(document).ready( function () {
   
	} );    
    
    </script>
    <script>
    function generateall(){
    	var gen=$("#gen").val();
		var cou= $("#course").val();
		var cls=$("#classlist").val();
    	window.open("getallcertificate?generation="+gen+"&course="+cou+"&class="+cls+"&hour=500&date=2015.08.06","_blank");
    }
    getAllGeneration();
    listAllHRDStudent();
    getAllCourse();
	getAllClass();
    function getAllGeneration(){
		$.ajax({
			url:"listallgeneration",
			type:"POST",
			success:function(data){
				$("#listgeneration").html(listGeneration(data));
				listAllHRDStudent();
			}
			
		});
	}
    function listGeneration(data){
		var gen="<select name='score_gener' class='form-control txttext combo'  id='gen' onchange='actionGeneration()'>";
		gen+="<option value=''>---SELECT GENERATION---</option>";
		for(var i=0;i<data.length;i++){
			gen+="<option value='"+data[i].name+"'>"+data[i].name+"</option>";
		}
		gen+="</select>";
		return gen;
	}
	function actionGeneration(){
		
		listAllHRDStudent();
		getAllCourse();
		getAllClass();
	}
function getAllCourse(){
		
		$.ajax({
			url:"listallcourse",
			type:"POST",
			data:{
				gen:$("#gen").val()
			}, 
			success:function(data){
				
				 $("#listcourse").html(listCourse(data));
				listAllHRDStudent();
			}
			
		});
	}
 	function listCourse(data){
 	
 		var cou="<select name='score_gener' class='form-control txttext combo' id='course' onchange='actionCourse()'>";
		cou+="<option value=''>---SELECT COURSE---</option>";
		for(var i=0;i<data.length;i++){
			cou+="<option value='"+data[i].course_type+"'>"+data[i].course_type+","+data[i].g_name+"</option>";
		}
		cou+="</select>";
		return cou;
	} 
 	function actionCourse(){
 		listAllHRDStudent();
 		getAllClass();
 	}
 	function getAllClass(){
 		$.ajax({
			url:"listallclass",
			type:"POST",
			data:{
				gen:$("#gen").val(),
				course: $("#course").val()
			},
			success:function(data){
				
				 $("#listclass").html(listClass(data));
				listAllHRDStudent();
			}
			
		});
 	}
 	function listClass(data){
 		//alert(data);

 		var cls="<select name='classlist' class='form-control txttext combo'  id='classlist' onclick='actionClass()'>";
		cls+="<option value=''>---SELECT CLASS---</option>";
		for(var i=0;i<data.length;i++){
			cls+="<option value='"+data[i].name+"'>"+data[i].name+"("+data[i].course_name+","+data[i].generation+")</option>";
		}
		cls+="</select>";
		return cls;
 	}
 	function actionClass(){
 		listAllHRDStudent();
 	}
 	function listAllHRDStudent(){
 		var status="1";
 		$.ajax({
 			url : "listallhrdstudent",
 			type :"POST",
 			data :{
 				genid :$("#gen").val(),
 				courseid : $("#course").val(),
 				classid :$("#classlist").val(),
 				status : status
 			},
 			success:function(data){
 				
 				$("#resultshow").html(listStudentTb(data));
 				invokeDataTable();
 			}
 		});
 	}
 	function listStudentTb(data){
 		
 		var table="<table class='display' id='myTable' cellspacing='0' width='100%'  >";
 		table+="<thead>";
 		table+=" <tr>";
 		table+="<th >ID</th>";
 		table+="<th >Image</th>";
 		table+="<th >Name</th>";
 		table+="<th >Gender</th>";
 		table+="<th >Class</th>";
 		table+="<th >Course</th>";
 		table+="<th >Generation</th>";
 		table+="<th >Action</th>";
 		table+="</tr>";
 		table+="</thead>";
 		table+="<tbody>";
 		for(var i=0;i<data.length;i++){
 	
	 		table+="<tr style='cursor:auto;color:#616161;'>";
	 		table+="<td>"+data[i].stu_id+"</td>";
	 		table+="<td><img src='../../imgprofiles/"+data[i].profiles+"' class='img-circle circle'/></td>";
	 		table+="<td>"+data[i].fname+"</a></td>";
	 		table+="<td>"+checkGender(data[i].gender)+"</td>";
	 		table+="<td>"+data[i].class_name+"</td>";
	 		table+="<td>"+data[i].course+"</td>";
	 		table+="<td>"+data[i].g_name+"</td>";
	 		table+="<td ><button class='btn btn-success btnedit' type='button' onclick=printCertificate('"+data[i].stu_id.trim()+"')><img class='iconimage' src='images/certificate.png' style='margin-top: 2px;'/></button> ";
	 		table+="<button class='btn btn-primary btnedit' type='button' onclick=printTranscript('"+data[i].stu_id.trim()+"')><img class='iconimage' src='images/printer.png' style='margin-top: 2px;'/></button> </td>";
	 		table+="</tr>";
 		}
 		table+="</tbody></table>";
 		return table;
 	}
 	function printTranscript(id){
 		window.open("getadmintranscript?id="+id+"&hour=500&date=2015.08.06","_blank");
 	}
 	function printCertificate(id){
 		window.open("getreport?id="+id+"&hour=500&date=2015.08.06","_blank");
 		
 	}
 	
	function invokeDataTable(){
		 $('#myTable').DataTable();
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