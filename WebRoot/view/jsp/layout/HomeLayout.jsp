

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html class="transition-navbar-scroll top-navbar-xlarge bottom-footer" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Learning</title>
	 
	<link href="view/helper/css/theme-style.css" rel="stylesheet">
	
	</head>
	<body>
	<div>
   		<tiles:insertAttribute name="header" />
	</div>
	 <!-- End Top login bar -->
   <div id="BodyId">
   		<tiles:insertAttribute name="body" />
	</div>
	<!-- Footer -->
   <div>
  	 <tiles:insertAttribute name="footer" />
	</div>
	<!-- // Footer -->
	
	
	
	
</body>

</html>