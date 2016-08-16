<link rel="icon" href="../../admin/view/images/hrdlogo.png" type="image/png" >
<style>
#dropdown {
	width: 300px;
	height: auto;
	max-height: 400px;
	overflow: auto;
	background-color: rgb(223,218,241);
}
::-webkit-scrollbar {
	width: 12px;
}
::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}
::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
}
::-moz-scrollbar {
	width: 12px;
}
::-moz-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}
::-moz-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
}
</style>
<c:set  var="sesslogin" value="${sessionScope.student }"></c:set>
<nav class="navbar jar navbar-inverse navbar-fixed-top ">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style="margin-top: -5px;"><img
				src="../admin/view/images/hrdlogo.png" /></a> <a class="navbar-brand text-menu"
				style="color: white" href="dashboard.jsp"><b>HRD</b> Management</a>
			<!--head fix -->
			 <a href="#menu-toggle" class="navbar-brand box-menu" style="margin-left:10px;"
				id="menu-toggle"> <i class="fa fa-align-justify menu-icon"></i>
			</a>
		</div>
		<div class="navbar-collapse collapse navbar-responsive-collapse">

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown">
				<li id="resizer-icon"><a href="#"  class="navbar-brand box-menu"
				 style="margin-right: 10px;"
				onclick="toggleFullScreen()">
				<i class="fa fa-arrows-v" style="color: white;margin-left: 5px;"></i></a></li>
				<li>
				
						<ul style='list-style:none;margin: 5px 15px 0 -20px;' class=" header-nav-options">
							<li class="dropdown hidden-xs"><a href="javascript:void(0);"
								class="btn btn-icon-toggle btn-default" data-toggle="dropdown">
									<i class="fa fa-bell" style="color: white"></i><sup
									class="badge style-danger" id="numnot"></sup>
							</a>
								<ul class="dropdown-menu animation-expand" id="dropdown">

								

								</ul> <!--end .dropdown-menu --></li>
							

						</ul>
					<!--end .header-nav-options -->
				
					<!--end #header-navbar-collapse -->
					<input type="hidden" value="${sesslogin[0] }" id="logid">
					
				</li>
				<li class="dropdown-toggle whiteText" data-toggle="dropdown">Hi,
					<c:out value="${sesslogin[1] }"></c:out>&nbsp;&nbsp;<img src="imguser/${sesslogin[2] }" id="userimage"
					class="img-circle myprofile" />
				</li>
				<ul class="dropdown-menu" role="menu">
					<li><a href="setting.jsp"><i class="fa fa-cog"></i>Setting</a></li>
					<li class="divider"></li>
					<li><a href="logingout"><i class="fa fa-sign-out"></i>Log
							out</a></li>
				</ul>
				</li>

			</ul>
		</div>
	</div>
</nav>
<!--close head fix -->

<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
	function toggleFullScreen() {
		if (!document.fullscreenElement && // alternative standard method
		!document.mozFullScreenElement && !document.webkitFullscreenElement
				&& !document.msFullscreenElement) { // current working methods
			if (document.documentElement.requestFullscreen) {
				document.documentElement.requestFullscreen();
			} else if (document.documentElement.msRequestFullscreen) {
				document.documentElement.msRequestFullscreen();
			} else if (document.documentElement.mozRequestFullScreen) {
				document.documentElement.mozRequestFullScreen();
			} else if (document.documentElement.webkitRequestFullscreen) {
				document.documentElement
						.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
			}
		} else {
			if (document.exitFullscreen) {
				document.exitFullscreen();
			} else if (document.msExitFullscreen) {
				document.msExitFullscreen();
			} else if (document.mozCancelFullScreen) {
				document.mozCancelFullScreen();
			} else if (document.webkitExitFullscreen) {
				document.webkitExitFullscreen();
			}
		}
	}
	var first = true;
	var eventSource = new EventSource("getnotification?logid="+$("#logid").val());
	eventSource.onmessage = function(event) {
		if (event.data != 0) {
			$("#numnot").css("display", "block");
			$("#numnot").text(event.data);
		} else {
			$("#dropdown").html("<li><center><p style='color:red; font-family: 'Script MT Bold';'>Don't have new messages</p><center></li>");
			$("#numnot").css("display", "none");
		}
		newn = parseInt(event.data);
		if (first == true) {
			old = parseInt(event.data);
			first = false;
		}
		if (old < newn) {
			getAutoplay();
			getMessage();
			old = newn;
		}
		if (old > newn) {
			old = newn;
		}
	};
	getMessage();
	function getMessage() {
		$.get("getmessage", {
			user_id : $("#logid").val()
		}, function(data) {
			$("#dropdown").html(listMessage(data));
		});
	}
	function listMessage(data) {
		var str = "<li><center><p style='color:rgb(0,0,255); font-family: 'Script MT Bold';'>New Messages</p><center></li>";
		for (var i = 0; i < data.length; i++) {
			str += "<li onclick=toViewAnnocement('"
					+ data[i].user_id.trim()
					+ "','"
					+ data[i].sms_id.trim()
					+ "')>"
					+ "<a class='alert alert-callout alert-info' href='javascript:void(0);'>"
					+ "<strong>" + data[i].sender 
					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>"
					+ "<img class='pull-right img-circle dropdown-avatar' width='30px' heigth='20px' src='../admin/view/imgprofile/"
					+data[i].sender_img+"' alt=''/>"
					+"<small>"+ data[i].time + "</small>" 
					+ "<br/><small>" + data[i].title + "</small>"
					+"<br/><small>"+ data[i].post_date + "</small>" 
					+ "</a></li>";
		}
		str+="<li style='cursor:pointer;'><a onclick='toViewAllAnnoucement()'>View all messages <span class='pull-right'>"+
		"<i class='fa fa-arrow-right'></i></span></a></li>";
		return str;
	}
	function toViewAnnocement(user_id, sms_id) {
		location.href="viewannoucement.jsp?id="+user_id+"&msid="+sms_id;
	}
	function getAutoplay() {
		var snd = new Audio('alert2.mp3');
		snd.play();
	}
	function toViewAllAnnoucement(){
		location.href="viewannoucement.jsp?userid="+$("#logid").val();
	}
</script>