<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">





<title>Personal Infomation | HRD</title>
	<link rel="stylesheet" href="../admin/view/bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="../admin/view/plugin/fontawesome/css/font-awesome.min.css">	
  	<link rel="stylesheet" href="../admin/view/css/home.css">
  	<link rel="stylesheet" href="../admin/view/css/formstyle.css">
  	<link rel="stylesheet" href="../admin/view/plugin/jasny-bootstrap/css/jasny-bootstrap.min.css">
  	<link href="../admin/view/css/simple-sidebar.css" rel="stylesheet">
  	<link rel="stylesheet" href="../admin/view/css/fixedbar.css">
  	<link rel="stylesheet" href="../admin/view/plugin/boostrapvalidator/css/bootstrapValidator.css"/>
  	<link rel="stylesheet" type="text/css" href="../admin/view/plugin/sweetalert/sweetalert.css">
  <link rel="icon" href="../admin/view/images/hrdlogo.png" type="image/png" >
  	<script src="../admin/view/js/jquery.js"></script>
    <script src="../admin/view/plugin/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
  	<script src="../admin/view/bootstrape/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="../admin/view/plugin/boostrapvalidator/js/bootstrapValidator.js"></script>
	
    <!--for calendar time picker-->
 

  	<link type="text/css" rel="stylesheet" href="../admin/view/plugin/theme-default/materialadmin.css?1425466319" />
    <link rel="stylesheet" href="../admin/view/plugin/Zebra_Datepicker-master/public/css/default.css" type="text/css"/>
	
  <style>
	p.mylabel{
		margin-top: 5px;
	
	}
	#sid,#fn,#ln,#ap,#dob,#plb,#padd,#stt,#endt,#stdate,#mphone,#memail,#faname,#faphone,#faadd,
	#maphone,#mname,#madd,#ecphon{
