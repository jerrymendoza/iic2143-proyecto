class ApplicationController < ActionController::Base
  private

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :matcher
      new_matcher_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :propietario_local
      new_propietario_local_session_path
    else
      root_path
    end
  end

  def authenticate_admin_propietario_local!
    redirect_to root_path, notice: 'No tienes permisos para realizar esta acción'  unless admin_signed_in? || propietario_local_signed_in?
  end

  def authenticate_todos!
    redirect_to root_path, notice: 'No tienes permisos para realizar esta acción' unless admin_signed_in? || propietario_local_signed_in? || matcher_signed_in?
  end

  def authenticate_admin_matcher!
    redirect_to root_path, notice: 'No tienes permisos para realizar esta acción' unless admin_signed_in? || matcher_signed_in?
  end

    
      
end
