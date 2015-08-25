

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
    <link href="view/helper/css/theme-core.min.css" rel="stylesheet">
	<link href="view/helper/css/theme-style.css" rel="stylesheet">
	 <link href="view/helper/css/module-essentials.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-material.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-layout.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-sidebar.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-sidebar-skins.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-navbar.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-messages.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-carousel-slick.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-charts.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-maps.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-colors-alerts.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-colors-background.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-colors-buttons.min.css" rel="stylesheet" />
    <link href="view/helper/css/module-colors-text.min.css" rel="stylesheet" />
	</head>
	<body>

   <div class="container">
   <tiles:insertAttribute name="header" /><br/>
   <hr/>
   <div class="row">
   <div class="col-md-4">
   <tiles:insertAttribute name="leftMenu" />
   </div>
   <div class="col-md-8">
   
   <tiles:insertAttribute name="body" /><br/>
  </div>
   </div>
   <hr/>
   <tiles:insertAttribute name="footer" /><br/>
   </div>
   
   
   
   
   
   
   
   
   
   
   
   <script>
    var colors = {
        "danger-color": "#e74c3c",
        "success-color": "#81b53e",
        "warning-color": "#f0ad4e",
        "inverse-color": "#2c3e50",
        "info-color": "#2d7cb5",
        "default-color": "#6e7882",
        "default-light-color": "#cfd9db",
        "purple-color": "#9D8AC7",
        "mustard-color": "#d4d171",
        "lightred-color": "#e15258",
        "body-bg": "#f6f6f6"
    };
    var config = {
        theme: "html",
        skins: {
            "default": {
                "primary-color": "#42a5f5"
            }
        }
    };
    </script>
    <!-- Separate Vendor Script Bundles -->
    <script src="js/vendor-core.min.js"></script>
    <script src="js/vendor-countdown.min.js"></script>
    <script src="js/vendor-tables.min.js"></script>
    <script src="js/vendor-forms.min.js"></script>
    <script src="js/vendor-carousel-slick.min.js"></script>
    <script src="js/vendor-player.min.js"></script>
    <script src="js/vendor-charts-flot.min.js"></script>
    <script src="js/vendor-nestable.min.js"></script>
    <!-- <script src="js/vendor-angular.min.js"></script> -->
    <!-- Compressed Vendor Scripts Bundle
    Includes all of the 3rd party JavaScript libraries above.
    The bundle was generated using modern frontend development tools that are provided with the package
    To learn more about the development process, please refer to the documentation.
    Do not use it simultaneously with the separate bundles above. -->
    <!-- <script src="js/vendor-bundle-all.min.js"></script> -->
    <!-- Compressed App Scripts Bundle
    Includes Custom Application JavaScript used for the current theme/module;
    Do not use it simultaneously with the standalone modules below. -->
    <!-- <script src="js/module-bundle-main.min.js"></script> -->
    <!-- Standalone Modules
    As a convenience, we provide the entire UI framework broke down in separate modules
    Some of the standalone modules may have not been used with the current theme/module
    but ALL the modules are 100% compatible -->
    <script src="js/module-essentials.min.js"></script>
    <script src="js/module-material.min.js"></script>
    <script src="js/module-layout.min.js"></script>
    <script src="js/module-sidebar.min.js"></script>
    <script src="js/module-carousel-slick.min.js"></script>
    <script src="js/module-player.min.js"></script>
    <script src="js/module-messages.min.js"></script>
    <script src="js/module-maps-google.min.js"></script>
    <script src="js/module-charts-flot.min.js"></script>
    <!-- [html] Core Theme Script:
        Includes the custom JavaScript for this theme/module;
        The file has to be loaded in addition to the UI modules above;
        module-bundle-main.js already includes theme-core.js so this should be loaded
        ONLY when using the standalone modules; -->
    <script src="js/theme-core.min.js"></script>
</body>
</html>