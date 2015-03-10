<?php
if(IN_MANAGER_MODE!="true") die("<b>INCLUDE_ORDERING_ERROR</b><br /><br />Please use the MODX Content Manager instead of accessing this file directly.");
if(!$modx->hasPermission('edit_web_user')) {
	$modx->webAlertAndQuit($_lang["error_no_privileges"]);
}

// initialize page view state - the $_PAGE object
$modx->manager->initPageViewState();

// get and save search string
if($_REQUEST['op']=='reset') {
	$query = '';
	$_PAGE['vs']['search']='';
}
else {
	$query = isset($_REQUEST['search'])? $_REQUEST['search']:$_PAGE['vs']['search'];
	$sqlQuery = $modx->db->escape($query);
	$_PAGE['vs']['search'] = $query;
}

// get & save listmode
$listmode = isset($_REQUEST['listmode']) ? $_REQUEST['listmode']:$_PAGE['vs']['lm'];
$_PAGE['vs']['lm'] = $listmode;


// context menu
include_once MODX_MANAGER_PATH."includes/controls/contextmenu.php";
$cm = new ContextMenu("cntxm", 150);
$cm->addItem($_lang["edit"],"js:menuAction(1)",$_style["icons_edit_document"],(!$modx->hasPermission('edit_user') ? 1:0));
$cm->addItem($_lang["delete"], "js:menuAction(2)",$_style["icons_delete"],(!$modx->hasPermission('delete_user') ? 1:0));
echo $cm->render();

?>
<script language="JavaScript" type="text/javascript">
  	function searchResource(){
		document.resource.op.value="srch";
		document.resource.submit();
	};

	function resetSearch(){
		document.resource.search.value = ''
		document.resource.op.value="reset";
		document.resource.submit();
	};

	function changeListMode(){
		var m = parseInt(document.resource.listmode.value) ? 1:0;
		if (m) document.resource.listmode.value=0;
		else document.resource.listmode.value=1;
		document.resource.submit();
	};

	var selectedItem;
	var contextm = <?php echo $cm->getClientScriptObject(); ?>;
	function showContentMenu(id,e){
		selectedItem=id;
		contextm.style.left = (e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft)))+"px";
		contextm.style.top = (e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop)))+"px";
		contextm.style.visibility = "visible";
		e.cancelBubble=true;
		return false;
	};
	
	function menuAction(a) {
		var id = selectedItem;
		switch(a) {
			case 1:		// edit
				window.location.href='index.php?a=88&id='+id;
				break;
			case 2:		// delete
				if(confirm("<?php echo $_lang['confirm_delete_user']; ?>")==true) {
					window.location.href='index.php?a=90&id='+id;
				}
				break;
		}
	}

	document.addEvent('click', function(){
		contextm.style.visibility = "hidden";
	});
</script>
<form name="resource" method="post">
<input type="hidden" name="id" value="<?php echo $id; ?>" />
<input type="hidden" name="listmode" value="<?php echo $listmode; ?>" />
<input type="hidden" name="op" value="" />

<h1><?php echo $_lang['web_user_management_title']; ?></h1>
<div class="section">
<div class="sectionBody">
	<p><?php echo $_lang['web_user_management_msg']; ?></p>
    
    
       	<?php 
    //uxello add webuser summary
	    
	$sql = "SELECT count(wu.id) as ct FROM ".$modx->getFullTableName("web_users")." wu ";
	$rs = mysql_query($sql);
	if (mysql_num_rows($rs) == 1) {
		while ($row = mysql_fetch_assoc($rs)) {
			echo "<p>Total web users: ".$row['ct'].'</p>';
		}
	}

	$sql = "SELECT  count(wu.id) as ct"
			." FROM ".$modx->getFullTableName("web_users")." wu "
			." INNER JOIN ".$modx->getFullTableName("web_user_attributes")." wua ON wua.internalKey=wu.id "
			." WHERE wua.logincount"
			;		
	$rs = mysql_query($sql);
	if (mysql_num_rows($rs) == 1) {
		while ($row = mysql_fetch_assoc($rs)) {
			echo "<p>Successfully registered and logged in:".$row['ct'].'</p>';
		}
	}

	$timetocheck = (time()-(60*60*24));//+$server_offset_time;
	$sql = "SELECT count(au.internalKey) as ct FROM ".$modx->getFullTableName("active_users")." au WHERE au.internalKey<0 AND au.lasthit>'$timetocheck'";
	$rs = mysql_query($sql);
	if (mysql_num_rows($rs) == 1) {
		while ($row = mysql_fetch_assoc($rs)) {
			echo "<p>Seen in the last 24hrs: ".$row['ct'].'</p>';
		}
	}
	
    ?>
    
    
    
	<div class="searchbar">
		<table border="0" style="width:100%" class="actionButtons">
			<tr>
			<td><a href="index.php?a=87"><img src="<?php echo $_style["icons_save"] ?>" /> <?php echo $_lang['new_web_user']; ?></a></td>
			<td nowrap="nowrap">
				<table border="0" style="float:right"><tr><td><?php echo $_lang["search"]; ?></td><td><input class="searchtext" name="search" type="text" size="15" value="<?php echo $query; ?>" /></td>
				<td><a href="#" title="<?php echo $_lang["search"];?>" onclick="searchResource();return false;"><?php echo $_lang["go"]; ?></a></td>
				<td><a href="#" title="<?php echo $_lang["reset"];?>" onclick="resetSearch();return false;"><img src="<?php echo $_style["icons_refresh"]; ?>" /></a></td>
				<td><a href="#" title="<?php echo $_lang["list_mode"];?>" onclick="changeListMode();return false;"><img src="<?php echo $_style["icons_table"]; ?>" /></a></td>
				</tr>
				</table>
			</td>
			</tr>
		</table>
	</div>
	<div>
	<?php
