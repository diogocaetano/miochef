ApplicationCart = {
	init: function () {
		this.addCartButton();
	},

	// filterList
	addCartButton: function () {
		// function success
		function callActionEventCart(elem, fatherThis, figure, status, event) {
			var elemParent = elem.closest(fatherThis).find(figure),
				wrapQuantBlock = $('<div/>', {
					'class': 'wrap-quant-block',
					'html': '<div class="wrap-info-quant-prod"><span class="quant-prod-cart"></span><span class="text-quant-prod">na cestinha</span></div>',
					'style': 'display:none;'
				}),
				wrapBlockCont = $('.wrap-info-quant-prod'),
				elemQuantInit = elem.parent().attr('data-quantinit'),
				elemMaxQuant = elem.parent().attr('data-maxquant');


			// remove and create element
			// elemParent.find('.wrap-quant-block').remove();
			// add class in parent
			elemParent.addClass('active');
			wrapQuantBlock.appendTo(elemParent);

			setTimeout(function () {
				// if success
				if (status == 'success') {
					// call function callSuccess
					callSuccess();
				} else {
					// call function callError
					callError();
				}
			}, 10);

			// callSuccess
			function callSuccess() {
				setTimeout(function () {
					elemParent.find('.wrap-quant-block').css('display', 'block');
				}, 10);

				// add quant
				var cont = parseInt(elemQuantInit),
					total = parseInt(elemMaxQuant);

				if (event === 'plus') {
					cont += 1;
				} else if (event === 'less') {
					cont -= 1;
				}

				// elem.parent().find('.less-product').attr('data-quantinit', cont);
				elem.parent().attr('data-quantinit', cont);
				elemParent.find('.wrap-quant-block .quant-prod-cart').text(cont);

				// if condictions
				console.log(cont);
				if (cont === total) {
					elem.removeClass('active').addClass('inactive');
				} else if (cont < total) {
					elem.parent().find('.more-product').removeClass('inactive').addClass('active');
				}
				if (cont <= 0) {
					elem.parent().find('.more-product').removeClass('active');
					elem.parent().removeClass('active');
					elemParent.find('.wrap-quant-block').remove();
					elemParent.removeClass('active');
				}

			}

			// callError
			function callError() {
				// remove class in parent and delete div wrap-quant-block
				elemParent.removeClass('active');
				elemParent.find('.wrap-quant-block').remove();
			}
		}

		// click button add
		$(document).on('click', '.more-product', function () {
			var self = $(this),
				selfId = self.attr('data-id');

			// add class for loading call
			self.addClass('active').find('i').removeClass('fa-plus').addClass('fa-circle-o-notch fa-spin fa-3x fa-fw margin-bottom');

			// function success
			callActionEventCart(self, '.list-item', '.img-prod');

			// ajax send info product
			$.ajax({
				// method: "POST",
				url: base_url + "/home",
				data: selfId,
				success: function (result, status, id) {
					// variable id
					var id = id;
					// set id product value in variable id
					id = selfId;

					// add class active
					self.addClass('active').find('i').removeClass('fa-circle-o-notch fa-spin fa-3x fa-fw margin-bottom').addClass('fa-plus');
					// add class active parent wrap-button-buy
					self.closest('.wrap-button-buy').addClass('active');

					// call function
					callActionEventCart(self, '.list-item', '.img-prod', status, 'plus');

				},
				error: function (result, status, id) {
					// remove class active
					self.removeClass('active').find('i').removeClass('fa-circle-o-notch fa-spin fa-3x fa-fw margin-bottom').addClass('fa-plus');
					// remove class active parent wrap-button-buy
					self.closest('.wrap-button-buy').removeClass('active');

					callActionEventCart(self, '.list-item', '.img-prod', status);

				}
			});
		});

		//
		$(document).on('click', '.less-product', function () {
			var self = $(this),
				selfId = self.attr('data-id');

			// add class for loading call
			self.addClass('active').find('i').removeClass('fa-minus').addClass('fa-circle-o-notch fa-spin fa-3x fa-fw margin-bottom');

			// function success
			callActionEventCart(self, '.list-item', '.img-prod');

			// ajax send info product
			$.ajax({
				// method: "POST",
				url: base_url + "/home",
				data: selfId,
				success: function (result, status, id) {
					// variable id
					var id = id;
					// set id product value in variable id
					id = selfId;

					// add class active
					self.addClass('active').find('i').removeClass('fa-circle-o-notch fa-spin fa-3x fa-fw margin-bottom').addClass('fa-minus');
					// add class active parent wrap-button-buy
					self.closest('.wrap-button-buy').addClass('active');

					// call function
					callActionEventCart(self, '.list-item', '.img-prod', status, 'less');

				},
				error: function (result, status, id) {
					// call function
					callActionEventCart(self, '.list-item', '.img-prod', status);
				}
			});

		});
	}

};


$(document).on("ready", function () {
	ApplicationCart.init();

});
