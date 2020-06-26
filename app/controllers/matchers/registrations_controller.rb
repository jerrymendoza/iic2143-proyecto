# frozen_string_literal: true

class Matchers::RegistrationsController < Devise::RegistrationsController
  #include Accessible
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :set_categories, only: [:edit, :update]
  before_action :set_comunas, only: [:edit, :update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      redirect_to new_matcher_registration_path, notice: error_al_registrar(resource)
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    resource.gustos_ids = if not params[:gustos_ids].nil? then params[:gustos_ids] else [] end
    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # DELETE /resources
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  def error_al_registrar resource
    mensaje = []
    if resource.email.blank? 
      mensaje << 'El email no puede estar vacío'
    elsif Matcher.exists?(email: resource.email)
      mensaje << 'Este email ya esta registrado'
    end
    if params[:matcher][:password].blank?
      mensaje << 'La contraseña no puede estar vacía'
    elsif params[:matcher][:password].length < 6
      mensaje << 'La contraseña no es válida'
    elsif params[:matcher][:password_confirmation] != params[:matcher][:password]
      mensaje << 'Las contraseñas no coiciden'
    end
    mensaje.join()
  end

  def set_categories
    @categories = Category.all
  end

  def set_comunas
    @comunas = Comuna.all
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :telefono, :imagen, :edad, :descripcion, :comuna_id, :rut, :genero])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :telefono, :imagen, :edad, :descripcion, :comuna_id, :rut, :genero])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    matcher_steps_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
