ApplicationMenu = {
	init: function () {
		this.menuResponsive();
	},

	// menuResponsive
	menuResponsive: function () {
		// add class menu responsive show
		$(document).on('click', '#active-menu-responsive', function () {
			$('#menu-responsive').addClass('active');
			// $('#wrap-site').addClass('blur');
		});
		// remove class menu responsive hide
		$(document).on('click', '#close-menu-responsive', function () {
			$('#menu-responsive').removeClass('active');
			// $('#wrap-site').removeClass('blur');
		});
	}

};


$(document).on("ready", function () {
	ApplicationMenu.init();
});
