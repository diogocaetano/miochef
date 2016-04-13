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

  	template/bootstrap.min.css
  	template/bootstrap-reset.css
  	template/font-awesome.css
  	template/jquery.easy-pie-chart.css
  	template/owl.carousel.css
  	template/slidebars.css
  	template/style.css
  	template/style-responsive.css
  	template/multi-select.css
	template/bootstrap-fileupload.css
	template/bootstrap-wysihtml5.css
	template/datepicker.css
	template/timepicker.css
	template/colorpicker.css
	template/daterangepicker.css
	template/datetimepicker.css
	template/digg_pagination.css
)