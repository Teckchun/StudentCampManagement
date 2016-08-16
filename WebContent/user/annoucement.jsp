<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Annoucement | HRD</title>

 <link rel="stylesheet" href="../admin/view/bootstrape/css/bootstrap.min.css">
  	<link rel="stylesheet" href="../admin/view/plugin/fontawesome/css/font-awesome.min.css">	
 	<link rel="stylesheet" href="../admin/view/css/home.css">
  	<link rel="stylesheet" href="../admin/view/css/formstyle.css">
  	<link rel="stylesheet" href="../admin/view/css/simple-sidebar.css">
 <link rel="icon" href="../admin/view/images/hrdlogo.png" type="image/png" >
  
  	<link rel="stylesheet" href="../admin/view/css/fixedbar.css">
  	
		<link type="text/css" rel="stylesheet" href="../admin/view/plugin/theme-default/materialadmin.css?1425466319" />
  
    <script src="../admin/view/js/jquery.js"></script>
  	<script src="../admin/view/bootstrape/js/bootstrap.min.js"></script>

<style>
button.extra {
	margin-top: 20px;
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

		<!--content right-->
		<div id="page-content-wrapper">
			<div class="col-sm-12 style-wrapper">
				<div class="row">
					<!--open fluid-->
					<div id="test2" class="container-fluid">
						<!--content row-->
						<div class="row">
							<div class="col-sm-12 ">
								<fieldset>
									<div class="col-sm-12" style="margin-top: 15px;">
										<legend>
											<h3>
												<b><span><i class='fa fa-newspaper-o'></i>Announcement Board</span> </b>
											</h3>
										</legend>
									</div>
								</fieldset>
							</div>
							<!-- BEGIN CONTENT-->
							<div id="content" class="col-sm-12" style="margin-top:-50px;">
							</div>
							<!--end #content-->
							<!-- END CONTENT -->
						</div>
						<!--close content row-->
					</div>
					<!--close content fluid-->
				</div>
			</div>
			<!--close content row-->
		</div>
		<input type="hidden" id="logid2" value="${sesslogin[0]}">
	</div>
	<script>
		getMessageInfo();
		function getMessageInfo() {
			$.get("getmessageinfo",
			    {
				 user_id:$("#logid2").val()
				},function(data) {
				$("#content").html(listMessageInfo(data));
			});
		}
		function listMessageInfo(data) {
			var str = "";
			for (var i = 0; i < data.length; i++) {
				str += "<div class='col-sm-4'>"
						+ "<div class='card card-bordered style-success'>"
						+ "<div class='card-head'>"
						+ "<header><i class='fa fa-fw fa-tag'></i><i><b>"
						+ data[i].title
						+ "</b></i></header>"
						
						+ "</div>"
						+ "<div class='card-body style-default-bright' style='background-color:#FAFAFA'>"
						+ "<p class='mylabel'>Posted By:&nbsp;&nbsp;&nbsp;"+ data[i].sender
						+"</p>"
						+ "<img src='../imageinfo/" + data[i].img_info
						+ "' style='width:100%; height:170px;padding-bottom:10px;'/>" 
						+ "<br/><span class='mylabel'><small>Posted in:&nbsp;"
						+ data[i].post_date 
						+"<p>Time: "
						+ data[i].time +"</p></small></span>"
						+ "<input type='button' style='border-radius:0' class='btn btn-primary' id='btnView' value='Read more...' onclick=toViewMessage('"+data[i].sms_id+"')>"
						+ "</div></div></div>";
			}
			return str;
		}
		function toViewMessage(id){
			location.href="viewannoucement.jsp?ms_id="+id;
		}
	</script>

</body>
</html>



































