
module UsersHelper

	def put_edit_all_users_password_action user
		if current_user.role.permissions.each.collect {|p| p.action_name}.include? 'Editar Todas as Senhas'
        	link_to raw("<i class='fa fa-cog'></i>"), '#modal-change-password-action-' + user.id.to_s, :class => 'btn btn-info tooltips', :'data-toggle' => 'modal', 'data-placement': 'top', title: 'Alterar Senha' 
        end
	end
end
