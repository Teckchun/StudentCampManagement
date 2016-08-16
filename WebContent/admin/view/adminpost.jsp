<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Announcement | HRD</title>
<link rel="stylesheet" href="bootstrape/css/bootstrap.min.css">
<link rel="stylesheet"
	href="plugin/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/studentlist.css">
<link rel="stylesheet" href="css/formstyle.css">
<link href="css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="plugin/sweetalert/sweetalert.css">
<link rel="stylesheet" href="css/fixedbar.css">
<link rel="icon" href="images/hrdlogo.png" type="image/png">
<!--CK  -->
<!-- <link rel="stylesheet" href="plugin/ckeditor/samples/css/samples.css"> -->
<!-- <link rel="stylesheet" href="plugin/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css"> -->
<script src="js/jquery.js"></script>
<script src="plugin/ckeditor/ckeditor.js"></script>
<!--  -->

<!--JASNY  -->
<link rel="stylesheet"
	href="plugin/jasny-bootstrap/css/jasny-bootstrap.min.css">
<script src="plugin/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
<!--  -->

<script src="bootstrape/js/bootstrap.min.js"></script>
<style>
a.mylink {
	display: inline;
}

button.extra {
	margin-top: 15px;
}

img.circle {
	width: 35px;
	height: 35px;
}
#posted{
  max-width: 500px;
  max-height: 250px;
  overflow: auto;
}
</style>

<!--  data table-->
<script
	src="plugin/DataTables-1.10.7/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
<link rel="stylesheet"
	href="plugin/DataTables-1.10.7/DataTables-1.10.7/media/css/jquery.dataTables.css">
</head>
<body>
	<c:set var="sesslogin" value="${sessionScope.admin }"></c:set>
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
					<div class="row">
						<!--open fluid-->
						<div id="test2" class="container-fluid">
							<!--content row-->
							<div class="row">
								<div class="col-sm-12">

									<div class="col-sm-12">


										<div class="col-sm-12">
											<legend>

												<h3>
													<i class="fa fa-list-alt"></i><b>Annoucement </b><font
														size="4">Post Editor</font>
												</h3>

											</legend>
										</div>

									</div>

								</div>


							</div>
							<!--close row-->
							<div class="col-sm-10" style="margin-bottom: 15px;">
							      <div class="col-sm-4">
								   <input type="text" placeholder="Title" class="form-control txttext"
					id="title" />
							     </div>
							     <div class="col-sm-4" id="oldms">
							    </div>
							</div>   
							<div class="col-sm-12">
                               <div class="col-sm-6">
								<div class="fileinput fileinput-new" data-provides="fileinput">
									<div class="fileinput-preview thumbnail"
										data-trigger="fileinput" style="width: 500px; height: 250px;"
										id="proimg">
										<img id="image" />
									</div>
									<div>
										<span class="btn btn-default btn-file"><span
											class="fileinput-new">Select Title Image</span><span
											class="fileinput-exists">Change</span><input type="file"
											name="imginfo" id="imginfo"></span> <a href="#"
											class="btn btn-default fileinput-exists"
											data-dismiss="fileinput">Remove</a>
									</div>
								</div>
								</div>
								<dvi class="col-sm-6" id="posted">
								</dvi>
							</div>


							<div class="col-sm-12">
								<textarea name="editor1" id="editor1">&lt;p&gt;Initial editor content.&lt;/p&gt;</textarea>

								<script>
									CKEDITOR
											.replace(
													'editor1',
													{
														filebrowserBrowseUrl : 'plugin/Filemanager-master/index.html',

													});
								</script>
							</div>
							<div class="col-sm-12"
								style="margin-top: 15px; margin-left: -15px;">

								<input type="button"
									class=" navbar-right btn btn-primary  btnownstyle "
									onclick="saveAll()" value="Post" id="post" />
							</div>
						</div>
						<!--close fluid-->
					</div>
					<input type="hidden" value="${sesslogin[0]}" id="logid" />
				</div>
			</div>
			<script src="plugin/sweetalert/sweetalert.min.js"></script>
			<script>
				$(document).ready(function() {

				});
			</script>
			<script>
				/*  $("#post").click(function(){
					swal("Information has been posted!");
				}) */
			</script>
			<script>
				/*  function myfun(){
				  alert(CKEDITOR.instances.editor1.getData());
				  
				 } */
				function saveAll() {
					myuploadimg();
					saveMessage();
				}
				function saveMessage() {
					var filename = "";
					var fullPath = document.getElementById('imginfo').value;
					if (fullPath) {
						var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath
								.lastIndexOf('\\')
								: fullPath.lastIndexOf('/'));
						filename = fullPath.substring(startIndex);
						if (filename.indexOf('\\') === 0
								|| filename.indexOf('/') === 0) {
							filename = filename.substring(1);
						}
					}
					$.post("savemessage", {
						sender_id : $("#logid").val(),
						title : $("#title").val(),
						description : CKEDITOR.instances.editor1.getData(),
						img_info : filename
					}, function(data) {
						swal("Information has been posted!");
					});
				}
				function myuploadimg() {
					var data1;
					data1 = new FormData();
					data1.append('file', $('#imginfo')[0].files[0]);
					$
							.ajax({
								url : "uploadimginfo",
								type : "POST",
								cache : false,
								contentType : false,
								processData : false,
								data : data1,
								success : function(data) {
									if (data == true) {
										swal(
												"Your Profile image has been saved successfully",
												"DONE!", "success")
									} else {
										alert("failed");
									}
								}
							});
				}
				function getMessageTitle(){
					$.get("getmessagetitle",function(data){
						 $("#oldms").html(listTitle(data));
					})
				}
				function listTitle(data){
				  var str="<select id='smstitle' class='form-control txttext combo' onchange='getOldMessage()'>"+
				           "<option value='' selected>------All Title------</option>"+
				           "<option value='0'>All Post</option>";
				      for(var i=0;i<data.length;i++){
				    	  str+="<option value='"+data[i].sms_id+"'>"+data[i].title+"</option>"
				      }
				    str+="</select>";
				    return str;
				}
				getMessageTitle();
				function getOldMessage(){
					if($("#smstitle").val()!=""){
					location.href="viewannoucement.jsp?ms_id="+$("#smstitle").val();
					}
				}
			</script>
			<script src="plugin/ckeditor/plugins/image/plugin.js"></script>
			<script src="plugin/ckeditor/plugins/simple-image-browser/plugin.js"></script>
			<script src="plugin/ckeditor/samples/js/sample.js"></script>
</body>
</html>