ApplicationPages = {
	init: function () {
		this.loadingPage();
	},

	// loadingPage
	loadingPage: function () {
		$(document).ready(function () {
			var self = $('#home-page, #pages-int');

			self.addClass('active');
		});
	}

};


$(document).on("ready", function () {
	ApplicationPages.init();
});
