ApplicationPages = {
	init: function () {
		this.loadingPage();
		this.printPage();
	},

	// loadingPage
	loadingPage: function () {
		$(document).ready(function () {
			var self = $('#home-page, #pages-int');

			self.addClass('active');
		});
	},

	// printPage
	printPage: function () {
		$('.print-link').click(function () {
      $("#info-user-block").printElement();
		});
	}

};


$(document).on("ready", function () {
	ApplicationPages.init();
});
