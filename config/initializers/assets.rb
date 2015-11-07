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
	jquery.dcjqaccordion.2.7.js
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

  	bootstrap.min.css
  	bootstrap-reset.css
  	font-awesome.css
  	jquery.easy-pie-chart.css
  	owl.carousel.css
  	slidebars.css
  	style.css
  	style-responsive.css
)