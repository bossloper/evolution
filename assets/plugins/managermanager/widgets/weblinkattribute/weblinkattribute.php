<?php

//---------------------------------------------------------------------------------
// mm_widget_weblink
// Adds file insert button to the weblink text input
//--------------------------------------------------------------------------------- 


function mm_widget_weblinkattribute($roles='', $templates='') {
	
	global $modx, $content, $base_url;
	$e = &$modx->Event;
	
	// only if a weblink
	if ((is_array($content) && $content['type'] == 'reference') || $_REQUEST['a'] == 72) {

	// if the current page is being edited by someone in the list of roles, and uses a template in the list of templates
	if ($e->name == 'OnDocFormRender' && useThisRule($roles, $templates)){
	
			$output = '';	
			$output .= "// ---------------- mm_widget_weblinkattribute: Replace attribute with 'open new window' or 'existing window' button  ------------- \n";
			
			//reset weblink field width to allow for insert button
			//$output .= '$("input[@name=link_attributes]").attr("style", "width:100px"); ' . "\n";	
	
			// append  button to weblink attribute	
			$output .= '$j("input[name=link_attributes]").before(\'';
			$output .= '<input type="button" value="Open new window" onclick="document.mutate[\\\'link_attributes\\\'].value=\\\''.jsSafe('rel="external"').'\\\';alert(\\\'This weblink page will now open in a new browser window, leaving the current website page open.\\\')">';					
			$output .= '\');';

			// append  button to weblink attribute	
			$output .= '$j("input[name=link_attributes]").before(\'';
			$output .= '<input type="button" value="Replace window" onclick="document.mutate[\\\'link_attributes\\\'].value=\\\'\\\';alert(\\\'This weblink page will now open in the same browser window, replacing the current website page.\\\')">';					
			$output .= '\');';

			$output .= '$j("input[name=link_attributes]").before(\'<br/>\');';

			$e->output($output . "\n");		
		}
	}
	
} // end of widget

?>