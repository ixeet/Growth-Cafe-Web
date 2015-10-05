<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html class="transition-navbar-scroll top-navbar-xlarge bottom-footer"
	lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Growth Cafe</title>
	<link rel="shortcut icon" href="view/helper/images/favicon.ico" type="image/x-icon">
<link href="view/helper/css/theme-style.css" rel="stylesheet">
<link href="view/helper/css/module-essentials.min.css" rel="stylesheet" />

<style>

.homebg{
	background-color: #e0e0e0;
    width: 100%;
    height:100%;
	background-size: 100% 100%;
    background-repeat: no-repeat;
    background-attachment:fixed;
  
}

 .backdro-container {
   position: fixed;
   display: none;
   height:150%;
   width: 100%;
   z-index: 999999;
    margin-top: -90px;
}
#backdro {
   z-index:5;
   background: #ccc;
   opacity:0.5;
   height:100%;
   width: 100%;
}

.backdro-container #loading-img {
    position: absolute;
    z-index:10;
    top:30%;
    left:48%;
}
</style>

<script>
 
function startwindowDisable(){
	$(".backdro-container").show();
	
return false;
}

function endwindowDisable(){
//$(".breakpoint-1024").removeClass("startBlock");
//$(".breakpoint-1024").attr('disabled',false);
$(".backdro-container").hide();
return false;
}
</script>
</head>


<body>

<div class="backdro-container">
    <div id="backdro">&nbsp;</div>
   <img id="loading-img" src='view/helper/images/ajax-loader-large.gif' height="100px;"/>
</div>
<div id="teacherHome">
	<div class="container">
		<div>
			<tiles:insertAttribute name="header" />
		</div>
		<br>
		<!-- End Top login bar -->
		<div class="row">
			<div id="BodyId" class="col-md-12">
				<tiles:insertAttribute name="body" />
			</div>

			<%-- <div id="contentId" class="col-md-9">
   
   <tiles:insertAttribute name="content" /><br/>
  </div> --%>
		</div>

		<!-- Footer -->
		<div>
			<tiles:insertAttribute name="footer" />
		</div>
		<!-- // Footer -->

	</div>
</div>

</body>

</html>
<script>
$(document).ready(function(){
$("#teacherHome").addClass("homebg");

});
</script>

