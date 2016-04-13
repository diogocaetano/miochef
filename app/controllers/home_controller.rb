class HomeController < ActionController::Base

	layout 'front/front'
	def index
		render "home"
	end
  def view
    # render "view"
  end
end
