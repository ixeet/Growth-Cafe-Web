<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="fb-root"></div>


<script type="text/javascript">

$(document).on('click','.t', function(){
var resourceId = $(this).attr("value");
$('.t').removeAttr("style");
$(this).css("border","1px solid white");
window.location="moduleDescription?moduleId="+moduleId+"&courseId="+courseId+"&resourceId="+resourceId;
});


</script>



 <style type="text/css">
	 
	 
            /* jssor slider thumbnail navigator skin 01 css */
            /*
            .jssort01 .p            (normal)
            .jssort01 .p:hover      (normal mouseover)
            .jssort01 .p.pav        (active)
            .jssort01 .p.pdn        (mousedown)
            */

            .jssort01 {
                position: absolute;
                /* size of thumbnail navigator container */
                width: 600px;
                height: 100px;
            }

                .jssort01 .p {
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 72px;
                    height: 72px;
                }

                .jssort01 .t {
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    border: none;
                }

                .jssort01 .w {
                    position: absolute;
                    top: 0px;
                    left: 0px;
                    width: 100%;
                    height: 100%;
                }

                .jssort01 .c {
                    position: absolute;
                    top: 0px;
                    left: 0px;
                    width: 68px;
                    height: 68px;
                    border: #000 2px solid;
                    box-sizing: content-box;
                    background: url(view/helper/img/t01.png) -800px -800px no-repeat;
                    _background: none;
                }

                .jssort01 .pav .c {
                    top: 2px;
                    _top: 0px;
                    left: 2px;
                    _left: 0px;
                    width: 68px;
                    height: 68px;
                    border: #000 0px solid;
                    _border: #fff 2px solid;
                    background-position: 50% 50%;
                }

                .jssort01 .p:hover .c {
                    top: 0px;
                    left: 0px;
                    width: 70px;
                    height: 70px;
                    border: #fff 1px solid;
                    background-position: 50% 50%;
                }

                .jssort01 .p.pdn .c {
                    background-position: 50% 50%;
                    width: 68px;
                    height: 68px;
                    border: #000 2px solid;
                }

                * html .jssort01 .c, * html .jssort01 .pdn .c, * html .jssort01 .pav .c {
                    /* ie quirks mode adjust */
                    width /**/: 72px;
                    height /**/: 72px;
                }
        </style>
        <style>
            /* jssor slider arrow navigator skin 05 css */
            /*
            .jssora05l                  (normal)
            .jssora05r                  (normal)
            .jssora05l:hover            (normal mouseover)
            .jssora05r:hover            (normal mouseover)
            .jssora05l.jssora05ldn      (mousedown)
            .jssora05r.jssora05rdn      (mousedown)
            */
            .jssora05l, .jssora05r {
                display: block;
                position: absolute;
                /* size of arrow element */
                width: 40px;
                height: 40px;
                cursor: pointer;
                background: url(view/helper/img/a17.png) no-repeat;
                overflow: hidden;
            }
            .jssora05l { background-position: -10px -40px; }
            .jssora05r { background-position: -70px -40px; }
            .jssora05l:hover { background-position: -130px -40px; }
            .jssora05r:hover { background-position: -190px -40px; }
            .jssora05l.jssora05ldn { background-position: -250px -40px; }
            .jssora05r.jssora05rdn { background-position: -310px -40px; }
        </style>
		
	
	<script type="text/javascript" src="view/helper/js2/jssor.player.ytiframe.js"></script>
    <!-- it works the same with all jquery version from 1.x to 2.x -->
    <script type="text/javascript" src="view/helper/js2/jquery-1.9.1.min.js"></script>
    <!-- use jssor.slider.mini.js (40KB) instead for release -->
    <!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->
    <script type="text/javascript" src="view/helper/js2/jssor.js"></script>
    <script type="text/javascript" src="view/helper/js2/jssor.slider.js"></script>
     <script>

        jQuery(document).ready(function ($) {

            var _SlideshowTransitions = [
            //Fade in L
                {$Duration: 1200, x: 0.3, $During: { $Left: [0.3, 0.7] }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade out R
                , { $Duration: 1200, x: -0.3, $SlideOut: true, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade in R
                , { $Duration: 1200, x: -0.3, $During: { $Left: [0.3, 0.7] }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade out L
                , { $Duration: 1200, x: 0.3, $SlideOut: true, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }

            //Fade in T
                , { $Duration: 1200, y: 0.3, $During: { $Top: [0.3, 0.7] }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true }
            //Fade out B
                , { $Duration: 1200, y: -0.3, $SlideOut: true, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true }
            //Fade in B
                , { $Duration: 1200, y: -0.3, $During: { $Top: [0.3, 0.7] }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade out T
                , { $Duration: 1200, y: 0.3, $SlideOut: true, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }

            //Fade in LR
                , { $Duration: 1200, x: 0.3, $Cols: 2, $During: { $Left: [0.3, 0.7] }, $ChessMode: { $Column: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true }
            //Fade out LR
                , { $Duration: 1200, x: 0.3, $Cols: 2, $SlideOut: true, $ChessMode: { $Column: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true }
            //Fade in TB
                , { $Duration: 1200, y: 0.3, $Rows: 2, $During: { $Top: [0.3, 0.7] }, $ChessMode: { $Row: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade out TB
                , { $Duration: 1200, y: 0.3, $Rows: 2, $SlideOut: true, $ChessMode: { $Row: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }

            //Fade in LR Chess
                , { $Duration: 1200, y: 0.3, $Cols: 2, $During: { $Top: [0.3, 0.7] }, $ChessMode: { $Column: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true }
            //Fade out LR Chess
                , { $Duration: 1200, y: -0.3, $Cols: 2, $SlideOut: true, $ChessMode: { $Column: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade in TB Chess
                , { $Duration: 1200, x: 0.3, $Rows: 2, $During: { $Left: [0.3, 0.7] }, $ChessMode: { $Row: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true }
            //Fade out TB Chess
                , { $Duration: 1200, x: -0.3, $Rows: 2, $SlideOut: true, $ChessMode: { $Row: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }

            //Fade in Corners
                , { $Duration: 1200, x: 0.3, y: 0.3, $Cols: 2, $Rows: 2, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $ChessMode: { $Column: 3, $Row: 12 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true }
            //Fade out Corners
                , { $Duration: 1200, x: 0.3, y: 0.3, $Cols: 2, $Rows: 2, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $SlideOut: true, $ChessMode: { $Column: 3, $Row: 12 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2, $Outside: true }

            //Fade Clip in H
                , { $Duration: 1200, $Delay: 20, $Clip: 3, $Assembly: 260, $Easing: { $Clip: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade Clip out H
                , { $Duration: 1200, $Delay: 20, $Clip: 3, $SlideOut: true, $Assembly: 260, $Easing: { $Clip: $JssorEasing$.$EaseOutCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade Clip in V
                , { $Duration: 1200, $Delay: 20, $Clip: 12, $Assembly: 260, $Easing: { $Clip: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade Clip out V
                , { $Duration: 1200, $Delay: 20, $Clip: 12, $SlideOut: true, $Assembly: 260, $Easing: { $Clip: $JssorEasing$.$EaseOutCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
                ];

            var options = {
                $AutoPlay: false,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 1500,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 800,                                //Specifies default duration (swipe) for slide in milliseconds

                $SlideshowOptions: {                                //[Optional] Options to specify and enable slideshow or not
                    $Class: $JssorSlideshowRunner$,                 //[Required] Class to create instance of slideshow
                    $Transitions: _SlideshowTransitions,            //[Required] An array of slideshow transitions to play slideshow
                    $TransitionsOrder: 1,                           //[Optional] The way to choose transition to play slide, 1 Sequence, 0 Random
                    $ShowLink: true                                    //[Optional] Whether to bring slide link on top of the slider when slideshow is running, default value is false
                },

                $ArrowNavigatorOptions: {                       //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 1,
					$PauseOnHover: 1,   					//[Required] 0 Never, 1 Mouse Over, 2 Always
                },

                $ThumbnailNavigatorOptions: {                       //[Optional] Options to specify and enable thumbnail navigator or not
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                    $ActionMode: 1,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                    $SpacingX: 8,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                    $DisplayPieces: 10,                             //[Optional] Number of pieces to display, default value is 1
                    $ParkingPosition: 360                          //[Optional] The offset position to park thumbnail
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth)
                    jssor_slider1.$ScaleWidth(Math.max(Math.min(parentWidth, 580), 250));
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
<s:if test="selectResourceDetail!= null">
					<s:iterator value="selectResourceDetail">


 </s:iterator>
</s:if>

<div class="container">
            <div class="row  panel-default">
                <div class="col-md-6">
					<div class="row" data-toggle="isotope">
                    
                    	<div class="item col-xs-12 col-sm-12 col-lg-12">
                    	<div class="panel panel-default paper-shadow" data-z="0.5">
                            <div class="panel-heading">
                          <h5 class="h5_color">Resource videos</h5>
                          </div>
                        </div> 
						 <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 580px !important; margin-top: -19px;
							height: 456px; background: #191919; overflow: hidden;">
		
							<!-- Loading Screen -->
							<div u="loading" style="position: absolute; top: 0px; left: 0px;">
								<div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
									background-color: #000000; top: 0px; left: 0px;width: 100%;height:100%;">
								</div>
								<div style="position: absolute; display: block; background: url(view/helper/img/loading.gif) no-repeat center center;
									top: 0px; left: 0px;width: 100%;height:100%;">
								</div>
							</div>

							<!-- Slides Container -->
							<div u="slides" style="cursor: pointer; position: absolute; left: 0px; top: 0px; width: 580px !important; height: 356px; overflow: hidden;">
							<s:if test="selectResourceDetail !=null && selectResourceDetail.size()>0">
								<s:iterator value="selectResourceDetail">
								<div>
								<div class="vide" onclick="playPause()">
									<video id="vide-1" width="580" height="340" controls>
										  <source src='<s:property value="resourceUrl"/>'/>
										  
										</video>
								</div>
								<img u="thumb" id="testId" src='<s:property value="thumbImg" />' value="<s:property value="resourceId"/>" />
								</div>
								</s:iterator>
								</s:if>
								
							</div>
							
							
							<!-- Arrow Left -->
							<span u="arrowleft" class="jssora05l" style="top: 158px; left: 8px;">
							</span>
							<!-- Arrow Right -->
							<span u="arrowright" class="jssora05r" style="top: 158px; right: 8px">
							</span>
							<!--#endregion Arrow Navigator Skin End -->
							<!--#region Thumbnail Navigator Skin Begin -->
							<!-- Help: http://www.jssor.com/development/slider-with-thumbnail-navigator-jquery.html -->
						   

							<!-- thumbnail navigator container -->
							<div  u="thumbnavigator" class="jssort01" style="left: 0px; bottom: 0px;">
								<!-- Thumbnail Item Skin Begin -->
								<div u="slides" style="cursor: default;" >
									<div u="prototype" class="p">
										<div class=w><div u="thumbnailtemplate" class="t"></div></div>
										<!-- <div class=c></div> -->
									</div>
								</div>
								<!-- Thumbnail Item Skin End -->
							</div>
							
						</div><!-- slider container off -->
						<br/>
						 
				
				</div>
						
				</div>
               </div>
				
              <div class="col-lg-3 col-md-3">
			  
              
                    <!-- .panel -->
				
                    <div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated>
                         <div class="panel-heading">
                          <h5 class="h5_color">Module Information</h5>
                        </div>
                        <div class="panel-body">
                            <p class="text-caption text_default">
                            	<s:if test="dashBoardReportVo.moduleName !=null"> Module : ${dashBoardReportVo.moduleName}&nbsp;<br/></s:if>
                              <s:if test="dashBoardReportVo.timeDuration !=null"> Course Duration : ${dashBoardReportVo.timeDuration} days &nbsp;<br/></s:if>
                              <s:if test="dashBoardReportVo.startedOn !=null"><!-- <i data-toggle="tooltip" title="Start Date" class="fa fa-calendar fa-fw"></i> -->Scheduled Start : ${dashBoardReportVo.startedOn} &nbsp;<br/></s:if> 
							  <s:if test="dashBoardReportVo.completedOn !=null"> <!-- <i data-toggle="tooltip" title="Complete Date" class="fa fa-calendar fa-fw"></i> -->Scheduled End : ${dashBoardReportVo.completedOn}</s:if>
                                <br/>
                            </p>
                        </div>
                        <hr class="margin-none" />
                       
                      
                    </div>
					
                     
                <!-- // END .page-section -->
            </div> <!-- ends right side columns -->
			
			<div class="col-lg-3 col-md-3">
			  
                   <div class="panel panel-default paper-shadow" data-z="0.5" data-hover-z="1" data-animated>
                        <div class="panel-heading">
                          <h5 class="h5_color">Assignments ENABLE/DISABLE</h5>
                        </div>
                        <div class="panel-body">
                        
                        <a href="javaScript:;"  
											onclick=""
											class="btn-pad normalbutton btn-height" data-toggle="tooltip"
											data-placement="top" title="Enable Assignments">Enable Assignments</a>
                        
                        
                        
							 
						</div> 
                        <hr class="margin-none" />
                       <br/>
                      
                    </div>
					
				
               
            </div> <!-- ends right side columns -->
				<div class="col-md-6">
				<s:if test="selectResourceDetail !=null && selectResourceDetail.size()>0">
											<s:iterator value="selectResourceDetail">
					<s:if test="CompletedStatus != 1">
									<%-- <input type="button" value="Mark As Completed"
										style="margin-left: 25px; height: 38px;" class="btn-pad normalbutton btn-height"
										onclick="return showCurrentDetail('<s:property value="tcsMainId" />',1,${dashBoardReportVo.courseId},${dashBoardReportVo.moduleId},<s:property value="resourceId" />)">
									 --%>	<a href="javaScript:;"   style="float: left;"
											onclick="return showCurrentDetail('<s:property value="tcsMainId" />',1,${dashBoardReportVo.courseId},${dashBoardReportVo.moduleId},<s:property value="resourceId" />)"
											class="btn-pad normalbutton btn-height" data-toggle="tooltip"
											data-placement="top" title="Mark As Completed">Mark As Completed</a>
										
										
										</s:if>
										<%-- <s:elseif test="CompletedStatus == 1">
									<input type="button" value="Start" 
										style="margin-left: 25px; height: 38px;" class="btn loginbutton"
										onclick="return showCurrentDetail('<s:property value="tcsMainId" />','<s:property value="id" />')">
										</s:elseif> --%>
										</s:iterator>
										</s:if>
										
					
               </div>
               <div class="col-md-6">
               <s:if test="selectResourceDetail !=null && selectResourceDetail.size()>0">
								<s:iterator value="selectResourceDetail">
               
			<p class="justify font14"><s:property value="resourceDesc"/>
                       <%--  <strong>Lorem ipsum</strong> dolor sit amet, consectetur adipisicing elit. Ad aperiam autem cumque deleniti dicta iusto laboriosam laudantium omnis, possimus praesentium provident quam quas, sapiente sint, ut! Adipisci aliquid assumenda consequuntur cupiditate deleniti dicta dolore dolorem
                        <strong>dolores enim </strong>eos hic illo inventore iure libero magnam minima minus obcaecati optio pariatur porro quibusdam quos reiciendis, sapiente sint veritatis. Eveniet in magni sunt?
                   
                        <strong>Lorem ipsum</strong> dolor sit amet, consectetur adipisicing elit. Ad aperiam autem cumque deleniti dicta iusto laboriosam laudantium omnis, possimus praesentium provident quam quas, sapiente sint, ut! Adipisci aliquid assumenda consequuntur cupiditate deleniti dicta dolore dolorem
                        <strong>dolores enim </strong>eos hic illo inventore iure libero.
                    			 --%>
						</p>
						
						</s:iterator>
						</s:if>
			</div>	
            </div>
            
	</div>

