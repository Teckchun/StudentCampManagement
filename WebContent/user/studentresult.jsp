<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Result | HRD</title>
	<link rel="stylesheet" href="../admin/view/bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="../admin/view/plugin/fontawesome/css/font-awesome.min.css">	
  	<link rel="stylesheet" href="../admin/view/css/home.css">
  	<link rel="stylesheet" href="../admin/view/css/formstyle.css">
  	<link href="../admin/view/css/simple-sidebar.css" rel="stylesheet">
  	<link rel="stylesheet" href="../admin/view/css/score.css">
  	<link rel="stylesheet" href="../admin/view/css/fixedbar.css">
  	<link rel="stylesheet" href="../admin/view/css/studentresult.css">
     <link rel="icon" href="../admin/view/images/hrdlogo.png" type="image/png" >
 	<script src="../admin/view/js/jquery.js"></script>
  	<script src="../admin/view/bootstrape/js/bootstrap.min.js"></script>
  	
  	<link rel="stylesheet" type="text/css"
	href="../admin/view/plugin/sweetalert/sweetalert.css">
	<link type="text/css" rel="stylesheet" href="../admin/view/plugin/theme-default/materialadmin.css?1425466319" />
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
  	<link rel="stylesheet" href="../admin/view/plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
  	<script src="../admin/view/plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
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
				<!--open fluid-->
				<div id="test2" class="container-fluid" >
					<!--content row-->
					<div class="row">
						<div class="col-sm-12" style="margin-top:15px;">
							<fieldset>
							
								<div class="col-sm-12" >
                                  
										<legend><h3><i class="fa fa-list-alt"></i><b>Result </b><font size="4">( <span id="des-generation"><c:out value="${sesslogin[4] } ,">  </c:out><c:out value="${sesslogin[5] }"></c:out></span> )</font> </h3></legend>
								</div>
								
							</fieldset>
						</div>
						<div class="col-sm-12" style="padding-bottom: 20px;">
							<div class="col-sm-3"></div>
							<div class="col-sm-3">
								
							</div>
							<div class="col-sm-3">
								<select name="month" id="month"  class="form-control txttext combo"  style="margin-top:20px;">
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
							<div class="col-sm-3">
								<select name="classlist" class="mysearch  form-control txttext combo" style="margin-top:20px;" onchange="changeClass()" id="cls">
									
							    </select>
							</div>
							
						</div>
					<!--col-12-->	
					<div class="col-sm-12">
					<div class="col-sm-12">
					 <legend>
								<h4>
									<i class="fa fa-list-alt"></i><i><b><span id="monthtext">January </span></b> result </i>
								</h4>
										
							</legend>
					</div>
					<div class="col-sm-12" id="resultshow">
                   
					</div></div><!--close col-12-->	
						
					</div>
					<!--close content row-->
				</div>
				<!--close content fluid-->
			</div>
			</div>
			<!--close content row-->
		</div>
	</div>
	
<script>


$(document).ready( function () {
	listStudentClass();
	listStudentResult();
	$("#month").change(function(){
	
		listStudentResult();
	});
	$("#cls").change(function(){
		listStudentResult();
	});
	function listStudentClass(){
		$.ajax({
			url : "liststudentclass",
			type : "POST",
			success : function(data){
				var optionall=$("<option></optoin>");
				optionall.append("All");
				optionall.attr("value","");
				$("#cls").append(optionall);
				for(var i=0;i<data.length;i++){
					var option=$("<option></optoin>");
					option.append(data[i]);
					option.attr("value",data[i]);
					$("#cls").append(option);
				}
				
			}
		});
	}
	function listStudentResult(){
		
		$.ajax({
			url : "liststudentresult",
			type : "POST",
			data:{
				month:$("#month").val(),
				stuclass:$("#cls").val()
			},
			success : function(data){
				
					$("#monthtext").html(getMonthScore($("#month").val()));
					$("#resultshow").html(listTableScore(data));
					invokeDataTable();
					loadJavaScorePercent();
					loadKoreanScorePercent();
					loadWebScorePercent();
					
				
				
			}
		});
	}
function loadJavaScorePercent(){
    	
    	$.ajax({
    		url: "getstujavascore",
    		type: "POST",
    		success:function(data){
    			$("#jscore").html(data+"%");
    		}
    		
    	});
    }
 function loadWebScorePercent(){
    	
    	$.ajax({
    		url: "getstuwebscore",
    		type: "POST",
    		success:function(data){
    			$("#wscore").html(data+"%");
    		}
    		
    	});
    }
 function loadKoreanScorePercent(){
 	
 	$.ajax({
 		url: "getstukoreanscore",
 		type: "POST",
 		success:function(data){
 			$("#kscore").html(data+"%");
 		}
 		
 	});
 }
	function listTableScore(data){
		var table="<table id='myTable'  class='display'cellspacing='0' width='100%'>";
		table+=" <thead> <tr>";
		table+="<th >Rank</th>";
		table+="<th >ID</th>";
		table+="<th>Name</th>";
		table+="<th>Sex</th>";
		table+="<th>Class</th>";
		table+="<th >J(<span id='jscore'></span>)</th>";
    	table+="<th >W(<span id='wscore'></span>)</th>";
    	table+="<th >K(<span id='kscore'></span>)</th>";
    	table+="<th >A(10%)</th>";
    	table+="<th >Total</th>";
		
			table+="</tr></thead>";
		
		table+="<tbody>";
		for(var i=0;i<data.length;i++){
			table+="<tr class='myrow' style='height: 50px'>";
			table+=" <td>"+data[i].rank+"</td>";
			table+=" <td>"+data[i].stu_id+"</td>";
			table+=" <td>"+data[i].stu_name+"</td>";
			table+=" <td>"+checkGender(data[i].stu_gender)+"</td>";
			table+=" <td>"+data[i].cls_name+"</td>";
			table+="<td>"+data[i].jscore+"</td>";
        	table+="<td>"+data[i].wscore+"</td>";
        	table+="<td>"+data[i].kscore+"</td>";
        	table+="<td>"+data[i].attscore+"</td>";
        	table+="<td>"+totalScoreStyle(data[i].score)+"</td>";
			
			
		
			
		}

		table+="</tbody></table>";
		return table;
		
			
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
	function checkGender(data){
		var gender="";
		if(data=='0' || data==0){
			gender="M";
		}else{
			gender="F";
		}
		return gender;
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
   
} );    
</script>
<script>
function myFunction() {
    window.print();
}
</script>
</body>
</html>