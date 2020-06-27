class ApplicationController < ActionController::Base
  private

  def after_sign_out_path_for(resource_or_scope)
      root_path
  end

  def authenticate_admin_propietario_local!
    unless admin_signed_in? || propietario_local_signed_in?
      redirect_to root_path, notice: 'No tienes permisos para realizar esta acción'
    end
  end

  def authenticate_todos!
    unless admin_signed_in? || propietario_local_signed_in? || matcher_signed_in?
      redirect_to root_path, notice: 'No tienes permisos para realizar esta acción'
    end
  end

  def authenticate_admin_matcher!
    unless admin_signed_in? || matcher_signed_in?
      redirect_to root_path, notice: 'No tienes permisos para realizar esta acción'
    end
  end

  def matcher_sadas
  end

  def propietario_loca
  end
end