/*	   border-color:rgb(128,128,255);*/
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
		<div id="page-content-wrapper" >
		<div class="col-sm-12 style-wrapper" >
			<div class="row">
				<!--open fluid-->
				<div id="test2" class="container-fluid" >
					<!--content row-->
					<div class="row">
						<div class="col-sm-12" >
						<form id="defaultForm" class="form-horizontal">
							<fieldset>
								<div class="col-sm-12" style="margin-top:15px;">
									<legend><h3><b><i class="fa fa-pencil"></i>Student </b><font size="4">Personal's Information</font></h3></legend>
								</div>
								
									<div class="col-sm-12">
										<div class="col-sm-12"><div class="col-sm-12">			
										
										<div class="fileinput fileinput-new" data-provides="fileinput">
                                             <div class="fileinput-preview thumbnail" data-trigger="fileinput" id="profileshow" style="width: 200px; height: 150px;"></div>
                                              <!-- <div>
                                                   <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
                                                   <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                              </div> -->
                                            </div>
										</div></div>												
									</div>
									
								
									
									<!--form input student's detail-->
								
									<div class="col-sm-12" style="margin-top:20px;padding-bottom: 50px;">
									
									
										<div class="col-sm-12">
											<p class="col-sm-2 mylabel"  style="margin-top:15px;">Name :<p>
											<div class="col-sm-4 form-group">
												<input class="form-control txttext " disabled type="text" name="txtfname" placeholder="First Name" onkeypress="focusMe(this)" id="fn"/>
											</div>
											
											<div class="col-sm-3 form-group" style="margin-left:40px;" >
												<input class="form-control txttext" disabled type="text" name="txtlname" placeholder="Last Name" onkeypress="focusMe(this)"  id="ln"/>
											</div>
											<p class="col-sm-1 mylabel " style="margin-left:8px;">Gender:<p>
											<div class="col-sm-2 form-group">
									
												<select name="gender" class="form-control txttext combo" id="gen">
													<option value="0">Male</option>
													<option value="1">Female</option>
													
												</select>
											</div>
											
											
										</div>
										<div class="col-sm-12">
											<p class="col-sm-2 mylabel" style="margin-top:15px;">DOB :<p>
											<div class="col-sm-10 form-group">
												<input class="form-control txttext  datepicker" type="text" name="dob"  placeholder="Your Birth's Date" id="dob"/>
											</div>
										
										</div>
										<div class="col-sm-12">
											<p class="col-sm-2 mylabel" style="margin-top:15px;">POB :<p>
											<div class="col-sm-10 form-group">
												<textarea class="form-control txttext" name="listpob"  placeholder="( N , Serg Khat , Khan , city/province... )" id="plb"></textarea>
											</div>
											
										</div>
										<div class="col-sm-12">
											<p class="col-sm-2 mylabel" style="margin-top:15px;">Per-Address :<p>
											<div class="col-sm-10 form-group">
												<textarea class="form-control txttext" name="listadd" placeholder="( N , Serg Khat , Khan , city/province... )" onkeypress="focusMe(this)"  id="padd"></textarea>
											</div>
										
										</div>
									
										
										<div class="col-sm-12">
											<p class="col-sm-2 mylabel"  style="margin-top:15px;">Contact :<p>
											<p class="col-sm-1 mylabel" style="margin-left:14px;">Phone<p>
											<div class="col-sm-4 form-group">
												<input class="form-control txttext" type="text" name="txtstuphone" placeholder="Phone" onkeypress="focusMe(this)" id="mphone"/>
											</div>
											<p class="col-sm-1 mylabel " style="margin-left:14px;">Email<p>
											<div class="col-sm-4 form-group">
												<input class="form-control txttext" type="text" disabled name="txtstuemail" placeholder="Email" onkeypress="focusMe(this)" id="memail"/>
											</div>
											
										</div>
										<div class="col-sm-12">
											<p class="col-sm-2 mylabel"  style="margin-top:15px;">Father's Detail :<p>
											<p class="col-sm-1 mylabel" style="margin-left:14px;">Name<p>
											<div class="col-sm-4 form-group">
												<input class="form-control txttext" type="text" name="txtfathername" placeholder="Name" onkeypress="focusMe(this)" id="faname"/>
											</div>
											<p class="col-sm-1 mylabel" style="margin-left:14px;">Phone<p>
											<div class="col-sm-4 form-group">
												<input class="form-control txttext" type="text" name="txtfatherphone" placeholder="phone" onkeypress="focusMe(this)" id="faphone"/>
											</div>
											
										
											
										</div>
										
										
										<div class="col-sm-12">
											<p class="col-sm-2 mylabel"  style="margin-top:15px;">Mother's Detail :<p>
											<p class="col-sm-1 mylabel" style="margin-left:14px;">Name<p>
											<div class="col-sm-4 form-group">
												<input class="form-control txttext" type="text" name="txtmothername" placeholder="Name" onkeypress="focusMe(this)" id="mname"/>
											</div>
											<p class="col-sm-1 mylabel" style="margin-left:14px;">Phone<p>
											<div class="col-sm-4 form-group">
												<input class="form-control txttext" type="text" name="txtmotherphone" placeholder="phone" onkeypress="focusMe(this)" id="maphone"/>
											</div>
											
										
											
										</div>
										<div class="col-sm-12">
											<p class="col-sm-2 mylabel" style="margin-top:15px;">Parents' Address :<p>
											<div class="col-sm-10 form-group">
												<textarea class="form-control txttext" name="listparentadd" placeholder="( N , Serg Khat , Khan , city/province... )" onkeypress="focusMe(this)"  id="parentadd"></textarea>
											</div>
											
										</div>
										
										
										
										<div class="col-sm-12">
											<p class="col-sm-2 mylabel" style="margin-top:15px;">E-Contact :<p>
											<div class="col-sm-10 form-group">
												<input class="form-control txttext" type="text" name="ecphone" placeholder="Enter Phone"  id="ecphon"/>
											</div>
											
										</div>
										<div class="col-sm-12">
										    <div class="col-sm-5"></div>
											<div class="col-sm-4 form-group" id="errm" style="text-align:center; background-color:rgb(237,31,41); visibility:hidden;">
												<span id="error"></span>
											</div>
											<div class="col-sm-3 form-group">
												<div class="row">
													<input type="button" class=" navbar-right btn btn-primary  btnownstyle " value="Update" onclick="updatePersonalInfo()"/>
												</div>
												
											</div>
											
										</div>
										 
									</div>
									
									<!--close input student's detail-->
								
							</fieldset>
							</form>
						</div>
					</div>
					<!--close row-->
				</div>
				<!--close fluid-->
			</div>
			</div>
			<!--close row-->
		</div>
		
	
	
	</div>
		
	<script src="../admin/view/plugin/sweetalert/sweetalert.min.js"></script>
	 <script type="text/javascript" src="../admin/view/plugin/Zebra_Datepicker-master/public/javascript/zebra_datepicker.js"></script>
	 <script>
			$(document).ready(function() {

				// assuming the controls you want to attach the plugin to 
				// have the "datepicker" class set
				$('input.datepicker').Zebra_DatePicker();

			});
		</script>
	<script>
	
		getPersonalStudentInfo();
		function getPersonalStudentInfo(){
			var stuidjs='<c:out value="${sesslogin[0] }"></c:out>';
			
			 $.ajax({
				url : "studentpersonal",
				type : "POST",
				data:{
					stuid : stuidjs
				},
				success : function(data){
					getData(data);
				}
				
				
			});
			
		}
		function getData(data){
			$("#fn").val(data.fname);
			$("#ln").val(data.lname);
			var gender="";
			 if(data.gender==0 || data.gender=='0'){
				gender="0";
			}else gender="1"; 
			$("#gen").val(gender);
			$("#dob").val(data.dob);
			$("#plb").val(data.pob);
			$("#padd").val(data.paddr);
			$("#mphone").val(data.phone);
			$("#memail").val(data.email);
			$("#faname").val(data.fa_name);
			$("#faphone").val(data.fa_phone);
			$("#mname").val(data.mo_name);
			$("#maphone").val(data.mo_phone);
			$("#parentadd").val(data.parents_addr);
			$("#ecphon").val(data.emergency_contact);
			var proimg="<img src='../imgprofiles/"+data.profiles+"'>";
			$("#profileshow").append(proimg);
			
		}
		
		 function updatePersonalInfo(){
			
			 $.ajax({
				url : "updatepersonalinfo",
				type: "POST",
				data:{
					firstname : $("#fn").val(),
					lastname : $("#ln").val(),
					gender : $("#gen").val(),
					dob : $("#dob").val(),
					pob :$("#plb").val(),
					permadd :$("#padd").val(),
					stuphone : $("#mphone").val(),
					stuemail :$("#memail").val(),
					fathername : $("#faname").val(),
					fatherphone :$("#faphone").val(),
					mothername : $("#mname").val(),
					motherphone : $("#maphone").val(),
					parentaddress : $("#parentadd").val(),
					emergencyphone : $("#ecphon").val()
				},
				success:function(data){
					if(data==true){
						swal("Your Personal data has been updated successfully", "", "success");
					}else{
								
					}
				}
			});
			 
			
		} 
	</script>
 
