<?php

//---------------------------------------------------------------------------------
// mm_widget_synchalias
// Synch alias to title by setting to blank if title is changed
//--------------------------------------------------------------------------------- 

function mm_widget_synchalias($roles='', $templates='') {
	global $modx, $content, $base_url, $mm_fields;

	$e = &$modx->Event;

		
	// if the current page is being edited by someone in the list of roles, and uses a template in the list of templates
	if ($e->name == 'OnDocFormRender' && useThisRule($roles, $templates)){
	
		$output = " // ----------- Synch alias field -------------- \n";
	
		// Output some javascript to sync these field
		$output .=  '$j("input[name=\'pagetitle\']").keyup( function() { 
								$j("input[name=\'alias\']").val("");
				} );
			';
			
		$e->output($output . "\n");
		
	}	// end if
}	// end of widget

?>