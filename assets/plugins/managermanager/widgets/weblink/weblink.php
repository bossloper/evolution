<?php

//---------------------------------------------------------------------------------
// mm_widget_weblink
// Adds file insert button to the weblink text input
// v1.1 - modified for MODx 1.x
//--------------------------------------------------------------------------------- 


function mm_widget_weblink($roles='', $templates='') {
	
	global $modx, $content, $base_url;
	$e = &$modx->Event;
	
	// only if a weblink
	if ((is_array($content) && $content['type'] == 'reference') || $_REQUEST['a'] == 72) {

	// if the current page is being edited by someone in the list of roles, and uses a template in the list of templates
	if ($e->name == 'OnDocFormRender' && useThisRule($roles, $templates)){
	
			$output = '';	
			$output .= "// ---------------- mm_widget_weblink: Add file selection to weblink field ------------- \n";

			// include javascript
 			// code from manager/includes/tmplvars.php
 			$joutput .= addslashes("
				var lastImageCtrl;
				var lastFileCtrl;
				if (typeof(OpenServerBrowser) != 'function') {	
					function OpenServerBrowser(url, width, height ) {
						var iLeft = (screen.width  - width) / 2 ;
						var iTop  = (screen.height - height) / 2 ;

						var sOptions = 'toolbar=no,status=no,resizable=yes,dependent=yes' ;
						sOptions += ',width=' + width ;
						sOptions += ',height=' + height ;
						sOptions += ',left=' + iLeft ;
						sOptions += ',top=' + iTop ;

						var oWindow = window.open( url, 'FCKBrowseWindow', sOptions ) ;
					}
				}
				if (typeof(BrowseFileServer) != 'function') {	
					function BrowseFileServer(ctrl) { 
						lastFileCtrl = ctrl;
						var w = screen.width * 0.5;
						var h = screen.height * 0.5;
						OpenServerBrowser('".$base_url."manager/media/browser/mcpuk/browser.php?Type=files', w, h);	
					}
				}
				if (typeof(SetUrl) != 'function') {	
							function SetUrl(url, width, height, alt) {
								if(lastFileCtrl) {
									var c = document.getElementById(lastFileCtrl);
									if(c && c.value != url) {
									    c.value = url;
										SetUrlChange(c);
									}
									lastFileCtrl = '';
								} else if(lastImageCtrl) {
									var c = document.getElementById(lastImageCtrl);
									if(c && c.value != url) {
									    c.value = url;
										SetUrlChange(c);
									}
									lastImageCtrl = '';
								} else {
									return;
								}
							}	
				}	
 			");
 
			$joutput = str_replace(chr(10), " ", $joutput); //remove carriage returns
			$joutput = str_replace(chr(13), " ", $joutput); //remove carriage returns
			
			$output .= '$j("head").append(\' <script type="text/javascript">'.$joutput.'</scr\'+\'ipt> \'); ' . "\n";
			$output .= '$j("input[name=ta]").attr("id", "ta"); ' . "\n";
			$output .= '$j("input[name=ta]").attr("style", "width:70%"); ' . "\n";
	
			// append insert button to weblink (ta)	
			$output .= '$j("input[name=ta]").after(\'';												   
			$output .= '<input type="button" value="Insert" onclick="BrowseFileServer(\\\'ta\\\')">';					
			$output .= '\');';

			$e->output($output . "\n");		
		}
	}
	
} // end of widget

?>
