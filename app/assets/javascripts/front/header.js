ApplicationHeader = {
	init: function () {
		this.dateSelect();
		this.dropFilterList();
	},

	// dateSelect
	dateSelect: function () {
		// click active select week
		$(document).on('click', '#wrap-select-date-food', function () {
			var self = $(this);

			// if active or not
			if (self.hasClass('active')) {
				self.removeClass('active');
				// hide select week
				$('#wrap-food-timeline').css({
					'bottom': '10%'
				});
			} else {
				self.addClass('active');
				// show select week
				$('#wrap-food-timeline').css({
					'bottom': '-89%'
				});
			}
		});
	},

	// fropFilterList
	dropFilterList: function () {
		$(document).on('click', '.filter-title', function () {
			var self = $(this).closest('.select-filter');

			// if active or not
			if (self.hasClass('active')) {
				self.removeClass('active');
				// hide drop
				self.find('.drop').stop(false, true).fadeOut(200);
			} else {
				self.addClass('active');
				// show drop
				self.find('.drop').stop(true, false).fadeIn(200);
			}
		});

		// create and add remove clean button in list
		$('#filter-select .drop').each(function (e) {
			var clearList = $('<strong>', {
				'class': 'clear-all-actives-drop',
				'html': 'limpar filtro'
			});

			clearList.appendTo($(this));
		});

		// clear filter list
		$(document).on('click', '.clear-all-actives-drop', function () {
			var self = $(this);

			// remove all class active
			self.parent().find('span').removeClass('active');

			// call function
			checkDropItem(self.parent().find('span'));
		});

		// function verification if drop item select
		function checkDropItem(elem) {
			// print screen length active itens
			var quantItemActive = elem.parent().find('.active').length;

			// verification if quant item > 0
			if (quantItemActive > 0) {
				elem.closest('.select-filter').find('.quant-itens-show').text(quantItemActive).addClass('active');
			} else {
				elem.closest('.select-filter').find('.quant-itens-show').text('').removeClass('active');
			}

			// verification if elem has class active
			if (elem.hasClass('active')) {
				elem.closest('.select-filter').addClass('check');
			} else {
				if (quantItemActive == 0) {
					elem.closest('.select-filter').removeClass('check');
				}
			}
		}

		// click drop item
		$(document).on('click', '.drop span', function () {
			var self = $(this);

			// if active or not
			if (self.hasClass('active')) {
				self.removeClass('active');
				// call function
				checkDropItem(self);
			} else {
				self.addClass('active');
				// call function
				checkDropItem(self);
			}
		});


	}

};


$(document).on("ready", function () {
	ApplicationHeader.init();
});
