<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Class</title>

<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
<link rel="stylesheet"
	href="plugin/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/home.css">

<link href="css/simple-sidebar.css" rel="stylesheet">
<link rel="icon" href="images/hrdlogo.png" type="image/png" >




<link rel="stylesheet" href="css/fixedbar.css">
<link rel="stylesheet" href="css/classlist.css">
<link rel="stylesheet" href="css/formstyle.css">
<script src="js/jquery.js"></script>
<script src="bootstrape/js/bootstrap.min.js"></script>


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
				<!--open fluid-->
				<div id="test2" class="container-fluid">
					<!--content row-->
					<div class="row">
						<div class="col-sm-12">
							<div class="col-sm-12" >
								<div class="row">
								<div class="col-sm-12 myspace"></div>
								
								
							
						
								
								<div class="col-sm-12">
									<fieldset>
									<h3 >
										<legend><i class="fa fa-sitemap" style="padding-bottom: 8px;"></i><b>HRD</b> <font size="4">class room</font></legend>
									</h3>
									</fieldset>
								</div>
							<div class="col-sm-12"  style="padding-bottom: 20px;">
								<div class="row">
								<div class="col-sm-3">
									<div id="listgeneration">
										<select name="score_gener"  class="form-control txttext combo"  id="gen">
											<option value="">---SELECT GENERATION---</option>		
									
										</select>
									</div>
									
								</div>
								
								<div class="col-sm-3">
									<div id="listcourse">
										<select name="course" class=" form-control txttext combo" id="course">
											<option value="">---SELECT COURSE---</option>
											
									    </select>
								    </div>
								</div>
								<div class="col-sm-3">
									<div id="classstatus">
										<select name="status" onchange="listRoom()" class=" form-control txttext combo" id="status">
											<option value="">---CLASS STATUS---</option>
											<option value="0">Finished</option>
											<option value="1" selected>Active</option>
									    </select>
								    </div>
								</div>
								
								<div class="col-sm-3" style="">
									<a href="addclass.jsp"
										class="navbar-left btn btn-primary  btnownstyle"><b class="boldstyle"><i
												class="fa fa-plus"></i>A</b>dd <b class="boldstyle">C</b>lass</a>
								</div>
								
								</div>
							</div>
								<div  id="listclass">
								</div>

						

							</div>
							
							</div>
						</div>
					</div>
				</div>
				<!-- close fluid -->
			</div>
			<!-- close row -->
		</div>
		<!-- end of right content -->
		</div>
	</div>
	<!-- end of wrapper -->
	<script>
	 getAllGeneration();
	 getAllCourse();
		listRoom();
		
		
		  
		    function getAllGeneration(){
				$.ajax({
					url:"listallgeneration",
					type:"POST",
					success:function(data){
						$("#listgeneration").html(listGeneration(data));
						listRoom();
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
				
				getAllCourse();
				listRoom();
				
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
						listRoom();
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
		 		listRoom();
		 		
		 	}
		function listRoom() {
			
			$.ajax({
				url :"listsudentinroom",
				type:"POST",
				data :{
	 				genid :$("#gen").val(),
	 				courseid : $("#course").val(),
	 				clsstatus : $("#status").val()
	 			
	 			},
	 			success:function(data) {
	 				if(data==0 && $("#status").val()=='0'){
	 					
	 				}
					$("#listclass").html(list(data));
				}
			});
		}
		
		function list(data) {
			var str = "";
			for (var i = 0; i < data.length; i++) {
				str += '<div class="col-sm-4">'
						+ '<div class="col-sm-12 thumbnail myclass" >'
						+ '<div class=" mybox">' + '<div class="col-sm-12">'
						+ '<div style="width:15%;float:left">'
				        +'<i class="fa fa-building navbar-left iconstyle"></i>'
						+ '</div>'
						+ '<div style="width:85%;float:left;">'
						+ '<h4 class="clnametext navbar-left">'
						+ data[i].name +' ('+data[i].course_name.substring(0,1) 
						+', '+data[i].generation.substring(0,3) 
						+ ') &nbsp;&nbsp;&nbsp;&nbsp;'+'</h4>'
						
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '<a href="specificstudentlist.jsp?id='+data[i].id+'"><div class="col-sm-12">'
						+ '<div class="totalbox col-sm-12" style="background:'+data[i].color+';">'
						+ '<p class="textpple"><i class="fa fa-user iconstyle"></i>'
						+ data[i].total_studen
						+ ' Students<p>'
						+ '</div>'
						+ '</div></a>'
						+ '<div class="col-sm-12">'
						+ '<div class="boxaction col-sm-12" align="center">'
						+ createEdit(data[i].staus,data[i].id)+checkActive(data[i].staus)
						
						+ '</div>' + '</div>' + '</div>' + '</div>';
			}
			return str;
		}
		function checkActive(data){
			var status="";
			if(data==1){
				status="<b style='color:#8BC34A'>Active</b>";
			}else{
				status="<b style='color: #F44336'>Finished</b>";
			}
			return status;
		}
		function createEdit(data,id){
			var status="";
			if(data==1){
				status='<a href="addclass.jsp?id='+id+'"class="mylink"><i class="fa fa-pencil" title="Edit class"></i></a>';
			}else{
				status="";
			}
			return status;
		}
	</script>

</body>
</html>























