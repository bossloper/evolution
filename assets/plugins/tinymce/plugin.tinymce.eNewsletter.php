<?php
// eNewsletter version

if(!defined('MODX_BASE_PATH')){die('What are you doing? Get out of here!');}
// Set the name of the plugin folder

global $usersettings,$settings;

// Set path and base setting variables

$params['mce_path']         = $mce_path;
$params['mce_url']          = $mce_url;
	
		
		
$plugin_dir = 'tinymce';
include_once("{$mce_path}functions.php");

$mce = new TinyMCE();

// Handle event
$e = &$modx->event; 
switch ($e->name)
{

	case "OnRichTextEditorInit":
		if($editor!=='TinyMCEeNewsletter') return;
		$html = $mce->get_mce_script();
		$e->output($html);
		break;

   default :
      return; // stop here - this is very important. 
      break; 
}
