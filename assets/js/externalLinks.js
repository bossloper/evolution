// uxello convert all external link clicks to new window
// ensure jquery library is loaded first!
jQuery(document).ready(function($)	
{
	// all external links except those overriden with rel=internal 
	// (ignore external too to prevent double open ... as picked up by last check)
	jQuery("a[href*='http://']:not([href*='"+location.hostname+"']):not([rel*=external]):not([rel*=internal])").click( function() {
		window.open(this.href);
		return false;
	});
	jQuery("a[href*='https://']:not([href*='"+location.hostname+"']):not([rel*=external]):not([rel*=internal])").click( function() {
		window.open(this.href);
		return false;
	});

	// internal assets (jpgs, pdfs etc)
	jQuery("a[href*='assets/']:not([href*='assets/galleries/']):not([rel*=external])").click( function() {
		window.open(this.href);
		return false;
	});
	
	
	// internal downloads table
	jQuery("a[href*='?d=']:not([href*='assets/galleries/']):not([rel*=external])").click( function() {
		window.open(this.href);
		return false;
	});
	
	// specifically targeted catchall
	jQuery("a[rel*=external]").click( function() {
		window.open(this.href);
		return false;
	});	
});