<script type="text/javascript">
$(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
               txtfname: {
                message: 'The first name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The first name is required and can\'t be empty',
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'The first name must be more than 2 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The first name can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            txtlname: {
                message: 'The last name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The last name is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'The last name must be more than 2 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The last name can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            txtfathername: {
                message: 'The last name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The last name is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'The last name must be more than 2 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The last name can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            txtmothername: {
                message: 'The last name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The last name is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'The last name must be more than 2 and less than 30 characters long'
                    },
                   
                }
            },
            listpob: {
                message: 'The place of birth is not valid',
                validators: {
                    notEmpty: {
                        message: 'The place of birth is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 2,
                        max: 100,
                        message: 'The place of birth must be more than 2 and less than 100 characters long'
                    },
                   
                }
            },
            
            listadd: {
                message: 'The address is not valid',
                validators: {
                    notEmpty: {
                        message: 'The address is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 2,
                        max: 100,
                        message: 'The address must be more than 2 and less than 100 characters long'
                    },
                   
                }
            },
            listparentadd : {
                message: 'The parents address is not valid',
                validators: {
                    notEmpty: {
                        message: 'The parents address is required and can\'t be empty'
                    },
                    stringLength: {
                        min: 2,
                        max: 100,
                        message: 'The parents address must be more than 2 and less than 100 characters long'
                    },
                   
                }
            },
            txtstuemail: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and can\'t be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            txtstuphone: {
                validators: {
                    digits: {
                        message: 'The value can contain only digits'
                    }
                }
            },
            txtfatherphone: {
                validators: {
                    digits: {
                        message: 'The value can contain only digits'
                    }
                }
            },
            txtmotherphone: {
                validators: {
                    digits: {
                        message: 'The value can contain only digits'
                    }
                }
            },
            ecphone: {
                validators: {
                    digits: {
                        message: 'The value can contain only digits'
                    }
                }
            },
           
        }
    });
});
</script>
</body>
</html>