//uxello add webgroups
	$sql = "SELECT GROUP_CONCAT(wgn.name SEPARATOR ', ') AS webgroups,wu.id,wu.username,wua.fullname,wua.email,IF(wua.gender=1,'".$_lang['user_male']."',IF(wua.gender=2,'".$_lang['user_female']."','-')) as 'gender',IF(wua.blocked,'".$_lang['yes']."','-') as 'blocked'" .

//uxello add email dup check
",IF(wuae.ct>1,' (Warning: shared email address)',' ') as 'ctfmt'".
",FROM_UNIXTIME(wuau.lasthit,'%Y/%m/%d') as 'lastseenfmt'".
",ip as 'ip'".
	
			"FROM ".$modx->getFullTableName("web_users")." wu ".
			"INNER JOIN ".$modx->getFullTableName("web_user_attributes")." wua ON wua.internalKey=wu.id ".
			
//uxello add email dup check			
"LEFT JOIN (select email, count(email) as ct from ".$modx->getFullTableName("web_user_attributes")." WHERE email !='' GROUP BY email) wuae ON wuae.email=wua.email ".

"LEFT JOIN ".$modx->getFullTableName("active_users")." wuau ON -wuau.internalKey=wu.id AND wuau.internalKey<0 ".


//uxello add webgroups
    "LEFT JOIN ".$modx->getFullTableName("web_groups")." AS wg ON wu.id = wg.webuser ".
    "LEFT JOIN ".$modx->getFullTableName("webgroup_names")." AS wgn ON wg.webgroup = wgn.id ".


			
			($sqlQuery ? " WHERE (wu.username LIKE '{$sqlQuery}%') OR (wua.fullname LIKE '%{$sqlQuery}%') OR (wua.email LIKE '%{$sqlQuery}%')":"")." ".
			"GROUP BY wu.id ORDER BY username"; //uxello add webgroups
	$ds = mysql_query($sql);
	include_once $base_path."manager/includes/controls/datagrid.class.php";
	$grd = new DataGrid('',$ds,$number_of_results); // set page size to 0 t show all items
	$grd->noRecordMsg = $_lang["no_records_found"];
	$grd->cssClass="grid";
	$grd->columnHeaderClass="gridHeader";
	$grd->itemClass="gridItem";
	$grd->altItemClass="gridAltItem";
//uxello	$grd->fields="id,username,fullname,email,gender,blocked";
$grd->fields="id,username,fullname,email,lastlogin,blocked,webgroups";
//uxello	$grd->columns=$_lang["icon"]." ,".$_lang["name"]." ,".$_lang["user_full_name"]." ,".$_lang["email"]." ,".$_lang["user_gender"]." ,".$_lang["user_block"];
	$grd->columns=$_lang["icon"]." ,".$_lang["name"]." ,".$_lang["user_full_name"]." ,".$_lang["email"]." ,Last Login (IP) ,".$_lang["user_block"].", Webgroup(s)";
	$grd->colWidths="34,,,,40,34";
	$grd->colAligns="center,,,,,,";
	$grd->colTypes="template:<a class='gridRowIcon' href='#' onclick='return showContentMenu([+id+],event);' title='".$_lang["click_to_context"]."'><img src='".$_style["icons_user"]."' /></a>||template:<a href='index.php?a=88&id=[+id+]' title='".$_lang["click_to_edit_title"]."'>[+value+]</a>
	
||||template:[+value+][+ctfmt+]||template:[+lastseenfmt+]&nbsp;([+ip+])";	
	
	if($listmode=='1') $grd->pageSize=0;
	if($_REQUEST['op']=='reset') $grd->pageNumber = 1;
	// render grid
	echo $grd->render();
	?>
	</div>
</div></div>
</form>
