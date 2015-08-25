<%@ taglib prefix="s" uri="/struts-tags"%>
<script>

/* function getByFB(){
	var userFbId = document.getElementById("userFbId").value;
	var userPassword = document.getElementById("loginUserPasswordId").value;
	if(userFbId==""){
			alert("please enter userFbId");
		}else{
		$("#getByFBFormId").submit();
	}
	return false;
} */
</script>

 <div class="footer_sec">
						<ul>
							<li class="footer_sec_li"><a class="default_color" href="#">Instructions</a> | &nbsp;</li>
							<li class="footer_sec_li"><a class="default_color" href="#"> Mobile App</a> | &nbsp;</li>
							<li><a class="default_color" href="#"> Contact Us</a></li>
						</ul>
		</div>
        
  

<!-- <div align="right">
	Get By Facebook
	<form action="getByFBId" method="post" id="getByFBFormId">
	<label>Facebook Id</label>
	<input type="text" name="userFbId" id="userFbId"/><br/>
	<input type="button" value="getByFB" onclick="return getByFB();">
	<input type="button" value="reset" onclick="return reset('getByFBFormId');">
	</form>
</div> -->


<s:if test="#session.loginDetail !=null">
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
    <script src="view/helper/js/vendor-core.min.js"></script>
    <script src="view/helper/js/vendor-countdown.min.js"></script>
    <script src="view/helper/js/vendor-tables.min.js"></script>
    <script src="view/helper/js/vendor-forms.min.js"></script>
    <script src="view/helper/js/vendor-carousel-slick.min.js"></script>
    <script src="view/helper/js/vendor-player.min.js"></script>
    <script src="view/helper/js/vendor-charts-flot.min.js"></script>
    <script src="view/helper/js/vendor-nestable.min.js"></script>
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
    <script src="view/helper/js/module-essentials.min.js"></script>
    <script src="view/helper/js/module-material.min.js"></script>
    <script src="view/helper/js/module-layout.min.js"></script>
    <script src="view/helper/js/module-sidebar.min.js"></script>
    <script src="view/helper/js/module-carousel-slick.min.js"></script>
    <script src="view/helper/js/module-player.min.js"></script>
    <script src="view/helper/js/module-messages.min.js"></script>
    <script src="view/helper/js/module-maps-google.min.js"></script>
    <script src="view/helper/js/module-charts-flot.min.js"></script>
    <!-- [html] Core Theme Script:
        Includes the custom JavaScript for this theme/module;
        The file has to be loaded in addition to the UI modules above;
        module-bundle-main.js already includes theme-core.js so this should be loaded
        ONLY when using the standalone modules; -->
    <script src="view/helper/js/theme-core.min.js"></script>
    </s:if>
        
    