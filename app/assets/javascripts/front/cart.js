ApplicationCart = {
	init: function () {
		this.addCartButton();
	},

	// filterList
	addCartButton: function () {
		$(document).on('click', '.more-product', function (e) {
			var self = $(this),
				selfId = self.attr('data-id');

			$.ajax({
				// method: "POST",
				url: base_url + "/home",
				data: selfId,
				success: function (result) {

				},
				error: function (result) {
					console.log('erro');
				}
			});
		});
	}

};


$(document).on("ready", function () {
	ApplicationCart.init();
});
