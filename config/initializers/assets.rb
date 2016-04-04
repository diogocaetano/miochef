# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( 
	jquery.js
	bootstrap.min.js
	summernote.js
	summernote-pt-BR.js
	advanced-form-components.js
	jquery.dcjqaccordion.2.7.js
	bootstrap-datetimepicker.js
	jquery.scrollTo.min.js
	jquery.nicescroll.js
	jquery.sparkline.js
	jquery.easy-pie-chart.js
	owl.carousel.js
	jquery.customSelect.min.js
	respond.min.js
	slidebars.min.js
	common-scripts.js
	sparkline-chart.js
	easy-pie-chart.js
	count.js
	jquery.multi-select.js
	jquery.quicksearch.js
	
	bootstrap-timepicker.js
	spinner.js
	bootstrap-fileupload.js
	wysihtml5-0.3.0.js
	bootstrap-wysihtml5.js
	bootstrap-datepicker.js
  	bootstrap-datetimepicker.js
  	moment.min.js
  	daterangepicker.js
  	bootstrap-colorpicker.js
  	bootstrap-timepicker.js
  	jquery.multi-select.js
  	jquery.quicksearch.js
   	common-scripts.js
   	bootstrap-tagsinput.js
   	bootstrap3-typeahead.js
   	jquery.maskMoney.min.js

  	bootstrap.min.css
  	summernote.css
  	bootstrap-reset.css
  	font-awesome.css
  	jquery.easy-pie-chart.css
  	owl.carousel.css
  	slidebars.css
  	style.css
  	style-responsive.css
  	multi-select.css
	bootstrap-fileupload.css
	bootstrap-wysihtml5.css
	datepicker.css
	timepicker.css
	colorpicker.css
	daterangepicker.css
	datetimepicker.css
	bootstrap-tagsinput.css
	bootstrap-tagsinput-typeahead.css

	digg_pagination.css
)