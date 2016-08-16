<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="plugin/fontawesome/css/font-awesome.min.css">	
 	<link rel="stylesheet" href="css/home.css">
  	<link rel="stylesheet" href="css/formstyle.css">
  	<link rel="stylesheet" href="css/simple-sidebar.css">
  	<link rel="stylesheet" href="css/fixedbar.css">
  	<link rel="stylesheet" type="text/css"
	href="plugin/sweetalert/sweetalert.css">
	<link rel="icon" href="images/hrdlogo.png" type="image/png" >
	
	<title>Class</title>
  
  	<script src="js/jquery.js"></script>
  	<script src="bootstrape/js/bootstrap.min.js"></script>
 	 <!--color picker-->
 	 <script src="plugin/simplecolorpicker/jquery-simplecolorpicker-master/jquery.simplecolorpicker.js"></script>
 	 <link rel="stylesheet" href="plugin/simplecolorpicker/jquery-simplecolorpicker-master/jquery.simplecolorpicker.css">
 	 
  	<!--  <link type="text/css" rel="stylesheet" href="plugin/theme-default/materialadmin.css?1425466319" />  -->
   
 	 
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
   		 <input type="hidden" value="${param.id}" id="clid"/>
		<div id="page-content-wrapper" >
			<div class="col-sm-12 style-wrapper" >
			<div class="row">
						<form role="form" class="form form-validate" novalidate="novalidate">
							<div class="col-sm-12" >
								<fieldset>
								<div class="col-sm-12" style="margin-top: 15px;" >
							<a href="classlist.jsp" class=" navbar-left btn btn-primary  btnownstyle"><i class="fa fa-undo"></i><b class="boldstyle">B</b>ack</a>
							</div>
									<div class="col-sm-12" >
										<legend><h3><i class="fa fa-pencil"></i><b>Class</b> <font size="4">Management</font></h3></legend>
									</div>
									<div class="form-group">
									<!-- form input student's detail -->
										<div class="col-sm-12" >
											<div class="col-sm-12">
												
													<p class="col-sm-2 mylabel" style="margin-top:15px;">Class:<p>
													<div class="col-sm-10 form-group">
														<input class="form-control txttext" type="text" id="clname"  onkeypress="focusMe(this)" name="cname" placeholder="Enter Class Name" required/>
													</div>
											</div>		
											<div class="col-sm-12">	
												
													<p class="col-sm-2 mylabel" style="margin-top:15px;">Course:<p>
													<div class="col-sm-10 form-group" id="course">
														<!--<select class="form-control"><option>BASIC</option><option>ADVANCED</option></select> -->
													</div>
											</div>		
												
											
											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top:15px;">Description :<p>
												<div class="col-sm-10 form-group">
													<textarea class="form-control txttext" id="cldesc" name="listadd"  onkeypress="focusMe(this)" placeholder="( size , location... )"></textarea>
												</div>
												
											</div>
											<div class="col-sm-12" style="margin-top: 30px;">
												<p class="col-sm-2 mylabel" style="margin-top:15px;">Color to display :<p>
												<div class="col-sm-9" >
													<div class="col-sm-3">
														<select name="colorpicker" id="color">
														  <option value="#7bd148">Green</option>
														  <option value="#5484ed">Bold blue</option>
														  <option value="#a4bdfc">Blue</option>
														  <option value="#46d6db">Turquoise</option>
														  <option value="#7ae7bf">Light green</option>
														  <option value="#51b749">Bold green</option>
														  <option value="#fbd75b">Yellow</option>
														  <option value="#ffb878">Orange</option>
														  <option value="#ff887c">Red</option>
														  <option value="#dc2127">Bold red</option>
														  <option value="#dbadff">Purple</option>
														  <option value="#e1e1e1">Gray</option>
														  <option value="#7E57C2">Gray</option>
														  <option value="#3F51B5">Gray</option>
														  <option value="#651FFF">Gray</option>
														  <option value="#43A047">Gray</option>
														  <option value="#D500F9">Gray</option>
														  <option value="#C51162">Gray</option>
														  <option value="#FF6D00">Gray</option>
														  <option value="#6D4C41">Gray</option>
														  <option value="#FF9E80">Gray</option>
														  <option value="#37474F">Gray</option>
														  <option value="#827717">Gray</option>
														  <option value="#004D40">Gray</option>
														</select><br/>
														<div class="bcolor" id="colo" style="background:#7bd148;"></div>
													</div>
												</div>
												<div class="col-sm-1"></div>
											</div>
											<div class="col-sm-12" style="margin-top: 30px;">
												<div class="col-sm-3">
												
														<button type="button" id="btnedit" class=" navbar-left btn btn-primary  btnownstyle " onclick="saveInfo()" ><i class='fa fa-plus'></i><b class="boldstyle">S</b>ave</button>
													
												</div>
												<div class="col-sm-9"></div>
												
												
											</div>
										</div>
										<!-- close input student's detail		 -->	
									</div>
								</fieldset>
							</div>
						</form> 
				</div>		
			</div>
		</div>
	</div>	
	 <script src="plugin/sweetalert/sweetalert.min.js"></script>					
	<script>	
	 listCourse();
	function listCourse(){
		   $.get("listcourse",function(data){
				   $("#course").html(list(data));
				   });
	   }
	   function list(data){
		   var str='<select class="form-control txttext combo" id="cbocourse">';
		   for(var i=0;i<data.length;i++){
			   str+='<option value='+data[i].id+'>'+data[i].course_type+'('+data[i].g_name+')</option>';
		   }
		   str+='</select>';
	       return  str;	  
	   }
	var ID=function(id){
	    return document.getElementById(id);
	 }
	 
	 function validate(txt,txt1){
	    if(txt.value==""){
		   txt.setAttribute("placeholder",txt1);
		    txt.style.borderColor="red";
			txt.select();
		   txt.focus();
		   return false;
		}else{
			txt.style.borderColor="gray";
			return true;
		}
	 }
	 
      var className=ID("clname");
      var cldes=ID("cldesc");
		
	 function saveInfo(){
		 //alert($("#cbocourse").val());
		if(validate(className,"Class name can't blank")&&
		   validate(cldes,"Class descript can't blank")){
		         $.post("addclass",
				   {
			        classname:$("#clname").val(),
			        color:$("#color").val(),
			        coursetype:$("#cbocourse").val(),
			        description:$("#cldesc").val()	
				   },function(data){
					   clearValue();
					   swal("Status has been saved", "DONE!", "success");
					   setPl(); 
				   });
		}else{
          if(className.value==""){
		     className.style.borderColor="red";
		  }else{
		     className.style.borderColor="gray";
		  }	
          if(cldes.value==""){
		     cldes.style.borderColor="red";
		  }else{
		     cldes.style.borderColor="gray";
		  }		  
		} 
	 }
	 function isEdit(){
		 if($("#clid").val()!=""){
			 toControls();
		 }
	 }
	 isEdit();
	 function toControls(){
		 $.get("tocontrols",
				 {id:$("#clid").val()},
				 function(data){
					 $("#clname").val(data.name);
					 $("#cldesc").val(data.description);
					 $("#colo").css('background-color',data.color);
					 $("#btnedit").html("<b>E</b>dit");
					 $("#btnedit").attr("onclick","editClass("+$("#clid").val()+")");
				 });
	 }
	 
     //Edit process function()
     function editClass(id){
    	 if(validate(className,"Class name can't blank")&&
    			   validate(cldes,"Class descript can't blank")){
    			         $.post("editclass",
    					   {
    			        	id:id, 
    				        classname:$("#clname").val(),
    				        color:$("#color").val(),
    				        coursetype:$("#cbocourse").val(),
    				        description:$("#cldesc").val()	
    					   },function(data){
    						   clearValue();
    						   swal("Class has been updated", "DONE!", "success");
    						   $("#btnedit").html("Save");
    							$("#btnedit").attr("onclick","saveInfo()");
    							listCourse();
    						   setPl(); 
    					   });
    			}else{
    	          if(className.value==""){
    			     className.style.borderColor="red";
    			  }else{
    			     className.style.borderColor="gray";
    			  }	
    	          if(cldes.value==""){
    			     cldes.style.borderColor="red";
    			  }else{
    			     cldes.style.borderColor="gray";
    			  }		  
    			} 
     }
	 
	 ///Out Work
	 function focusMe(id){
	    id.style.borderColor="gray";
	 }
	 function clearValue(){
		ID("clname").focus();
        ID("clname").value="";
        ID("cldesc").value="";
	 }
	 function setPl(){
		ID("clname").focus();
        ID("clname").setAttribute("placeholder","Enter Class Name");
        ID("cldesc").setAttribute("placeholder","( size , location... )");
	 }
	 function checkRd1(){
	    ID("rd1").checked=true;
	 }
	 function checkRd2(){
	    ID("rd2").checked=true;
	 }
	 function checkRd3(){
	    ID("rd3").checked=true;
	 }
	 function checkRd4(){
	    ID("rd4").checked=true;
	 }
    </script>
	<script>
   $('select[name="colorpicker"]').simplecolorpicker();
   $('select[name="colorpicker"]').simplecolorpicker('selectColor', '#7bd148');
   $('select[name="colorpicker"]').simplecolorpicker('destroy');

   $('select[name="colorpicker"]').simplecolorpicker({
  picker: true
  }).on('change', function() {
  $("#colo").css('background-color', $('select[name="colorpicker"]').val());
  });
   </script>
   <script type="text/javascript">
  /*  $("#btnedit").click(function() {
		swal("Status has been changened", "DONE!", "success");
	}); */
   </script>
 
</body>
</html>




































