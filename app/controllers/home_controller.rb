class HomeController < ActionController::Base

	layout 'front/front'
	def index
		render "home"
	end
end
