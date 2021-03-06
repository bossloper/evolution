//<?php
/**
 * TinyMCE Rich Text Editor
 * 
 * Javascript WYSIWYG Editor
 *
 * @category    plugin
 * @version     3.5.11
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal    @properties &customparams=Custom Parameters;textarea;template_external_list_url : "TinyMCEtemplates.js", paste_remove_spans: "True",formats : { alignleft   : {selector : 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img,iframe', classes : 'justifyleft'}, alignright  : {selector : 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img,iframe', classes : 'justifyright'}, alignfull   : {selector : 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img,iframe', classes : 'justifyfull'}, aligncenter   : {selector : 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img,iframe', classes : 'justifycenter'} } &mce_formats=Block Formats;text;p,h2,h3,h4,h5,h6 &entity_encoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &mce_path_options=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &mce_resizing=Advanced Resizing;list;true,false;true &disabledButtons=Disabled Buttons;text; &link_list=Link List;list;enabled,disabled;enabled &webtheme=Web Theme;list;simple,editor,creative,custom;simple &webPlugins=Web Plugins;text;style,advimage,advlink,searchreplace,contextmenu,paste,fullscreen,xhtmlxtras,media &webButtons1=Web Buttons 1;text;undo,redo,selectall,|,pastetext,pasteword,|,search,replace,|,hr,charmap,|,image,link,unlink,anchor,media,|,cleanup,removeformat,|,fullscreen,code,help &webButtons2=Web Buttons 2;text;bold,italic,underline,strikethrough,sub,sup,|,|,blockquote,bullist,numlist,outdent,indent,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,|,styleprops &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;500
 * @internal    @events OnRichTextEditorRegister,OnRichTextEditorInit,OnInterfaceSettingsRender 
 * @internal    @modx_category Manager and Admin
 * @internal    @legacy_names TinyMCE
 * @internal    @installset base
 *
 * @author Jeff Whitfield
 * @author Mikko Lammi / updated: 03/09/2010
 * @author yama / updated: 2014-05-16
 * @author Dmi3yy / updated: 2013-11-01
 * @author Kari Söderholm aka Haprog / updated: 2014-04-02
 */

require MODX_BASE_PATH.'assets/plugins/tinymce/plugin.tinymce.php';
