<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Score | HRD</title>
<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
  <link rel="stylesheet" href="plugin/fontawesome/css/font-awesome.min.css">	
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="css/studentlist.css">
  <link rel="stylesheet" href="css/formstyle.css">
   <link href="css/simple-sidebar.css" rel="stylesheet">
   <link rel="icon" href="images/hrdlogo.png" type="image/png" >
     <link rel="stylesheet" type="text/css" href="plugin/sweetalert/sweetalert.css">
   
  <script src="js/jquery.js"></script>
  <script type="text/javascript" src="js/tooltip.js"></script>
  <script src="bootstrape/js/bootstrap.min.js"></script>

   <link rel="stylesheet" href="plugin/jasny-bootstrap/css/jasny-bootstrap.min.css"/>
  <script type="text/javascript" src="plugin/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>

  
<!--Data Table-->
  <link rel="stylesheet" href="plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
  <script src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
  <style>
  	.bgheadstyle{
  		color: #ffffff;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	background-color: #006dcc;
	*background-color: #0044cc;
	background-image: -moz-linear-gradient(top, #0088cc, #0044cc);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0044cc));
	background-image: -webkit-linear-gradient(top, #0088cc, #0044cc);
	background-image: -o-linear-gradient(top, #0088cc, #0044cc);
	background-image: linear-gradient(to bottom, #0088cc, #0044cc);
	background-repeat: repeat-x;
	border-color: #0044cc #0044cc #002a80;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0044cc', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
  	}
  	.bgheadstyle1{
  		background-color:#4CAF50;
  		color:#ffffff;
  	}
  	label.select-text{
  		margin-top: 25px;
  	}
  	span.description-text{
  		font-weight: bold;
  		font-style:italic;
  	}
  	p.des-mo{
  		font-family: Arial;
  	}
  	span#monscore{
  		font-weight: bold;
  		font-style: italic;
  		color: #1d9c73;
  	}
  	span.space{
  		border-bottom: 1px solid #E0E0E0;
  		padding-bottom: 10px;
  		display: inline-block;
  		width: 100%;
  	}
  	.scoreinput{
  		width: 100px;
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
							
							<div class="col-sm-12">
								
								<fieldset>
								<div class="col-sm-12" style="margin-top: 20px;">
									<div class="row">
									<legend><h3><i class="fa fa-bar-chart"></i></i><b>Score</b> <font size="4">Management</font></h3></legend>
									</div>
								</div>
								<!-- open col 12 -->
								<div class="col-sm-12" style="margin-bottom: 20px;">
							<div class="row"><div class="row">
							<div class="col-sm-4">
								
									<div class="row">
								  <p class="col-sm-12 mylabel" >Subject
										</p>
									</div>
								
								<div class="col-sm-12">
									<div class="row" id="addsubject">
										<select name="subject" class="form-control combo txttext"   id="subject">
											
									
										</select>
									</div>
								</div>
								
								
							</div>
							
							<!-- class combobox -->
							<div class="col-sm-4" id="getclass">
								
							</div>
							<!-- end class combobox -->
							<!-- month combobox -->
							 <div class="col-sm-4" id="getmonth">
								
							</div> 
							<!-- end month combobox -->
							</div></div>
						</div>
					<!--col-12-->	
					<div class="row">
					<div id="getscoremodify">
						<div class='row'><div class='row'>
							<div class='col-sm-12'>
								<div class='col-sm-12'>
									
									<!-- //modifying table -->
									<div class='col-sm-12' id="choicescore" style="display:none;">
										 <p class="col-sm-12 mylabel" >Scoring option
										</p>
										<p class="col-sm-2 mylabel" ><input onchange="checkScoreType()" type="radio" id="scoone" name="scoringtype"/> One by one</p>
										<p class="col-sm-2 mylabel" ><input onchange="checkScoreType()" type="radio" id="scoall" name="scoringtype" checked/> All</p>
									</div>
									<div class='col-sm-12'>
										<!-- first table -->
										<div class='col-sm-5'>
											<div class='col-sm-12' style='padding-bottom: 20px;' >
												<div class="row" id="modifydetail"></div>
											</div>
											<div class='col-sm-12'  >
												<div class="row" id="tablemodifying"></div>
											</div>
									<div class="col-sm-12" style="margin-top: 10px;">
									<button type="button" onclick="saveAllScore()" id="btnscoresave" style="display:none;" class="navbar-right btn btn-primary btnstyle"><b class="boldstyle"><i class="fa fa-star"></i>S</b>ave <b  class="boldstyle">S</b>core</button>
									</div>	
										
										</div>
										
										<!-- second table -->
										<div class='col-sm-7'>
											<div class='col-sm-12' style='padding-bottom: 20px;' >
												<div class="row" id="modifieddetail"></div>
											</div>
											<div class='col-sm-12'>
												<div class="row"  id="tablemodified"></div>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div></div>
					</div></div><!-- 	End div wrapper of score modify -->


								</fieldset>
							</div>
							
						</div>
					</div>
					<!--content row-->
				</div></div>
				<!--close fluid-->
			</div>
			</div>
			<!--close row-->
		</div>
	</div>
	

	<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog modal-sm" >

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header bgheadstyle" >
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title" align="center"><b>Modifying Student's Score</b></h4>
							</div>
							<div class="col-sm-12" style="margin-top:15px;padding-bottom: 15px;">
								<p class="col-sm-12"><i><b>Student-id</b></i></p>
								<div class="col-sm-12">
									<input type="text" style="font-style:italic" class="form-control txttext" id="studentid" name="studentid" disabled/>
								</div>
								<p class="col-sm-12"  style="margin-top:10px;"><i><b>Student-Name</b></i></p>
								<div class="col-sm-12">
									<input type="text" style="font-style:italic" class="form-control txttext" id="studentname" name="studentname" disabled/>
								</div>
								<p class="col-sm-12" style="margin-top:10px;"><i><b>Student-Score</b></i></p>
								<div class="col-sm-12">
									<input type="number" onkeyup="validationpoint()" class="form-control txttext" id="studentscore" name="studentscore" />
									<p id="alertshow"></p>
								</div>
							</div>
							<div class="modal-footer">
								<div class="col-sm-12">
									<button type="button" id="scoresave" class="form-control btn btn-primary navbar-left btnmystyle" onclick="saveStudentScore()"
										><b><i class="fa fa-star"></i>S</b>ave</button>
								</div>
								<button type="button" class="btn btn-default" id="close" style="display:none;"
									data-dismiss="modal">Close</button>
								
							</div>
						</div>

					</div>
				</div>

			

			<!--END MODAL-->
			<!-- Modal -->
				<div class="modal fade" id="myModaledit" role="dialog">
					<div class="modal-dialog modal-sm" >

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header bgheadstyle1" >
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title" align="center"><b>Editing Student's Score</b></h4>
							</div>
							<div class="col-sm-12" style="margin-top:15px;padding-bottom: 15px;">
								<p class="col-sm-12"><i><b>Student-id</b></i></p>
								<div class="col-sm-12">
									<input type="text" style="font-style:italic" class="form-control txttext" id="studentide" name="studentid" disabled/>
								</div>
								<p class="col-sm-12"  style="margin-top:10px;"><i><b>Student-Name</b></i></p>
								<div class="col-sm-12">
									<input type="text" style="font-style:italic" class="form-control txttext" id="studentnamee" name="studentname" disabled/>
								</div>
								<p class="col-sm-12" style="margin-top:10px;"><i><b>Student-Score</b></i></p>
								<div class="col-sm-12">
									<input type="text" onkeyup="checkeditscore()" class="form-control txttext" id="studentscoree" name="studentscoree" />
								
								<p id="alertshowe"></p></div>
								
								
							</div>
							<div class="modal-footer">
								<div class="col-sm-12">
								<button type="button" id="btnedit" class="form-control btn btn-success navbar-left btnmystyle" onclick="editStudentScore()"
									><b><span class='glyphicon glyphicon-pencil'></span>&nbsp;&nbsp;E</b>dit</button>
								</div>
								<button type="button" class="btn btn-default" id="closeedit" style="display:none;"
									data-dismiss="modal">Close</button>
								
							</div>
						</div>

					</div>
				</div>
		<input type="hidden" id="scorehelper"/>
			

			<!--END MODAL-->			
	<script src="plugin/sweetalert/sweetalert.min.js"></script>		
	<script>
	
	function checkeditscore(){
		$.ajax({
			url : "checkscorevalidate",
			type : "POST",
			data:{
				subjectid : $("#subject").val()
			},
			success: function(data){
				if($("#studentscoree").val()<data){
					$("#alertshowe").html("<p id='alertshow'></p>");
					$("#btnedit").removeAttr("disabled");
				}
				if($("#studentscoree").val()>data){
					
					$("#btnedit").attr("disabled","disabled");
					$("#alertshowe").html("<p id='alertshow' style='font-style:italic;color:#E53935;'>Maximum score is "+data+"</p>");
				}
				
			}
			
		});
	}
	function validationpoint(){
		$.ajax({
			url : "checkscorevalidate",
			type : "POST",
			data:{
				subjectid : $("#subject").val()
			},
			success: function(data){
				if($("#studentscore").val()<data){
					$("#alertshow").html("<p id='alertshow'></p>");
					$("#scoresave").removeAttr("disabled");
				}
				if($("#studentscore").val()>data){
					
					$("#scoresave").attr("disabled","disabled");
					$("#alertshow").html("<p id='alertshow' style='font-style:italic;color:#E53935;'>Maximum score is "+data+"</p>");
				}
				
			}
			
		});
		
		
	}
    $(document).ready(function(){
    	
    	//validateBox();
    	getSubjectforScore();
    	/* function validateBox(){
    		$("#getclass").css("display","none");
    		$("#getmonth").css("display","none");
    		$("#getscoremodify").css("display","none");
    	} */
    
    	function getSubjectforScore(){
    		
    		$.ajax({
    			url : "admingetsubjectforscore",
    			type : "POST",
    			success: function(data){
    				
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
    	$("#subject").change(function(){
    		$.ajax({
    			url:"admingetclassforscore",
    			type:"POST",
    			data:{
    				subjectid:$("#subject").val()
    			},
    			success:function(data){
    				var getclass="<div class='row'>";
    				getclass+="";
					 getclass+=" <p class='col-sm-12 mylabel' >Class</p></div>";
					getclass+="";
    				getclass+="</div>";
    				getclass+="<div class='col-sm-12'>";
    				getclass+="<div class='row' >";
    			    getclass+="<select name='classlist' class='form-control combo txttext' onchange='getMonth()' id='cls'>";
					getclass+="<option value=''>----SELECT CLASS-----</option>";
    				for(var i=0;i<data.length;i++){
    					getclass+="<option value='"+data[i].id+"'>"+data[i].name+"( "+data[i].course_name+","+data[i].generation+" )</option>";
    				}
    				
    				getclass+="</div></div>";
    				getclass+="</select>";
    				$("#getclass").html(getclass);
    			}
    		});
    		
    	});
    	
    });	
    function getMonth(){
    	
		var showmonth="<div class='row'>";
		showmonth+=" <p class='col-sm-12 mylabel' >Month</p></div>";
		showmonth+="</div>";
		showmonth+="<div class='col-sm-12'>";
		showmonth+="<div class='row'>";
		showmonth+="<select name='month' class='form-control combo txttext' id='month' onchange='getTbScore()'>";
		showmonth+="<option value='1'>January</option>";
		showmonth+="<option value='2'>February</option>";
		showmonth+="<option value='3'>March</option>";
		showmonth+="<option value='4'>April</option>";
		showmonth+="<option value='5'>May</option>";
		showmonth+="<option value='6'>June</option>";
		showmonth+="<option value='7'>July</option>";
		showmonth+="<option value='8'>August</option>";
		showmonth+="<option value='9'>September</option>";
		showmonth+="<option value='10'>October</option>";
		showmonth+="<option value='11'>November</option>";
		showmonth+="<option value='12'>December</option>";
		showmonth+="</select></div></div> ";
		$("#getmonth").html(showmonth);
		getTbScore();
	}
	function getTbScore(){
		/* alert($("#month").val()+" "+$("#cls").val()+" "+$("#subject").val()); */
		
		$("#modifydetail").html("<span class='description-text space' style='color:#1d9c73;' >Score modifying</span>");
		$("#modifieddetail").html("<span class='description-text space' style='color:#1d9c73;' >Score modified</span>");
		getNoScoreStudent();
		getHasScoreStudent();
		
	}
	function getHasScoreStudent(){
		$.ajax({
			url:"admingetspecificstudent",
			type:"POST",
			data:{
				scoremonth:$("#month").val(),
				stuclass:$("#cls").val(),
				stusubject:$("#subject").val()
			},
			success:function(data){
				
				var tbscore="<table class='display' id='myTableMo' cellspacing='0' width='100%'  >";
				tbscore+="<thead>";
				tbscore+="<tr>";
				tbscore+="<th>ID</th><th >Name</th><th>Score</th><th>Modified by</th><th>action</th>";
				tbscore+="</tr>";
				tbscore+="</thead>";
				tbscore+="<tbody>";
				for(var i=0;i<data.length;i++){
				tbscore+="<tr class='myrow' style='height:50px;'> ";
				tbscore+="<td>"+data[i].stu_id+"</td>";
				tbscore+="<td>"+data[i].stu_name+"</td>";
				tbscore+="<td>"+data[i].stu_score+"</td>";
				tbscore+="<td><b style='boldstyle'>"+data[i].staff_name+"("+ staffposition(data[i].staff_position) +")</b></td>";
				var stuname=data[i].stu_name;
				
				stuname= stuname.replace(/ +/g, "");
				tbscore+="<td><button type='button' class='btnmystyle btn  btn-success' data-toggle='modal' data-target='#myModaledit' onclick=getUpdateScore("+data[i].score_id+",'"+data[i].stu_id.trim()+"','"+stuname+"',"+data[i].stu_score+")><span class='glyphicon glyphicon-pencil'></span></button></td>";
				tbscore+="</tr>";
				}
				
				tbscore+="</tbody>";
				tbscore+="</table>";	
				$("#tablemodified").html(tbscore);
				invokeDataTable();
			}
		});
	}
	
	function getNoScoreStudent(){
		
		$.ajax({
			url:"admingetnoscorestudent",
			type:"POST",
			data:{
				scoremonth:$("#month").val(),
				stuclass:$("#cls").val(),
				stusubject:$("#subject").val()
			},
			success:function(data){
				
				var tbscore="<table class='display' id='myTable' cellspacing='0' width='100%'>";
				tbscore+="<thead>";
				tbscore+="<tr>";
				tbscore+="<th >ID</th><th >Name</th><th>action</th>";
				tbscore+="</tr>";
				tbscore+="</thead>";
				tbscore+="<tbody>";
				for(var i=0;i<data.length;i++){
				tbscore+="<tr class='myrow' style='height:50px;'>";
				tbscore+="<td>"+data[i].stu_id+"</td>";
				tbscore+="<td>"+data[i].stu_name+"</td>";
				tbscore+="<td align='center'>";
				tbscore+=onebyone(""+data[i].stu_name+"",""+data[i].stu_id+"");
				tbscore+=allinone(data[i].stu_id);
				tbscore+="</td>";
				tbscore+="</tr>";
				}
				tbscore+="</tbody>";
				tbscore+="</table>"; 
				$("#tablemodifying").html(tbscore);
				invokeDataTable();
				checkScoreType();
				if($("#myTable").find("input").length==0){
					$("#btnscoresave").css("display","none");
				}
				$("#choicescore").css("display","block");
			}
		});
	}
	
	function checkScoreType(){
	
		$("#myTable").find("input").val("");
		if($("#scoall").is(":checked")){
			$(".onebyone").css("display","none");
			$(".scoreinput").css("display","block");
			if($("#myTable").find("input").length==0){
				$("#btnscoresave").css("display","none");
			}else{
				$("#btnscoresave").css("display","block");
			}
			
			$(".textid").html("<p id='errorscore'></p>");
		}else{
			$(".onebyone").css("display","block");
			$(".scoreinput").css("display","none");
			$("#btnscoresave").css("display","none");
			$(".textid").html("<p id='errorscore'></p>");
		}
	}
	function onebyone(name,id){
		var tbscore="";
		var stuname=name;
		stuname= stuname.replace(/ +/g, "");
		tbscore+="<button id='sone' class='btn onebyone btn-primary add btnmystyle' data-toggle='modal' data-target='#myModal' type='button'  onclick=getDataforScore('"+id.trim()+"','"+stuname+"')> <span class='glyphicon glyphicon-plus'></span></button>";
		
		return tbscore;
	}
	function allinone(id){
		var tbscore="";
		
		
		tbscore+="<input  onkeyup=validationpointall('"+id.trim()+"') type='number' id='"+id.trim()+"' class='scoreinput' />";
		tbscore+="<p id='text"+id.trim()+"' class='textid'></p>";
	
		
		return tbscore;
	}
	function saveAllScore(){
	
		//var mop=new Map();
		
		var index=$("#myTable").find("input").length;
		for(var i=0;i<index;i++){
			/* alert($("#myTable").find("input").eq(i).attr('id'));
			alert($("#myTable").find("input").eq(i).val()); */
			var stuid=$("#myTable").find("input").eq(i).attr('id');
			var score=$("#myTable").find("input").eq(i).val();
			if(score>$("#scorehelper").val()){
				swal("Some columns can't be saved!","There are columns with wrong input format","error");
				return;
			}
			//mop.put(stuid, score);
			$.ajax({
				url:"adminsavestudentscore",
				type:"POST",
				data:{
					studentscore:score,
					studentid:stuid,
					subjectid:$("#subject").val(),
					scoremonth:$("#month").val()
				},
				success:function(data){
					if(data==true){
						$("#close").click();
						getHasScoreStudent();
						getNoScoreStudent();
					}else{
						swal("You attempt to add score for a student twice!","Student score has already been modified","error");
					}
					
				}
			});
			
		}
		
		
	}
	
	
	function Map() {
	    this.keys = new Array();
	    this.data = new Object();

	    this.put = function (key, value) {
	        if (this.data[key] == null) {
	            this.keys.push(key);
	        }
	        this.data[key] = value;
	    };

	    this.get = function (key) {
	        return this.data[key];
	    };

	    this.remove = function (key) {
	        this.keys.remove(key);
	        this.data[key] = null;
	    };

	    this.each = function (fn) {
	        if (typeof fn != 'function') {
	            return;
	        }
	        var len = this.keys.length;
	        for (var i = 0; i < len; i++) {
	            var k = this.keys[i];
	            fn(k, this.data[k], i);
	        }
	    };

	    this.entrys = function () {
	        var len = this.keys.length;
	        var entrys = new Array(len);
	        for (var i = 0; i < len; i++) {
	            entrys[i] = {
	                key: this.keys[i],
	                value: this.data[i]
	            };
	        }
	        return entrys;
	    };

	    this.isEmpty = function () {
	        return this.keys.length == 0;
	    };

	    this.size = function () {
	        return this.keys.length;
	    };
	}

	/* function zip(arrayA, arrayB) {
	    var length = Math.min(arrayA.length, arrayB.length);
	    var result = [];
	    for (var n = 0; n < length; n++) {
	        result.push([arrayA[n], arrayB[n]]);
	    }
	    return result;
	} */
	function validationpointall(id){
		$.ajax({
			url : "checkscorevalidate",
			type : "POST",
			data:{
				subjectid : $("#subject").val()
			},
			success: function(data){
				$("#scorehelper").val(data);
				if($("#"+id).val()<data){
					
					$("#text"+id).html("<p id='errorscore' ></p>");
					//$("#scoresave").removeAttr("disabled");
					$("#btnscoresave").removeAttr("disabled");
				}
				if($("#"+id).val()>data){
				
					$("#btnscoresave").attr("disabled","disabled");
					$("#text"+id).html("<p id='errorscore' style='font-style:italic;color:#E53935;'>Maximum score is "+data+"</p>");
				}
				
			}
			
		});
		
		
	}
	function getDataforScore(id,name){
		$("#scoresave").removeAttr("disabled");
		
		$("#studentid").val(id);
		$("#studentname").val(name);
		$("#studentscore").val("");
		$("#alertshow").html("<p id='alertshow'></p>");
	}
	
	function saveStudentScore(){

		$.ajax({
			url:"adminsavestudentscore",
			type:"POST",
			data:{
				studentscore:$("#studentscore").val(),
				studentid:$("#studentid").val(),
				subjectid:$("#subject").val(),
				scoremonth:$("#month").val()
			},
			success:function(data){
				if(data==true){
					$("#close").click();
					getHasScoreStudent();
					getNoScoreStudent();
				}else{
					swal("You attempt to add score for a student twice!","Student score has already been modified","error");
				}
				
			}
		});
	}
	function getUpdateScore(scoreid,id,name,score){
		$("#btnedit").removeAttr("disabled");
		$("#alertshowe").html("<p id='alertshowe'></p>");
		$("#studentide").val(id);
		$("#studentnamee").val(name);
		$("#studentscoree").val(score);
		$("#btnedit").attr("onclick","editStudentScore("+scoreid+")");
	}
	function editStudentScore(id){
		//alert(id);
		$.ajax({
			url:"adminupdatestudentscore",
			type:"POST",
			data:{
				studentscore:$("#studentscoree").val(),
				scoreid:id
				
			},
			success:function(data){
				if(data==true){
					$("#closeedit").click();
					getHasScoreStudent();
					
				}
				
			}
		});
	}
  	function invokeDataTable(){
	$('#myTableMo').DataTable();
  		$('#myTable').DataTable();
    
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
  	function staffposition(position){
  		var myposition="";
  		if(position=="teacher"){
  			myposition+="<span class='scorestyle' style='background:#2196F3;'>"+position+"</span>";
  		}else{
  			myposition+="<span class='scorestyle' style='background:#4CAF50;'>"+position+"</span>";
  		}
  		
  		return myposition;
  	}
    </script>
	

</body>
</html>