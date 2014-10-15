jQuery("html:first").removeClass("no-js");
jQuery("html:first").addClass("js");

jQuery(function() {
    
    var rwdcookie = jQuery.cookie('rwdcookie');

    if (rwdcookie == 'rwdoff') {
        jQuery('body').removeClass("rwd");
    }
    else {
/*      jQuery('#menutabs ul').removeClass();*/
jQuery('#menuswitch').meanmenu( {meanRemoveAttrs:true,meanScreenWidth: "480"} );
    }

    jQuery("#togglerwd").click(function (e) {
        if (jQuery('body').is('.rwd')) {
            jQuery.cookie('rwdcookie', 'rwdoff');
        } else {
            jQuery.cookie('rwdcookie', 'rwdon');
        }
        /* then follows href link to refresh page... */
    });

});
