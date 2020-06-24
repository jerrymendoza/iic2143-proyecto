class MatcherStepsController < ApplicationController
	include Wicked::Wizard
	steps :adicional
	before_action :set_gustos
  before_action :set_comunas
  before_action :set_matcher

	def show
		render_wizard
	end

	def update
		@matcher.update_attributes({:nombre => params[:matcher][:nombre], :telefono => params[:matcher][:telefono], :imagen => params[:matcher][:imagen], :edad =>params[:matcher][:edad], :descripcion => params[:matcher][:descripcion], :comuna_id =>params[:matcher][:comuna_id], :rut => params[:matcher][:rut]})
		@matcher.gustos_ids = if not params[:gustos_ids].nil? then params[:gustos_ids] else [] end
		render_wizard @matcher
	end

private

	def set_gustos
    @gustos = Gusto.all
  end

 	def set_comunas
   	@comunas = Comuna.all
  end

  def set_matcher
  	@matcher = current_matcher
  end

  def redirect_to_finish_wizard var_1, var_2 #variables que llegan a la fúncion pero no tienen utilidad
  	redirect_to root_url, notice: "Tu cuenta ha sido creada con éxito"
  end
end