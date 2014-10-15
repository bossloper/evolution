//<?php
/**
 * htmlentities
 * 
 * encode a placeholder (used for pagetitle)
 *
 * @category 	snippet
 * @version 	1.0
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal	@properties 
 * @internal	@modx_category Content
 */


/*
 * @name htmlentities
 * @author Uxello
 * @license Public Domain
 * @version 1.0
 * 
 */

return htmlentities($modx->documentObject[$placeholder],ENT_COMPAT,$modx->config['modx_charset']);
