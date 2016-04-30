$(function () {
	var form = $("form");

	form.validate({
		rules: {
			password: {
				required: true
			},
			cfmpassword: {
				equalTo: "#password"
			}
		}
	});
	$.validator.addClassRules("validate-signup", {
		required: true
	});


});
