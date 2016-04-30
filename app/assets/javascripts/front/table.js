ApplicationTable = {
	init: function () {
		this.searchTable();
		this.quantItensTable();
	},

	// searchTable
	searchTable: function () {
		$('#search-table').keyup(function () {
			var self = $(this);

			// searchText
			searchText(self);
		});

		function searchText(elem) {
			var filter = $(elem).val().replace(/[áàâã]/g, 'a').replace(/[éèê]/g, 'e').replace(/[óòôõ]/g, 'o').replace(/[úùû]/g, 'u').replace(/[ç]/g, 'c').replace(/[.]/g, '').toLowerCase(),
				selfs = $('.list-block');

			selfs.each(function () {
				var text = $(this).text().replace(/[áàâã]/g, 'a').replace(/[éèê]/g, 'e').replace(/[óòôõ]/g, 'o').replace(/[úùû]/g, 'u').replace(/[ç]/g, 'c').replace(/[.]/g, '').toLowerCase();

				if (text.indexOf(filter) < 0) {
					$(this).hide().addClass('inactive-tr').removeClass('active-tr');
				} else {
					$(this).show().addClass('active-tr').removeClass('inactive-tr');
				}
			});

			var logError = $('<tr />', {
				'class': 'table-error',
				'html': '<td colspan="5">Nada encontrado</td>'
			});

			if ($('.inactive-tr').length == selfs.length) {
				$('.table-error').remove();
				logError.appendTo('#table-historical');
			} else {
				$('.table-error').remove();
			}


		}
	},

	// quantItensTable
	quantItensTable: function () {
		var qauntTd = parseInt($('#table-historical tr').length) - 1;

		// inset quant in total-prod-hist
		$('.total-prod-hist span').text(qauntTd);

		if (qauntTd > 1) {
			$('.total-prod-hist i').text('itens');
		} else {
			$('.total-prod-hist i').text('item');
		}
	}

};


$(document).on("ready", function () {
	ApplicationTable.init();
});
