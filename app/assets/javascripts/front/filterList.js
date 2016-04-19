ApplicationFilter = {
	init: function () {
		this.filterList();
	},

	// filterList
	filterList: function () {
		// create array filter
		var arrayFilter = [];
		// add data in array filter
		$(document).on('click', '.drop span', function () {
			var self = $(this),
				selfDataFilter = self.attr('data-text'),
				index = '';

			// check if self has class active.
			if (!self.hasClass('active')) {
				// if true, remove item array
				arrayFilter.splice($.inArray(selfDataFilter, arrayFilter), 1);
			} else {
				arrayFilter.push(selfDataFilter);
			}
			// add arry in value input id filtar-base
			$('#filter-base').attr('value', arrayFilter);

			var selfList = $('.list-item');

			var filterArray = new Array();

			selfList.each(function () {
				var self = $(this),
					selfListFilter = self.data('filter').split(','),
					filterInput = $('#filter-base').attr('value').split(','),
					arrayLenght = parseInt(selfListFilter.length),
					quantElem = parseInt($(selfListFilter).not(arrayFilter).get().length);


				// console.log(quantElem + " - " + arrayLenght);
				if (quantElem === arrayLenght) {
					self.hide();
					if (arrayFilter.length === 0) {
						self.show();
					}
				} else {
					// alert(0)
					self.show();
				}
				// $.grep(selfListFilter, function (el) {

				// });
				// if ($.inArray(filterInput, selfListFilter) > -1) {
				// 	self.show();
				// } else {
				// 	if (filterInput.length === 0 || filterInput.length === 0) {
				// 		self.show();
				// 	} else {
				// 		self.hide();
				// 	}
				// }

				//     for (var i = arrayFilter.length - 1; i >= 0; i--) {
				// }

			});

		});

	}

};


$(document).on("ready", function () {
	ApplicationFilter.init();
});
