$(function () {
	var form = $("form");

	form.validate({
		rules: {
			field: {
				required: true
			}
		}
	});

});
