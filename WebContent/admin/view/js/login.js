
$(document).ready(function(){
	var find=false;
	var name= $("input[name='txtname']");
	var pass= $("input[name='txtpass']");
	
	$("#btnlogin").click(function(){
		
		var name1=["Phalleak","Techhun","Sundy","Dana","Kheang"];
		var pwd1=["123","234","345","456","567"];
		
		if(name.val()==""&&pass.val()!=""){
			$(".alert-box").slideDown("fast",function(){
				$(this).html("<h4>Please input your name!!!</h4>")
					   .delay(4000)
					   .slideUp("fast");
			});
			getNullCompare(name);
		}
		else if(name.val()!=""&&pass.val()==""){
			$(".alert-box").slideDown("fast",function(){
				$(this).html("<h4>Please input your Password!!!</h4>")
					   .delay(4000)
					   .slideUp("fast");
			});
			getNullCompare(pass);
		}
		else if(name.val()==""&&pass.val()==""){
			$(".alert-box").slideDown("fast",function(){
				$(this).html("<h4>Please input your Name and Password!!!</h4>")
						.delay(4000)
						 .slideUp("fast");
			});
			getNullCompare(name);
			getNullCompare(pass);
		}
		else {
			for(var i=0;i<name1.length;i++){
				if(name1[i]==name.val()&&pwd1[i]==pass.val()){
					window.location.assign("Home.html");
					find=true;
					break;
				 }
			}
			if(find==false){
				$(".alert-box").slideDown("fast",function(){
						$(this).html("<h4>Invalid Email and Password!!!</h4>")
							   .delay(4000)
						       .slideUp("fast");
				});
				myalert.html("Invalid Email and Password!!!");
				name.focus();
			}
					   
		}
	});
	function getNullCompare(variable){
			if(variable.val()=="" || variable.val()==null){
					variable.css("border","1px solid #F44336");
					variable.addClass("form-control txttext invalidInput");
			}else{
					variable.css("border","1px solid #BDBDBD");
					variable.addClass("form-control txttext");
			}
	}
});