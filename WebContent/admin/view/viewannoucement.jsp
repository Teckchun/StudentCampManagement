<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Announcement | HRD</title>

 <link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="plugin/fontawesome/css/font-awesome.min.css">	
 	<link rel="stylesheet" href="css/home.css">
  	<link rel="stylesheet" href="css/formstyle.css">
  	<link rel="stylesheet" href="css/simple-sidebar.css">
 <link rel="icon" href="images/hrdlogo.png" type="image/png" >
  
  	<link rel="stylesheet" href="css/fixedbar.css">
  	
	
  
    <script src="js/jquery.js"></script>
  	<script src="bootstrape/js/bootstrap.min.js"></script>

<!--Material  -->


<link type="text/css" rel="stylesheet" href="plugin/theme-default/materialadmin.css?1425466319" />



<!--  -->
<style>
img.circle{
		width: 50px;
		height: 50px;
		
	}
button.extra {
	margin-top: 20px;
}
</style>
<!--dataTable-->

</head>
<body>
    <input type="hidden" id="smsid" value="${param.ms_id}"/> 

	<%@include file="fixedbar/topmenu.jsp"%>

	<!-- wrapper div -->
	<div id="wrapper" style="margin-top: 54px;">

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
		<div id="page-content-wrapper">
			<div class="col-sm-12 style-wrapper" >
				<div class="row">
					<!--open fluid-->
					<div id="test2" class="container-fluid">
						<!--content row-->
						<div class="row">
							<div class="col-sm-12" >
								<fieldset>

									<div class="col-sm-12" style="margin-top:15px;">

										<legend>
											<h3 >
												<b><span><i class="fa fa-newspaper-o"></i>Announcement</span>
												</b>
											</h3>
										</legend>
									</div>

								</fieldset>
							</div>

							<!-- BEGIN CONTENT-->
							<div id="content" class="col-sm-12">
								

								<div class="" id="display">
							</div>
								<!--end .card -->
							</div>
							<!--end .col -->
						</div>
						<!--end .row -->
					</div>
					<!--end .section-body -->
					
				</div>
				<!--end #content-->
				<!-- END CONTENT -->
			</div>
			<!--close content row-->
		</div>
		<!--close content fluid-->
	</div>
	
	<script>
	    myProcess();
		function myProcess(){
			if($("#smsid").val()!="0"){
				get1MessageInfo();
			}else if($("#smsid").val()=="0"){
				getAllMessage();
			}
		}
		 function getAllMessage() {
			$.get("getallmessageadmin", {
				user_id : $("#logid1").val()
			}, function(data) {
				$("#display").html(listAllMessage(data));
				getMessage();
			});
		}
		function listAllMessage(data) {
		
			var str = "";
			for (var i = 0; i < data.length; i++) {
				str += "<div class='row' style='margin-top:10px;'>" + "<div class='col-sm-1'></div>"
				+ "<div class='col-sm-10' stlye='margin:auto;'>"
				+ "<div class='card card-tiles style-default-light'>"
				+ "<div class='row style-primary'>"
				+ "<div class='col-sm-9'>"
				+ "<div class='card-body style-default-light'>"
				+ "<b ><h2 class='mylabel'>"
				+ data[i].title
				+ "</h2></b>"
				+ "<div class='text-default-light'><img class='img-circle circle' src='imgprofile/"+data[i].sender_img+"'/><br><br>"
				+"Posted by:&nbsp;&nbsp;&nbsp;"
				+ data[i].sender
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "<div class='col-sm-3'>"
				+ "<div class='card-body'>"
				+ "<div class='hidden-xs'>"
				+ "<h4 class='text-light'>"
				+ "<strong>"
				+ data[i].post_date
				+ "</strong>"
				+ "</h4>"
				+ "<h4 class='text-light'>"
				+ "<strong>"
				+ data[i].time
				+ "</strong>"
				+ "</h4>"
				+ "<div class='stick-top-right'>"
				+ "<a class='btn btn-icon-toggle' data-toggle='tooltip' data-placement='top' data-original-title='Contact me'><i class='fa fa-envelope'></i></a><br/>"
				+ "<a class='btn btn-icon-toggle' data-toggle='tooltip' data-placement='top' data-original-title='Follow me'><i class='fa fa-twitter'></i></a><br/>"
				+ "<a class='btn btn-icon-toggle' data-toggle='tooltip' data-placement='top' data-original-title='Personal info'><i class='fa fa-facebook'></i></a>"
				+ "</div>"
				+ "</div>"
				+ "<div class='visible-xs'>"
				+ "<strong>"
				+ data[i].time
				+ "</strong>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row'>"
				+ "<div class='col-sm-12'>"
				+ "<article class='style-default-bright'>"
				+ "<div style='padding:5px; background-color:rgb(153,217,234)'>"
				+ "<img class='img-responsive' src=../../imageinfo/"+data[i].img_info+" alt='No information image'"+
					"style='heigth:100px; margin:auto;' />"
				+ "</div>"
				+ "<div class='textwrapper card-body' ><p style=''>"
				+ data[i].description
				+ "</p><br/>"
				+ "</div>"
				+ "</article></div><div class='col-sm-1'></div></div></div></div></div>";
			}
			return str;
		}
		function get1MessageInfo(){
			$.get("messageinfo",
					{
				      ms_id:$("#smsid").val()
					},function(data){
						$("#display").html(list1MessageInfo(data));
						getMessage();	
					});
		}
		function list1MessageInfo(data){
var str="";
			
			str += "<div class='row' style='margin-top:10px;'>" + "<div class='col-sm-1'></div>"
			+ "<div class='col-sm-10' stlye='margin:auto;'>"
			+ "<div class='card card-tiles style-default-light'>"
			+ "<div class='row style-primary'>"
			+ "<div class='col-sm-9'>"
			+ "<div class='card-body style-default-light'>"
			+ "<b ><h2 class='mylabel'>"
			+ data.title
			+ "</h2></b>"
			+ "<div class='text-default-light'><img class='img-circle circle' src='imgprofile/"+data.sender_img+"'/><br><br>"
			+"Posted by:&nbsp;&nbsp;&nbsp;"
			+ data.sender
			+ "</div>"
			+ "</div>"
			+ "</div>"
			+ "<div class='col-sm-3'>"
			+ "<div class='card-body'>"
			+ "<div class='hidden-xs'>"
			+ "<h4 class='text-light'>"
			+ "<strong>"
			+ data.post_date
			+ "</strong>"
			+ "</h4>"
			+ "<h4 class='text-light'>"
			+ "<strong>"
			+ data.time
			+ "</strong>"
			+ "</h4>"
			+ "<div class='stick-top-right'>"
			+ "<a class='btn btn-icon-toggle' data-toggle='tooltip' data-placement='top' data-original-title='Contact me'><i class='fa fa-envelope'></i></a><br/>"
			+ "<a class='btn btn-icon-toggle' data-toggle='tooltip' data-placement='top' data-original-title='Follow me'><i class='fa fa-twitter'></i></a><br/>"
			+ "<a class='btn btn-icon-toggle' data-toggle='tooltip' data-placement='top' data-original-title='Personal info'><i class='fa fa-facebook'></i></a>"
			+ "</div>"
			+ "</div>"
			+ "<div class='visible-xs'>"
			+ "<strong>"
			+ data.time
			+ "</strong>"
			+ "</div>"
			+ "</div>"
			+ "</div>"
			+ "</div>"
			+ "<div class='row'>"
			+ "<div class='col-sm-12'>"
			+ "<article class='style-default-bright'>"
			+ "<div style='padding:5px; background-color:rgb(153,217,234)'>"
			+ "<img class='img-responsive' src=../../imageinfo/"+data.img_info+" alt='No information image'"+
				"style='heigth:100px; margin:auto;' />"
			+ "</div>"
			+ "<div class='textwrapper card-body' ><p style=''>"
			+ data.description
			+ "</p><br/>"
			+ "</div>"
			+ "</article></div><div class='col-sm-1'></div></div></div></div></div>";
	return str;
    }
	</script>

</body>
</html>








































































