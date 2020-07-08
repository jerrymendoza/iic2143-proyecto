class MatcherStepsController < ApplicationController
  include Wicked::Wizard
  steps :adicional
  before_action :set_categories
  before_action :set_comunas
  before_action :set_matcher

  def show
    if request.referrer != new_matcher_registration_url
      redirect_to root_path
    else
      render_wizard
    end
  end

  def update
    @matcher.update_attributes(user_params)
    @matcher.gustos_ids = !params[:gustos_ids].nil? ? params[:gustos_ids] : []
    sign_in(@matcher, bypass: true)
    render_wizard @matcher
  end

  private

  def user_params
    params.require(:matcher).permit(:nombre, :telefono, :imagen, :edad, :descripcion, :comuna_id, :rut)
  end

  def set_categories
    @categories = Category.all
  end

  def set_comunas
    @comunas = Comuna.all
  end

  def set_matcher
    @matcher = current_matcher
  end

  def finish_wizard_path
    root_url
  end
end
