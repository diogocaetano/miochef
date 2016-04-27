$(function () {
	var form = $("form");

	form.validate({
		rules: {
			field: {
				required: true
			},
			password: {
				required: true
			},
			cfmpassword: {
				equalTo: "#password"
			}
		}
	});

});
