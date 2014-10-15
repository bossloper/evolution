//<?php
/**
 * parentTitle
 * 
 * used by unews template
 *
 * @category 	snippet
 * @version 	1.0
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal	@properties 
 * @internal	@modx_category Content
 */


/*
 * @name parentTitle
 * @author Uxello
 * @license Public Domain
 * @version 1.0
 * 
 */

//get parent

$parentID = $modx->documentObject['parent'];
if ($parentID) {
  $docObject = $modx->getDocumentObject('id', $parentID);
  $content = $docObject['pagetitle'];
  //output the data to wherever the snippet is being called
  return $content;
}
else {
  return false;
}
