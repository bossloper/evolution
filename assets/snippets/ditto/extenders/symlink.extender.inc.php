<?php
/*
 * Ditto Extender: symlink.extender.inc.php
 * Links document or follows weblink
 * Released under the terms of General Public License
 * Copyright (c) 2010 Aleksander Maksymiuk, http://setpro.pl/

 * Parameters: no parameters required
 * Sample usage: display main menu (i.e. first level of document's tree)
 *  [[Ditto? &parents=`0` &depth=`1` &display=`all` &tpl=`menu-lev-1` &orderBy=`menuindex ASC` &extenders=`symlink`]]
 *  sample "menu-lev-1" template:
 *   <p><a href="[+symlink+]">[+pagetitle+]</a></p>
 * Notice: [+symlink+] placeholder is substituted with either a link to regular document or a target that weblink points to
 */

$placeholders['symlink'] = array('id,type,content', 'setSymlinkPlaceholder');

if (!function_exists('setSymlinkPlaceholder')) {
  function setSymlinkPlaceholder($resource) {
    return ($resource['type'] == 'reference' ?
      (is_numeric($resource['content']) ?
        '[~' . $resource['content'] . '~]' :
        $resource['content']
      ) :
      '[~' . $resource['id'] . '~]'
    );
  }
}

?>
