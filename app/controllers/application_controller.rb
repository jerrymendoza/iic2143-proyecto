class ApplicationController < ActionController::Base
  private

  def after_sign_out_path_for(resource_or_scope)
      root_path
  end

  def authenticate_admin_propietario_local!
    unless admin_signed_in? || propietario_local_signed_in?
      redirect_to request.referrer, notice: 'No tienes permisos para realizar esta acción'
    end
  end

  def authenticate_todos!
    unless admin_signed_in? || propietario_local_signed_in? || matcher_signed_in?
      redirect_to request.referrer, notice: 'No tienes permisos para realizar esta acción'
    end
  end

  def authenticate_admin_matcher!
    unless admin_signed_in? || matcher_signed_in?
      redirect_to request.referrer, notice: 'No tienes permisos para realizar esta acción'
    end
  end

  def verificar_matcher objeto
    unless current_matcher == objeto.matcher || admin_signed_in?
      redirect_to request.referrer, notice: 'No tienes permisos para realizar esta acción'
    end
  end
end
