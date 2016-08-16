<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Announcement | HRD</title>

 <link rel="stylesheet" href="../admin/view/bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="../admin/view/plugin/fontawesome/css/font-awesome.min.css">	
 	<link rel="stylesheet" href="../admin/view/css/home.css">
  	<link rel="stylesheet" href="../admin/view/css/formstyle.css">
  	<link rel="stylesheet" href="../admin/view/css/simple-sidebar.css">
 <link rel="icon" href="../admin/view/images/hrdlogo.png" type="image/png" >
  
  	<link rel="stylesheet" href="../admin/view/css/fixedbar.css">
  	
	
  
    <script src="../admin/view/js/jquery.js"></script>
  	<script src="../admin/view/bootstrape/js/bootstrap.min.js"></script>

<!--Material  -->


<link type="text/css" rel="stylesheet" href="../admin/view/plugin/theme-default/materialadmin.css?1425466319" />
  



<!--  -->
<style>
img.circle{
		width: 50px;
		height: 50px;
		
	}
button.extra {
	margin-top: 20px;
}
div.textwrapper{
	white-space: pre-wrap;      /* CSS3 */   
   white-space: - MOZ-pre-wrap; /* Firefox */    
   white-space: -pre-wrap;     /* Opera <7 */   
   white-space: -o-pre-wrap;   /* Opera 7 */    
   word-wrap: break-word;      /* IE */
   text-indent:2em;color:gray;text-algin:justify;
   line-height: 30px;
   font-size: 16px;
   margin-top: -10px;
}
</style>
<!--dataTable-->

</head>
<body>
    <input type="hidden" id="smsid" value="${param.ms_id}"/> 
	<input type="hidden" id="logid1" value="${param.userid}"/>
	<input type="hidden" id="userid" value="${param.id}" />
	<input type="hidden" id="msid" value="${param.msid}"/>
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
							<div id="content" class="col-sm-12" style="margin-top: -40px;">
								

								<div class="" id="display" >
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
			if( $("#userid").val()!=""&& $("#msid").val()!=""){
				get1Message()
			}else if($("#logid1").val()!=""){
				getAllMessage();
			}else if($("#smsid").val()!=""){
				get1MessageInfo();
			}
		}
		function get1Message() {
			$.get("get1message", {
				user_id : $("#userid").val(),
				sms_id : $("#msid").val()
			}, function(data) {
				$("#display").html(list1Message(data));
				getMessage();
			});
		}
		function list1Message(data) {
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
			+ "<div class='text-default-light'><img class='img-circle circle' src='../admin/view/imgprofile/"+data.sender_img+"'/><br><br>"
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
			+ "<div style='padding:5px; class='style-default-light'>"
			+ "<img class='img-responsive' src=../imageinfo/"+data.img_info+" alt='No information image'"+
				"style='heigth:100px; margin:auto;' />"
			+ "</div>"
			+ "<div class='textwrapper card-body' ><p style=''>"
			+ data.description
			+ "</p><br/>"
			+ "</div>"
			+ "</article></div><div class='col-sm-1'></div></div></div></div></div>";
	return str;
		}
		 function getAllMessage() {
			$.get("getallmessage", {
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
				+ "<div class='text-default-light'><img class='img-circle circle' src='../admin/view/imgprofile/"+data[i].sender_img+"'/><br><br>"
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
				+ "<div style='padding:5px;' class='style-default-light'>"
				+ "<img class='img-responsive' src=../imageinfo/"+data[i].img_info+" alt='No information image'"+
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
			$.get("get1messageinfo",
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
			+ "<div class='text-default-light'><img class='img-circle circle' src='../admin/view/imgprofile/"+data.sender_img+"'/><br><br>"
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
			+ "<div style='padding:5px;' class='style-default-light'>"
			+ "<img class='img-responsive' src=../imageinfo/"+data.img_info+" alt='No information image'"+
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
	<script src="../../../assets/js/libs/jquery/jquery-1.11.2.min.js"></script>
	<script
		src="../../../assets/js/libs/jquery/jquery-migrate-1.2.1.min.js"></script>
</body>
</html>








































































