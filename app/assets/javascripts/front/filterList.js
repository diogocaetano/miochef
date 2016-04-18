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
					filterInput = $('#filter-base').attr('value').split(',');

				for (var i = filterInput.length - 1; i >= 0; i--) {
					console.log(filterInput[i]);
					if ($.inArray(filterInput[i], selfListFilter) > -1) {
						self.show();
					} else {
						if (filterInput[i].length === 0 || filterInput.length === 0) {
							self.show();
						} else {
							self.hide();
						}
					}
				}


			});
			// console.log(newArrayFilter);

		});

	}

};


$(document).on("ready", function () {
	ApplicationFilter.init();
});
