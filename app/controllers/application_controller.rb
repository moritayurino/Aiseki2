class ApplicationController < ActionController::Base


  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  private

  #def configure_authentication
  #  if admin_controller?
  #  else
  #    authenticate_user! unless action_is_public?
  #  end
  #end

  #def admin_controller?
  #  self.class.module_parent_name == 'Admin'
  #end

  #def action_is_public?
  #  controller_name == 'homes' && action_name == 'top'
  #end
end
