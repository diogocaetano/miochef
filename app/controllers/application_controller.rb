class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_modules_category
  before_action :user_has_permission_to_action?

  def get_modules_category
  	@categories = ModulesCategory.all    
  end

  def user_has_permission_to_action?
    if not params[:controller] == 'dashboard'
      @module = Entity.where(slug: params[:controller]).first
      @permission = Permission.where(entity_id: @module.id).where(action: params[:action]).first
      if @permission.nil?
        flash[:alert] = 'Você não tem permissão para executar esta ação!'
        redirect_to :back
      end
    end
  end
end
