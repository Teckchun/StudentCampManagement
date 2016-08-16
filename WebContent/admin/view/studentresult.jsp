<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Result | HRD </title>
	<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="plugin/fontawesome/css/font-awesome.min.css">	
  	<link rel="stylesheet" href="css/home.css">
  	<link rel="stylesheet" href="css/formstyle.css">
  	<link href="css/simple-sidebar.css" rel="stylesheet">
  	<link rel="stylesheet" href="css/score.css">
  	<link rel="stylesheet" href="css/fixedbar.css">
  	<link rel="icon" href="images/hrdlogo.png" type="image/png" >
  	<link rel="stylesheet" href="css/studentresult.css">
   	
   	
   
 	<script src="js/jquery.js"></script>
  	<script src="bootstrape/js/bootstrap.min.js"></script>
	  <style>
		button.extra{
	
	margin-top: 20px;
}
.scorestyle{
color:white;
border-radius:3px;
padding:2px 10px 2px 10px;
font-weight:bold;
}
	  </style>
	<!--dataTable-->
  	<link rel="stylesheet" href="plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
  	<script src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
</head>
<body>
	<%@include file="fixedbar/topmenu.jsp" %>
  
  	<!-- wrapper div -->
  	<div id="wrapper" style="margin-top:54px;">
  
	  	<!-- left menu -->
	  	<c:choose>
  			<c:when test="${sesslogin[3]=='teacher' }">
  				<%@include file="fixedbar/leftmenuinstructor.jsp" %>
  			</c:when>
  			<c:otherwise>
  				<%@include file="fixedbar/leftmenu.jsp" %>
  			</c:otherwise>
  		</c:choose>
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
							<fieldset>
							
								<div class="col-sm-12" style="margin-top: 15px;">
                                  
										<legend><h3><i class="fa fa-graduation-cap"></i><b>Student </b><font size="4">Result</font></h3></legend>
								</div>
								
							</fieldset>
						</div>
						<div class="col-sm-12" >
							<div class="col-sm-6">
							
							
							<button type="button" onclick="printScore()"class="btn btn-primary btnstyle"><img class='iconimage' src="images/pdf.png"/>&nbsp;&nbsp;<b class="boldstyle">P</b>rint</button>
							<button type="button" id="btnexport" class="btn btn-success btnstyle"><img class='iconimage' src="images/excel.png"/>&nbsp;&nbsp;<b class="boldstyle">E</b>xport</button>
								
							</div>
						</div>
						<div class="col-sm-12" style="padding-bottom: 20px;">
							
							<div class="col-sm-3">
								<div id="listgeneration">
									<select name="score_gener" class="form-control combo txttext" style="margin-top:20px;"  id="gen">
										<option value="">---SELECT GENERATION---</option>		
								
									</select>
								</div>
								
							</div>
							
							<div class="col-sm-3">
								<div id="listcourse">
									<select name="course" class="form-control combo txttext" style="margin-top:20px;" id="course">
										<option value="">---SELECT COURSE---</option>
										
								    </select>
							    </div>
							</div>
							
							<div class="col-sm-3">
								<div id="listclass">
								<select name="classlist" class="combo txttext form-control" style="margin-top:20px;" id="classlist">
									<option value="">---SELECT CLASS---</option>
								
							    </select>
							    </div>
							</div>
							
							<div class="col-sm-3">
								<select name="month" id="month" class="form-control combo txttext" style="margin-top:20px;" onchange="monthFilter()">
									<option value="1">January</option>
									<option value="2">February</option>
									<option value="3">March</option>
									<option value="4">April</option>
									<option value="5">May</option>
									<option value="6">June</option>
									<option value="7">July</option>
									<option value="8">August</option>
									<option value="9">September</option>
									<option value="10">October</option>
									<option value="11">November</option>
									<option value="12">December</option>
								</select>
							</div>
							
							
						</div>
					<!--col-12-->	
					<div class="col-sm-12"><div class="col-sm-12">
						
							<legend>
								<h4>
									<i class="fa fa-list-alt"></i><i><b><span id="monthtext">January </span></b> result </i>
								</h4>
										
							</legend>
						
                    	<div id="liststuresult"></div>
					</div></div><!--close col-12-->	
						
					</div>
					<!--close content row-->
				</div>
				<!--close content fluid-->
			</div>
			<!--close content row-->
			</div>
		</div>
	</div>
	
	<script>
	
	getAllGeneration();
	getAllCourse();
	getAllClass();
	listAllStudentResult();
	function printScore(){
		var gen= $("#gen").val();
		var cour= $("#course").val();
		var classlist=$("#classlist").val();
		var month =$("#month").val();
		window.open("getmonthlylist?generation="+gen+"&course="+cour+"&scoremonth="+month+"&class="+classlist+"","_blank");
	}
	function getAllGeneration(){
		$.ajax({
			url:"listallgeneration",
			type:"POST",
			success:function(data){
				$("#listgeneration").html(listGeneration(data));
				//listAllStudentResult();
			}
			
		});
	}
	function monthFilter(){
		listAllStudentResult();
	}
	function listGeneration(data){
		var gen="<select name='score_gener' class='form-control combo txttext' style='margin-top:20px;'  id='gen' onchange='actionGeneration()'>";
		gen+="<option value=''>---SELECT GENERATION---</option>";
		for(var i=0;i<data.length;i++){
			gen+="<option value='"+data[i].name+"'>"+data[i].name+"</option>";
		}
		gen+="</select>";
		return gen;
	}
	function actionGeneration(){
		
		listAllStudentResult();
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
				//listAllStudentResult(); 
			}
			
		});
	}
 	function listCourse(data){
 	
 		var cou="<select name='score_gener' class='form-control combo txttext' style='margin-top:20px;'  id='course' onchange='actionCourse()'>";
		cou+="<option value=''>---SELECT COURSE---</option>";
		for(var i=0;i<data.length;i++){
			cou+="<option value='"+data[i].course_type+"'>"+data[i].course_type+","+data[i].g_name+"</option>";
		}
		cou+="</select>";
		return cou;
	} 
 	function actionCourse(){
 		listAllStudentResult();
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
				//listAllStudentResult(); 
			}
			
		});
 	}
 	function listClass(data){
 		

 		var cls="<select name='classlist' class='form-control combo txttext' style='margin-top:20px;'  id='classlist' onclick='actionClass()'>";
		cls+="<option value=''>---SELECT CLASS---</option>";
		for(var i=0;i<data.length;i++){
			cls+="<option value='"+data[i].name+"'>"+data[i].name+"("+data[i].course_name+","+data[i].generation+")</option>";
		}
		cls+="</select>";
		return cls;
 	}
 	function actionClass(){
 		listAllStudentResult();
 	}
    function listAllStudentResult(){
    	$.ajax({
    		url: "adminlistallstudentresult",
    		type: "POST",
    		data:{
    			genid : $("#gen").val(),
    			courseid : $("#course").val(),
    			classid : $("#classlist").val(),
    			month : $("#month").val()
    		},
    		success:function(data){
    			$("#monthtext").html(getMonthScore($("#month").val()));
    			$("#liststuresult").html(listResultTB(data));
    			invokeDataTable();
    			loadJavaScorePercent();
    			loadWebScorePercent();
    			loadKoreanScorePercent();
    		}
    		
    	});
    }
    function loadJavaScorePercent(){
    	
    	$.ajax({
    		url: "getjavascore",
    		type: "POST",
    		success:function(data){
    			$("#jscore").html(data+"%");
    		}
    		
    	});
    }
 function loadWebScorePercent(){
    	
    	$.ajax({
    		url: "getwebscore",
    		type: "POST",
    		success:function(data){
    			$("#wscore").html(data+"%");
    		}
    		
    	});
    }
 function loadKoreanScorePercent(){
 	
 	$.ajax({
 		url: "getkoreanscore",
 		type: "POST",
 		success:function(data){
 			$("#kscore").html(data+"%");
 		}
 		
 	});
 }
    function listResultTB(data){
    	var table="<table id='myTable'  class='display' cellspacing='0' width='100%'>";
    	table+=" <thead>";
    	table+="<tr >";
    	table+="<th>Rank</th>";
    	table+="<th>ID</th>";
    	table+="<th>Name</th>";
    	table+="<th>Sex</th>";
    	table+="<th>Class</th>";
    	table+="<th>Course</th>";
    	table+="<th>Generation</th>";
    	table+="<th >J(<span id='jscore'></span>)</th>";
    	table+="<th >W(<span id='wscore'></span>)</th>";
    	table+="<th >K(<span id='kscore'></span>)</th>";
    	table+="<th >A(10%)</th>";
    	table+="<th >Total</th>";
    	
    
    	table+="</tr>";
    	table+="</thead>";
    	
    	table+="<tbody>";
    	for(var i=0;i<data.length;i++){
    		table+="<tr class='myrow' style='height:50px;'>";
    		table+=" <td>"+data[i].rank+"</td>";
        	table+=" <td>"+data[i].stu_id+"</td>";
        	table+=" <td>"+data[i].stu_name+"</td>";
        	table+=" <td>"+checkGender(data[i].stu_gender)+"</td>";
        	table+="<td>"+data[i].cls_name+"</td>";
        	table+="<td>"+data[i].course_type.substring(0,3)+"...</td>";
        	table+="<td>"+data[i].generation_name.substring(0,6)+"...</td>";
        	table+="<td>"+data[i].jscore+"</td>";
        	table+="<td>"+data[i].wscore+"</td>";
        	table+="<td>"+data[i].kscore+"</td>";
        	table+="<td>"+data[i].attscore+"</td>";
        	table+="<td>"+totalScoreStyle(data[i].score)+"</td>";
        	
        	
        	table+="</tr>";
    	}
    	
    	table+="</tbody>";
    	table+="</table>";
    	return table;
		
    }
    function invokeDataTable(){
    	 $('#myTable').DataTable();
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
    function generateScholarship(score){
    	var money=0;
 
    	if(score<70){
    		money=0;
    	}else if(score <=75){
    		money=50;
    	}else if(score <=80){
    		money=60;
    	}else if(score <=85){
    		money=70;
    	}else if(score <=90){
    		money=80;
    	}else if(score <=95){
    		money=90;
    	}else{
    		money=100;
    	}
    	return money;
    }
    function totalScoreStyle(score){
  		var myscore="";
  		if(score<50){
  			myscore+="<span class='scorestyle' style='background:#E53935;'>"+score+"</span>";
  		
  		}else if(score<70){
  			myscore+="<span class='scorestyle' style='background:#1E88E5;'>"+score+"</span>";
  		
  		}else if(score<90){
  			myscore+="<span class='scorestyle' style='background:#43A047;'>"+score+"</span>";
  		}else if(score<100){
  			myscore+="<span class='scorestyle' style='background:#F9A825'>"+score+"</span>";
  		}
  		
  		return myscore;
  	}
    $("#btnexport").click(function (e) {
    	$('#myTable').tableExport({type:'excel',escape:'false'});
	});
$(document).ready( function () {
  
} );    
</script>
<script>
function myFunction() {
    window.print();
}
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