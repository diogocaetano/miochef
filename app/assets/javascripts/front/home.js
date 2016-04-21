ApplicationHome = {
	init: function () {
		this.loadingPage();
	},

	// loadingPage
	loadingPage: function () {
		$(document).ready(function () {
			$('#home-page').addClass('active');
		});
	}

};


$(document).on("ready", function () {
	ApplicationHome.init();
});
