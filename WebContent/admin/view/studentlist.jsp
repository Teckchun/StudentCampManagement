<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student list | HRD</title>
	<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="plugin/fontawesome/css/font-awesome.min.css">	
  	<link rel="stylesheet" href="css/home.css">
  	<link rel="stylesheet" href="css/studentlist.css">
  	<link rel="stylesheet" href="css/formstyle.css">
  	<link href="css/simple-sidebar.css" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="plugin/sweetalert/sweetalert.css">
  	<link rel="stylesheet" href="css/fixedbar.css">
  	<link rel="stylesheet" href="plugin/bootstrap-toggle-master/css/bootstrap-toggle.min.css"/>
   <link rel="icon" href="images/hrdlogo.png" type="image/png" >
   
   
  	<script src="js/jquery.js"></script>
  	<script src="bootstrape/js/bootstrap.min.js"></script>
  	<script src="plugin/bootstrap-toggle-master/js/bootstrap-toggle.min.js"></script>
	<style>
		a.mylink{
			display:inline;
		}
	
img.circle{
		width: 35px;
		height: 35px;
		
	}
	img.statusimg{
	width: 30px;
	hegith: 30px;
	cursor: pointer;
}

img.pictitle{
	width:100px;
	height: 100px;
	border-radius: 100%;
}
 @media (min-width: 1000px) {
  .modal-lg {
    width: 1100px;
  }
  
}
	 .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
  .toggle.ios .toggle-handle { border-radius: 20px; }

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
			<div class="row">
			<div class="row">
				<!--open fluid-->
				<div id="test2" class="container-fluid" >
					<!--content row-->
					<div class="row">
						<div class="col-sm-12" >
							<div class="col-sm-12 myspace"></div>
							<div class="col-sm-12">
								
								
								<div class="col-sm-12" >
								<legend>
									
										<h3 >
											<i class="fa fa-pencil"></i><b>Student </b><font size="4">Management</font>
										</h3>
									
								</legend>
								</div>
							<div class="col-sm-12" style="padding-bottom: 15px;">
							
								<div class="col-sm-9" >
									<div class="row">
									<button type="button" onclick="printPDF()"class="btn btn-primary btnstyle"><img class='iconimage' src="images/pdf.png"/>&nbsp;&nbsp;<b class="boldstyle">P</b>rint</button>
									<button type="button" id="btnexport" class="btn btn-success btnstyle"><img class='iconimage' src="images/excel.png"/>&nbsp;&nbsp;<b class="boldstyle">E</b>xport</button>
								
									</div>
								</div>
								<div class="col-sm-3">
									<a href="studentenrolment.jsp" class=" navbar-right btn btn-primary  btnownstyle"><b class="boldstyle"><i class='fa fa-plus'></i>A</b>dd <b class="boldstyle">S</b>tudent</a>
								</div>
								
							</div>
							<div class="col-sm-12" style="padding-bottom:15px;">
							<div class="row">
								
								
								<div class="col-sm-3">
									<div id="listgeneration">
										<select name="score_gener" class="form-control combo txttext"  id="gen">
											<option value="">---SELECT GENERATION---</option>		
									
										</select>
									</div>
									
								</div>
								
								<div class="col-sm-3">
									<div id="listcourse">
										<select name="course" class="  form-control combo txttext" id="course">
											<option value="">---SELECT COURSE---</option>
											
									    </select>
								    </div>
								</div>
								
								<div class="col-sm-3">
									<div id="listclass">
									<select name="classlist" class="  form-control combo txttext"  id="classlist">
										<option value="">---SELECT CLASS---</option>
									
								    </select>
								    </div>
								  
								</div>
								<div class="col-sm-3">
									<div id="liststustatus">
									<select name="stustatus" class="  form-control combo txttext"  id="stustatus" onchange="actionStatus()">
										<option value="">---SELECT STATUS---</option>
										<option value="0">Drop</option>
										<option value="1">Active</option>
								    </select>
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
			</div>
		</div>
		</div>
		</div>
	</div>
		<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog" >
					<div class="modal-dialog modal-lg" >

						<!-- Modal content-->
						<div class="modal-content" style="border-radius: 0;">
						
							<div class="" >
								<!--form input student's detail-->
						<div class="col-sm-12" style="height: 620px;">
							<div class="row" style="">
							<div class="col-sm-12" style="margin-top:-20px;height: 150px;background:#1d9c73;color:white;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<div style="margin-top: 15px;"></div>
								<div class="imgdiv" style="float:left;">
									<img class="pictitle" src="images/pic.jpg" />
								</div>
								<div class="detaildiv" style="float:left;margin-left: 30px;">
									<p class="fixtext" style="font-style:italic;font-weight:bold;"> Name:<span id="namedetail" style="margin-left:20px;">Phalleak Lach</span> </p>
									<p class="fixtext" style="font-style:italic;font-weight:bold;"> Gender:<span id="namedetail" style="margin-left:20px;">Male</span> </p>
									<p class="fixtext" style="font-style:italic;font-weight:bold;"> Phone:<span id="namedetail" style="margin-left:20px;">09287373</span> </p>
									<p class="fixtext" style="font-style:italic;font-weight:bold;"> Email:<span id="namedetail" style="margin-left:20px;">jame@gmial.com</span> </p>
								</div>
							</div></div>
							<div class="col-sm-12">
								<p class="col-sm-1" >DOB
								<p>
								<div class="col-sm-4 form-group">
									<input type="text" class="form-control"/>
										
								</div>
								<div class="col-sm-1"></div>
							</div>


						</div>
						<!--close input student's detail-->
								 
								
							</div>
							<div class="modal-footer">
								
							
								
							</div>
						</div>

					</div>
				</div>

			</div>

			<!--END MODAL-->
	
	<script src="plugin/sweetalert/sweetalert.min.js"></script>
	<script>
	getAllGeneration();
	getAllCourse();
	getAllClass();
	
	function actionStatus(){
		
		listAllHRDStudent();
	}
	function printPDF(){
		 var gen=$("#gen").val();
	     var course=$("#course").val();
		var classa=$("#classlist").val();
		var status=$("#stustatus").val();
		window.open("getfilterlist?generation="+gen+"&course="+course+"&class="+classa+"&status="+status,"_blank");
		
	}
	
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
		var gen="<select name='score_gener' class='form-control combo txttext'  id='gen' onchange='actionGeneration()'>";
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
 	
 		var cou="<select name='score_gener' class='form-control combo txttext' id='course' onchange='actionCourse()'>";
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

 		var cls="<select name='classlist' class='form-control combo txttext'  id='classlist' onclick='actionClass()'>";
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
 		$.ajax({
 			url : "listallhrdstudent",
 			type :"POST",
 			data :{
 				genid :$("#gen").val(),
 				courseid : $("#course").val(),
 				classid :$("#classlist").val(),
 				status :$("#stustatus").val()
 			},
 			success:function(data){
 				
 				$("#resultshow").html(listStudentTb(data));
 				invokeDataTable();
 				//invokeCheckbox();
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
 		table+="<th>Status</th>";
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
	 		table+="<td><button onclick=getUpdateStudent('"+data[i].stu_id.trim()+"') class='btnmystyle btn btn-success btnedit' type='button'> <span class='glyphicon glyphicon-pencil'></span></button>";
			/* table+="&nbsp;&nbsp;<button onclick=getViewStudent('"+data[i].stu_id.trim()+"') class='btn btn-primary btnview' type='button' data-toggle='modal' data-target='#myModal'>";
			table+="<span class='glyphicon glyphicon-eye-open'></span>";
			table+="</button></td>"; */
			table+="</td>";
			if(data[i].status==0){
				table+="<td><img class='statusimg' src='images/uncheck.png' onclick=updateStatus('"+data[i].stu_id.trim()+"',1)></td>";
				
			}else{
				table+="<td><img class='statusimg' src='images/check.png'  onclick=updateStatus('"+data[i].stu_id.trim()+"',0) ></td>";
				
			}
	 		table+="</tr>";
 		}
 		table+="</tbody></table>";
 		return table;
 	}
 	
 	function updateStatus(id,status){
 		$.ajax({
			url : "adminupdatestudentstatus",
			type : "POST",
			data:{
				stuid:id,
				stustatus:status
			},
			success:function(data){
				listAllHRDStudent();
			}
		});
 	}
 	
 	function getUpdateStudent(id){
 		location.href="studentenrolment.jsp?id="+id;
 	}
 	function getViewStudent(id){
 		alert(id);
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
	<script>
 
    </script>
    <script>
		$(".btn-delete").click(function(){
			
			 swal("Status has been changened", "DONE!", "success"); 
			
		})
		$("#btnexport").click(function (e) {
    	$('#myTable').tableExport({type:'excel',escape:'false'});
	});
		</script>
		
		<!-- export -->
	  <script src="plugin/tableExport/jquery.base64.js"></script>
	  <script src="plugin/tableExport/tableExport.js"></script>
	  <script src="plugin/tableExport/html2canvas.js"></script>
	  <script src="plugin/jspdf/libs/sprintf.js"></script>
	  <script src="plugin/jspdf/jspdf.js"></script>
	  <script src="plugin/jspdf/libs/base64.js"></script>
</body>
</html>