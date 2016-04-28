ApplicationForm = {
	init: function () {
		this.removePhotoBannerPerfil();
	},

	// removePhotoBannerPerfil
	removePhotoBannerPerfil: function () {
		$(document).on('click', '.remove-img', function () {
			var self = $(this),
				selfId = self.attr('data-iduser');

			// ajax send info product
			$.ajax({
				// method: "POST",
				url: base_url + "/home",
				data: selfId,
				success: function (result, status, id) {
					// remove photo
				},
				error: function (result, status, id) {
					// not remove photo
				}
			});

			return false;
		});
	}

};


$(document).on("ready", function () {
	ApplicationForm.init();
});
