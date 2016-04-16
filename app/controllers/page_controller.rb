class PageController < ActionController::Base

  layout 'front/front'
  def about
  end
  def about_view
    render "about_view"
  end
end
