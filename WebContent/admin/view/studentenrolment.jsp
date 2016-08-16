<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Enrollment | HRD</title>
<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
<link rel="stylesheet"
	href="plugin/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/formstyle.css">
<link rel="stylesheet"
	href="plugin/jasny-bootstrap/css/jasny-bootstrap.min.css">
<link href="css/simple-sidebar.css" rel="stylesheet">
<link rel="icon" href="images/hrdlogo.png" type="image/png" >
<script src="js/jquery.js"></script>
<script src="bootstrape/js/bootstrap.min.js"></script>
<script src="plugin/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
<!--for calendar time picker-->
<script type="text/javascript"
	src="plugin/TimePicki-master/TimePicki-master/js/jquery.min.js"></script>

<link rel="stylesheet"
	href="plugin/Zebra_Datepicker-master/public/css/default.css"
	type="text/css" />
	<link rel="stylesheet" type="text/css" href="plugin/sweetalert/sweetalert.css">
<script src="plugin/sweetalert/sweetalert.min.js"></script>
<style>
p.mylabel {
	margin-top: 5px;
}

#sid, #fn, #ln, #ap, #dob, #plb, #padd, #stt, #endt, #stdate, #mphone,
	#memail, #faname, #faphone, #faadd, #maphone, #mname, #madd, #ecphon {
	/*	   border-color:rgb(128,128,255);*/
	
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
        <input type="hidden" value="${param.id}" id="editid">
		<!--content right-->
		<div id="page-content-wrapper">
			<div class="col-sm-12 style-wrapper" >
			<div class="row">
				<!--open fluid-->
				<div id="test2" class="container-fluid">
					<!--content row-->
					<div class="row">
						<div class="col-sm-12">

							<form role="form" class="form form-validate"
								novalidate="novalidate">
								<fieldset>
								<div class="col-sm-12" style="margin-top: 25px;">
							<a href="studentlist.jsp" class=" navbar-left btn btn-primary  btnownstyle"><i class="fa fa-undo"></i>Back</a>
							</div>
									<div class="col-sm-12">
										<legend>
											<h3>
												<i class="fa fa-pencil"></i><b>Student </b><font size="4">Enrolment</font>
											</h3>
										</legend>
									</div>
									<div class="form-group" onsubmit="return saveInfo()">
										<div class="col-sm-12">
											<div class="col-sm-12">

												<div class="fileinput fileinput-new"
													data-provides="fileinput">
													<div class="fileinput-preview thumbnail"
														data-trigger="fileinput"
														style="width: 200px; height: 150px;">
														<img id="image" />
													</div>
													<div>
														<span class="btn btn-default btn-file"><span
															class="fileinput-new">Select image</span><span
															class="fileinput-exists">Change</span><input type="file"
															name="studentimg" id="studentimg"></span> <a href="#"
															class="btn btn-default fileinput-exists"
															data-dismiss="fileinput">Remove</a>
													</div>
												</div>
											</div>
										</div>
										<!--form input student's detail-->

										<div class="col-sm-12"
											style=" padding-bottom: 10px;">
											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">Student's
													ID :
												<p>
												<div class="col-sm-6 form-group">
													<input class="form-control txttext " type="text" name="sid"
														placeholder="Enter Student ID" 
														id="sid" disabled="disabled"/>
												</div>
												
											</div>

											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">Name
												<p>
												<div class="col-sm-3 form-group">
													<input class="form-control txttext" type="text"
														name="txtfname" placeholder="First Name"
														onkeypress="focusMe(this)" id="fn" required
														data-rule-minlength="2" />
												</div>
												<div class="col-sm-3 form-group">
													<input class="form-control txttext" type="text"
														name="txtlname" placeholder="Last Name"
														onkeypress="focusMe(this)" id="ln" required
														data-rule-minlength="2" />
												</div>
												<p class="col-sm-1 mylabel">Gender :
												<p>
												<div class="col-sm-3 form-group">
													<select name="gender" class="form-control txttext combo" id="gender">
														<option value="0">Male</option>
														<option value="1">Female</option>
													</select>
												</div>
												
											</div>
											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">DOB
												<p>
												<div class="col-sm-10 form-group">
													<input class="form-control txttext datepicker" type="text" name="dob"
														data-inputmask="'alias': 'date'" onblur="focusMe(this)"
														placeholder="Your Birth's Date" id="dob"
														data-source="../../html/forms/data/countries.json.html"
														required /> <input type="hidden" id="autocomplete1"
														class="form-control"
														data-source="../../html/forms/data/countries.json.html"
														placeholder="Countries">
												</div>
												
											</div>
											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">POB
												<p>
												<div class="col-sm-10 form-group">
													<textarea class="form-control txttext" name="listpob"
														onkeypress="focusMe(this)"
														placeholder="( N , Serg Khat , Khan , city/province... )"
														id="plb" required></textarea>
												</div>
												
											</div>
											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">P-
													Address :
												<p>
												<div class="col-sm-10 form-group">
													<textarea class="form-control txttext" name="listadd"
														placeholder="( N , Serg Khat , Khan , city/province... )"
														onkeypress="focusMe(this)" id="padd" required></textarea>
												</div>
											
											</div>
											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">Class's
													detail :
												<p>
												<p class="col-sm-1 mylabel">University:
												<p>
												<div class="col-sm-3 form-group">
								                    <input class="form-control txttext" type="text" name="sid"
														placeholder="Enter University" 
														id="unisity" />
												</div>
												<p class="col-sm-1 mylabel">Course
												<p>
												<div class="col-sm-2" id="displaycourse"></div>
												<p class="col-sm-1 mylabel">Room
												<p>
												<div class="col-sm-2" id="displayclass"></div>
												

											</div>
											
											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">Contact
													:
												<p>
												<p class="col-sm-1 mylabel">Phone
												<p>
												<div class="col-sm-3 form-group">
													<input class="form-control txttext" type="text" id="phone"
														name="txtstuphone" placeholder='Phone'
														 />
												</div>
												<p class="col-sm-1 mylabel">Email
												<p>
												<div class="col-sm-5 form-group">
													<input class="form-control txttext" type="email"
														name="txtstuemail" placeholder="Email"
														onkeypress="focusMe(this)" id="email" required />
												</div>
												
											</div>
											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">Father's
													Detail :
												<p>
												<p class="col-sm-1 mylabel">Name
												<p>
												<div class="col-sm-3 form-group">
													<input class="form-control txttext" type="text"
														name="txtfathername" placeholder="Name"
														 id="faname" required />
												</div>
												<p class="col-sm-1 mylabel">Phone
												<p>
												<div class="col-sm-5 form-group">
													<input class="form-control txttext" type="text"
														name="txtfatherphone"
														data-inputmask="'mask': '(999) 999-9999'"
														data-source="../../html/forms/data/countries.json.html"
														placeholder="phone" 
														id="faphone" required />
												</div>


												
											</div>


											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">Mother's
													Detail :
												<p>
												<p class="col-sm-1 mylabel">Name
												<p>
												<div class="col-sm-3 form-group">
													<input class="form-control txttext" type="text"
														name="txtmothername" placeholder="Name"
														onkeypress="focusMe(this)" id="moname" required />
												</div>
												<p class="col-sm-1 mylabel">Phone
												<p>
												<div class="col-sm-5 form-group">
													<input class="form-control txttext" type="text"
														name="txtmotherphone"
														data-inputmask="'mask': '(999) 999-9999'"
														data-source="../../html/forms/data/countries.json.html"
														placeholder="phone" onkeypress="focusMe(this)"
														id="mophone" required />
												</div>


												
											</div>
											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">Parents'
													Address :
												<p>
												<div class="col-sm-10 form-group">
													<textarea class="form-control txttext" name="listadd" 
														placeholder="( N , Serg Khat , Khan , city/province... )"
														onkeypress="focusMe(this)" id="pardd"></textarea>
												</div>
												
											</div>



											<div class="col-sm-12">
												<p class="col-sm-2 mylabel" style="margin-top: 15px;">E-
													Contact :
												<p>
												<div class="col-sm-10 form-group">
													<input class="form-control txttext" type="text"
														name="ecphone" data-inputmask="'mask': '(999) 999-9999'"
														data-source="../../html/forms/data/countries.json.html"
														placeholder="Enter Phone" onkeypress="focusMe(this)"
														id="ecphone" required />
												</div>
												
											</div>
											<div class="col-sm-12">
												<div class="col-sm-5"></div>
												<div class="col-sm-4" id="errm"
													style="text-align: center; background-color: rgb(237, 31, 41); visibility: hidden;">
													<span id="error"></span>
												</div>
												<div class="col-sm-3">
													<div class="col-sm-12 form-group">
														<input type="button"
															class=" navbar-right btn btn-primary  btnownstyle "
															value="Save" id="btnsave" onclick="saveAllInfo()" />

													</div>
												</div>
												
											</div>

										</div>

										<!--close input student's detail-->
									</div>
								</fieldset>
							</form>
						</div>
					</div>
					<!--close row-->
				</div>
				<!--close fluid-->
			</div>
			<!--close row-->
		</div>
		</div>
	</div>
	<script type="text/javascript"
		src="plugin/Zebra_Datepicker-master/public/javascript/zebra_datepicker.js"></script>
		
	<script>
		$(document).ready(function() {
			$('input.datepicker').Zebra_DatePicker();

		});
		function listClass() {
			$.get("listclassincourse",
					{
				     courseid:$("#cbocourse").val()
					},function(data) {
				$("#displayclass").html(listCls(data));
			});
		}
		function listCls(data) {
			var str = '<select class="form-control txttext combo" id="cboclass">';
			for (var i = 0; i < data.length; i++) {
				    	str += '<option value='+data[i].id+'>'+data[i].name+'</option>';	

				}	
			str += '</select>';
			return str;
		}
		listCourse();
		function listCourse() {
			$.get("listcourse", function(data) {
				$("#displaycourse").html(listCrs(data));
				listClass();
			});
		}
		function listCrs(data) {
			var str = '<select class="form-control txttext combo" id="cbocourse" onchange="listClass()">';
			for (var i = 0; i < data.length; i++) {
				str += '<option value='+data[i].id+'>' + data[i].course_type+' ('+data[i].g_name+ ')</option>';
			}
			str += '</select>';
			return str;
		}
		/* listClass();
		function listClass() {
			$.get("listclass", function(data) {
				$("#displayclass").html(listCls(data));
			});
		}
		function listCls(data) {
			var str = '<select class="form-control" id="cboclass">';
			for (var i = 0; i < data.length; i++) {
				str += '<option value='+data[i].id+'>' + data[i].name
						+ '</option>';
			}
			str += '</select>';
			return str;
		} */
		/* $("#studentimg").change(function(){
			alert($("#studentimg").val());
		}); */
		function myuploadimg() {
			var data1;
			data1 = new FormData();
			data1.append('file', $('#studentimg')[0].files[0]);
			$
					.ajax({
						url : "uploadstudentimage",
						type : "POST",
						cache : false,
						contentType : false,
						processData : false,
						data : data1,
						success : function(data) {
							//if (data == true) {
								//swal("Your Profile image has been updated successfully","DONE!", "success")
							//} else {
								//alert("ok");
							//}
						}
					});
		}
		//getAutoId();
		function getAutoId(){
			$.get("getautoid",function(data){
				$("#sid").val(data);
			});
		}
		
	    function saveInfo(){
	    	var fullPath = document.getElementById('studentimg').value;
			var filename="";
			if (fullPath) {
				var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
				 filename = fullPath.substring(startIndex);
				if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
					filename = filename.substring(1);
				}
				//alert(filename);
			}
	    	 $.post("savestudent",
	    			{
	    		      id:$("#sid").val(),
	    		      fname:$("#fn").val(),
	    		      lname:$("#ln").val(),
	    		      username:$("#username").val(),
	    		      password:$("#pwd").val(),
	    		      gender:$("#gender").val(),
	    		      dob:$("#dob").val(),
	    		      pob:$("#plb").val(),
	    		      padd:$("#padd").val(),
	    		      course:$("#cbocourse").val(),
	    		      phone:$("#phone").val(),
	    		      email:$("#email").val(),
	    		      faname:$("#faname").val(),
	    		      faphone:$("#faphone").val(),
	    		      moname:$("#moname").val(),
	    		      mophone:$("#mophone").val(),
	    		      pardd:$("#pardd").val(),
	    		      emergency:$("#ecphone").val(),
	    		      university:$("#unisity").val(),
	    		      profile:filename,
	    		      classname:$("#cboclass").val()	  
	    			},function(date){
	    				isselectimg=false;
	    				getAutoId();
	    				clearControl();
	    				swal("Information has been added!", "", "success");
	    			});
	    }
	    var isselectimg=false;
	    var ischange=false;
	    $("#studentimg").change(function(){
	    	isselectimg=true;
	    	ischange=true;
	    });
	    
	    function clearControl(){
		      $("#fn").val("");
		      $("#ln").val("");
		      $("#username").val("");
		      $("#pwd").val("");
		      $("#gender").val("0");
		      $("#dob").val("");
		      $("#plb").val("");
		      $("#padd").val("");
		      
		      $("#phone").val("");
		      $("#email").val("");
		      $("#faname").val("");
		      $("#faphone").val("");
		      $("#moname").val("");
		      $("#mophone").val("");
		      $("#pardd").val("");
		      $("#ecphone").val("");
		      $("#unisity").val("");
		      $("#studentimg").val("");
		     	
		      $("#fn").focus();
	    }
	    function saveAllInfo(){
	    	if(isselectimg){
	    		saveInfo();
	    		myuploadimg();
	    	}else{
	    		alert("Please select image!");
	    	}
	    }
	    function alertEditId(){
	    	if($("#editid").val()!=""){
	    		toControls();
	    		
	    		
	    	}else{
	    		getAutoId();
	    	}
	    }
	    alertEditId();
	    function toControls(){
	    	
	    	$.get("get1studentinfo",
	    			{
	    		      id:$("#editid").val()
	    	        },function(data){
	    	        	
	    	        	  $("#sid").val($("#editid").val());
	    	        	  $("#fn").val(data.fname);
	    			      $("#ln").val(data.lname);
	                      var g=data.gender;
	                      if(g==0)
	    			     	 $("#gender").val("0");
	                      else
	                    	  $("#gender").val("1"); 
	    			      $("#dob").val(data.dob);
	    			      $("#plb").val(data.pob);
	    			      $("#padd").val(data.paddr);
	    			      $("#cbocourse").val(data.course_id);
	    			      $("#phone").val(data.phone);
	    			      $("#email").val(data.email);
	    			      $("#faname").val(data.fa_name);
	    			      $("#faphone").val(data.fa_phone);
	    			      $("#moname").val(data.mo_name);
	    			      $("#mophone").val(data.mo_phone);
	    			      $("#pardd").val(data.parents_addr);
	    			      $("#ecphone").val(data.emergency_contact);
	    			      $("#unisity").val(data.universit);
	    			      $("#image").attr("src","../../imgprofiles/"+data.profiles);
	    			      $("#cboclass").val(data.class_id);
	    			      $("#btnsave").val("Edit");
	    			      $("#btnsave").attr("onclick","toEdit('"+data.stu_id+"')");
	    			      oldimg=data.profiles;
	    	        });
	    }
	    function toEdit(id){
	    	var img;
	    	if(ischange){
	    		var fullPath = document.getElementById('studentimg').value;
				var filename="";
				if (fullPath) {
					var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
					 filename = fullPath.substring(startIndex);
					if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
						filename = filename.substring(1);
					}
	    		myuploadimg();
	    		img=filename;
				}
	    	}else{
	    		img=oldimg;
	    	}
	    	  $.post("updatestudent",
		    			{
		    		      id:$("#sid").val(),
		    		      fname:$("#fn").val(),
		    		      lname:$("#ln").val(),
		    		      gender:$("#gender").val(),
		    		      dob:$("#dob").val(),
		    		      pob:$("#plb").val(),
		    		      padd:$("#padd").val(),
		    		      course:$("#cbocourse").val(),
		    		      phone:$("#phone").val(),
		    		      email:$("#email").val(),
		    		      faname:$("#faname").val(),
		    		      faphone:$("#faphone").val(),
		    		      moname:$("#moname").val(),
		    		      mophone:$("#mophone").val(),
		    		      pardd:$("#pardd").val(),
		    		      emergency:$("#ecphone").val(),
		    		      university:$("#unisity").val(),
		    		      profile:img,
		    		      classname:$("#cboclass").val()	  
		    			},function(date){
		    				ischange=false;
		    				getAutoId();
		    				clearControl();
		    				 $("#btnsave").val("Save");
		    			     $("#btnsave").attr("onclick","saveAllInfo()");
		    			     swal("Information has been updated!", "", "success");
		    			});
	    }
	</script>


</body>
</html>