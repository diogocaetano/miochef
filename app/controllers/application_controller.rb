class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_modules_category
  before_action :get_module_active
  before_action :user_has_permission_to_action?, unless: :devise_controller?

  def get_modules_category
  	@categories = ModulesCategory.all
  end

  def get_module_active    
    @module_active = params[:controller]
  end

  def user_has_permission_to_action?
    if user_signed_in?
      if not current_user.is_dev        
        if not params[:controller] == 'dashboard' || params[:action] == 'update_password'
          @module = Entity.where(controller: params[:controller]).first
          @permission = Permission.where(entity_id: @module.id).where(action: params[:action]).first
          @permission_role = PermissionsRoles.where(permission_id: @permission.id).where(role_id: current_user.role_id)          
          if @permission_role.empty?
            render "errors/error_403", :layout => false
          end
        end
      end
    end
  end
end
