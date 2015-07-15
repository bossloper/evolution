<!-- welcome -->
<div style="margin: 20px 12px;">
	<script type="text/javascript" src="media/script/tabpane.js"></script>
	<div class="tab-pane" id="welcomePane" style="border:0">
    <script type="text/javascript">
        tpPane = new WebFXTabPane(document.getElementById( "welcomePane" ),false);
    </script>

		<!-- home tab UXELLO MOD to remove MODx image and titles -->
		<div class="tab-page" id="tabhome" style="padding-left:0; padding-right:0;">
[+OnManagerWelcomePrerender+]			
			<h2 class="tab">[+site_name+]</h2>
			<script type="text/javascript">tpPane.addTabPage( document.getElementById( "tabhome" ) );</script>
			<div class="sectionHeader">[+welcome_title+]</div>
			<div class="sectionBody">
                <table border="0" cellpadding="5">
                  <tr>
                    <td colspan="2">
                        <h1 style="margin:0">[+site_name+]</h1>
                    </td>
                  </tr>
                  <tr>
                    <td valign="top">
[+OnManagerWelcomeHome+]
                        <span class="wm_button" style="border:0">[+SecurityIcon+]</span>
                        <span class="wm_button" style="border:0">[+WebUserIcon+]</span>
                        <span class="wm_button" style="border:0">[+ModulesIcon+]</span>
                        <span class="wm_button" style="border:0">[+ResourcesIcon+]</span>
                        <span class="wm_button" style="border:0">[+BackupIcon+]</span>
                        <br style="clear:both" /><br />
         			<!--uxello acrivity table-->
			<div class="sectionHeader">[+activity_title+]</div><div class="sectionBody">
				[+RecentInfo+]
			</div>
                    </td>
                  </tr>
                </table>
			</div>
		</div>
		
		<!-- system check -->
		<div class="tab-page" id="tabcheck" style="display:[+config_display+]; padding-left:0; padding-right:0;">
			<h2 class="tab" style="display:[+config_display+]"><strong style="color:#ffeb00;">[+settings_config+]</strong></h2>
			<script type="text/javascript"> if('[+config_display+]'=='block') tpPane.addTabPage( document.getElementById( "tabcheck" ) );</script>
			<div class="sectionHeader">[+configcheck_title+]</div>
			<div class="sectionBody">
				<img src="media/style/[+theme+]/images/icons/error.png" />
				[+config_check_results+]
			</div>
		</div>
		
		<!-- modx news -->
		<div class="tab-page" id="tabNews" style="padding-left:0; padding-right:0">
			<h2 class="tab">CMS News</h2>
			<script type="text/javascript">tpPane.addTabPage( document.getElementById( "tabNews" ) );</script>
			<div class="sectionHeader">[+modx_news_title+]</div><div class="sectionBody">
				[+modx_news_content+]
			</div>
		</div>	


		<!-- online info -->
		<div class="tab-page" id="tabOnline" style="padding-left:0; padding-right:0">
			<h2 class="tab">[+online+]</h2>
			<script type="text/javascript">tpPane.addTabPage( document.getElementById( "tabOnline" ) );</script>
			<div class="sectionHeader">[+onlineusers_title+]</div><div class="sectionBody">
				[+OnlineInfo+]
			</div>
		</div>
[+OnManagerWelcomeRender+]
	</div>
</div>