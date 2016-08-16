$("#btnSave").click(function(){
    var txt = '<div class="col-sm-12" id="myRowtest"><div class="col-sm-2" id="myTest"><p class="col-sm-3 mylabel" style="padding-left:0px;margin-top:15px;">Date<p><div class="col-sm-9"><input class="form-control txttext datepicker" title="Input Homework Score" type="text" name="sjdate" placeholder="Date"/></div></div><div class="col-sm-2"><p class="col-sm-3 mylabel" style="padding-left:0px;margin-top:15px;">Title<p><div class="col-sm-9"><input class="form-control txttext" title="Input Homework Score" type="text" name="sjhome" placeholder="Score" id="txtTitle"/></div></div><div class="col-sm-2"><p class="col-sm-3 mylabel" style="padding-left:0px;margin-top:15px;">Score:<p><div class="col-sm-9"><input class="form-control txttext" title="Input Homework Score" type="text" name="sjhome" placeholder="Score"  id="txtScore"/></div></div><div class="col-sm-2"><p class="col-sm-3 mylabel" style="padding-left:0px;margin-top:15px;">FullMark<p><div class="col-sm-9"><input class="form-control txttext" title="Input Homework Score" type="text" name="sjhome" placeholder="Score"  id="txtFull"/></div></div><div class="col-sm-2" style="padding-top:15px;"><a class="btn fa fa-plus"   data-toggle="modal" data-target="#myModal"></a><a class="btn fa fa-trash-o" onclick="deleteHW()"></a></div></div>';
 $("#javabox").prepend(txt);
 

})

$("#mydelete").click(function(){
var txt = '<div class="col-sm-12" id="myRowtest"><div class="col-sm-2" id="myTest"><p class="col-sm-3 mylabel" style="padding-left:0px;margin-top:15px;">Date<p><div class="col-sm-9"><input class="form-control txttext datepicker" title="Input Homework Score" type="text" name="sjdate" placeholder="Date"/></div></div><div class="col-sm-2"><p class="col-sm-3 mylabel" style="padding-left:0px;margin-top:15px;">Title<p><div class="col-sm-9"><input class="form-control txttext" title="Input Homework Score" type="text" name="sjhome" placeholder="Score" id="txtTitle"/></div></div><div class="col-sm-2"><p class="col-sm-3 mylabel" style="padding-left:0px;margin-top:15px;">Score:<p><div class="col-sm-9"><input class="form-control txttext" title="Input Homework Score" type="text" name="sjhome" placeholder="Score"  id="txtScore"/></div></div><div class="col-sm-2"><p class="col-sm-3 mylabel" style="padding-left:0px;margin-top:15px;">FullMark<p><div class="col-sm-9"><input class="form-control txttext" title="Input Homework Score" type="text" name="sjhome" placeholder="Score"  id="txtFull"/></div></div><div class="col-sm-2" style="padding-top:15px;"><a class="btn fa fa-plus"   data-toggle="modal" data-target="#myModal"></a><a class="btn fa fa-trash-o" onclick="deleteHW()"></a></div></div>';
$("#javabox").removeChild(txt);
 

})
document.getElementById("txtTitle").readOnly = true;
document.getElementById("txtScore").readOnly = true;
document.getElementById("txtFull").readOnly = true;
function myAdd(){
    var t = document.getElementById("modelTitle");
    var s = document.getElementById("modelScore");
    var f = document.getElementById("modelFull");
   
    
    document.getElementById("txtTitle").value = t.value;
    document.getElementById("txtScore").value = s.value;
    document.getElementById("txtFull").value = f.value;
    
    
    
}