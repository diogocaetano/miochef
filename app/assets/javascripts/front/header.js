ApplicationHeader = {
	init: function () {
		this.dateSelect();
		this.dropFilterList();
		this.filterXs();
		this.menuResponsive();
		this.scrollFilterPage();
		this.scrollLogoMenu();
	},

	// dateSelect
	dateSelect: function () {
		// click active select week
		$(document).on('click', '.wrap-select-date-food', function () {
			var self = $('.wrap-select-date-food');

			// if active or not
			if (self.hasClass('active')) {
				self.removeClass('active');
				// hide select week
				$('#wrap-food-timeline').css({
					'top': '-130px'
				});
			} else {
				self.addClass('active');
				// show select week
				$('#wrap-food-timeline').css({
					'top': $('#wrap-cep-info').outerHeight() + 'px'
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

			// clearList.appendTo($(this));
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
	},

	// filterXs
	filterXs: function () {
		function visibleFilter() {
			// verification if elem is block
			if ($('#active-filter-menu-xs').css('display') == 'block') {
				$('#filter-select').hide();
			} else {
				$('#active-filter-menu-xs').removeClass('active');
				$('#filter-select').show();
			}
		}
		// call function
		visibleFilter();

		// resize call function
		$(window).bind({
			resize: function () {
				visibleFilter();
			}
		});

		// click event
		$(document).on('click', '#active-filter-menu-xs', function () {
			var self = $(this);

			// if active or not
			if (self.hasClass('active')) {
				self.removeClass('active');
				$('#filter-select').stop(true, true).fadeOut(200);
			} else {
				self.addClass('active');
				$('#filter-select').stop(true, true).fadeIn(300);
			}
		});
	},

	// menuResponsive
	menuResponsive: function () {
		// add class menu responsive show
		$(document).on('click', '#active-menu-responsive', function () {
			$('#menu-responsive').addClass('active');
			$('#wrap-site').addClass('blur');
		});
		// remove class menu responsive hide
		$(document).on('click', '#close-menu-responsive', function () {
			$('#menu-responsive').removeClass('active');
			$('#wrap-site').removeClass('blur');
		});
	},

	// scrollFilterPage
	scrollFilterPage: function () {
		// reset scroll page
		$('html, body').scrollTop('0');

		// set position initial
		var positionWrapCep = $('#wrap-cep-select-filter').offset().top;

		// function validate position menu
		function scrollValidate() {
			// set height wrap-cep-select-filter
			$(window).scroll(function () {
				// verification if > position
				if ($(this).scrollTop() >= $('#wrap-cep-select-filter').offset().top) {
					$('#wrap-cep-info').addClass('scroll-active');
					$('#wrap-food-timeline').addClass('fixed');
				}
				if ($(this).scrollTop() <= positionWrapCep || $(window).width() < 980) {
					$('#wrap-cep-info').removeClass('scroll-active');
					$('#wrap-food-timeline').removeClass('fixed');
				}
			});
		}

		// veridicarion size window and call functino
		if ($(window).width() > 980) {
			scrollValidate();
		}
		// verification size window
		$(window).bind({
			resize: function () {
				if ($(window).width() > 980) {
					scrollValidate();
				}
			}
		});
	},

	// scrollLogoMenu
	scrollLogoMenu: function () {
		// set position initial
		var positionWrapLogo = $('#logo-header').offset().top;

		// function validate position menu
		function scrollValidateLogo() {
			// set height wrap-cep-select-filter
			$(window).scroll(function () {
				// verification if > position
				if ($(this).scrollTop() >= 0) {
					$('#logo-header').addClass('scroll-active');
					$('#wrap-menu-logo').addClass('fixed');
				}
				if ($(this).scrollTop() <= positionWrapLogo || $(window).width() > 980) {
					$('#logo-header').removeClass('scroll-active');
					$('#wrap-menu-logo').removeClass('fixed');
				}
			});
		}

		// veridicarion size window and call functino
		if ($(window).width() <= 980) {
			scrollValidateLogo();
		}
		// verification size window
		$(window).bind({
			resize: function () {
				if ($(window).width() <= 980) {
					scrollValidateLogo();
				}
			}
		});
	}

};


$(document).on("ready", function () {
	if ($('#header-default').length > 0) {
		ApplicationHeader.init();
	}
});
