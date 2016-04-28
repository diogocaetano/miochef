$.validator.setDefaults({
	errorElement: 'span',
	highlight: function (element) {
		$(element).closest('.control-group')
			.removeClass('success').addClass('error');
	},
	success: function (element) {
		var icon;
		icon = $('<i>').addClass('icon-ok');
		element.html(icon).addClass('valid').closest('.control-group')
			.removeClass('error').addClass('success');
	}
});

$.extend($.validator.messages, {
	required: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	remote: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	email: '@',
	url: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	date: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	dateISO: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	number: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	digits: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	creditcard: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	equalTo: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	accept: '<i class="fa fa-times-circle" aria-hidden="true"></i>',
	maxlength: $.validator.format("Por favor, digite não mais que {0} caracteres."),
	minlength: $.validator.format("Por favor, digite ao menos {0} caracteres."),
	rangelength: $.validator.format("Por favor, digite um valor entre {0} e {1} caracteres de comprimento."),
	range: $.validator.format("Por favor, digite um valor entre {0} e {1}."),
	max: $.validator.format("Por favor, digite um valor menor ou igual a {0}."),
	min: $.validator.format("Por favor, digite um valor maior ou igual a {0}.")
});
