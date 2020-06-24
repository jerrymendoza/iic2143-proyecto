class LocalsController < ApplicationController
  before_action :set_local, only: %i[show edit update destroy enviar_aceptar_local]
  before_action :authenticate_admin_propietario_local!, only: %i[edit update destroy]
  before_action :authenticate_propietario_local!, only: %i[new create index_locals_de_propietario_local]
  before_action :set_comunas, only: %i[new create edit]
  before_action :authenticate_admin!, only: %i[index_no_aceptados enviar_aceptar_local]


  # GET /locals
  # GET /locals.json
  def index
    @locals = Local.where(aceptado: true)
  end

  def index_no_aceptados
    @locals_no_aceptados = Local.where(aceptado: false)
  end

  def index_locals_de_propietario_local
    @locals_de_propietario_local = Local.where(propietario_local: current_propietario_local)
  end

  # GET /locals/1
  # GET /locals/1.json
  def show
    @comentario = Comentario.new
  end

  # GET /locals/new
  def new
    @local = Local.new
  end

  # GET /locals/1/edit
  def edit
    @locals = Local.all
  end

  # POST /locals
  # POST /locals.json
  def create
    @local = current_propietario_local.locals.new(local_params)
    respond_to do |format|
      if @local.save
        format.html { redirect_to locals_mis_locales_path, notice: 'Tu local fue creado con éxito.' }
        format.json { render :show, status: :created, location: @local }
      else
        format.html { render :new }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locals/1
  # PATCH/PUT /locals/1.json
  def update
    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to @local, notice: 'Tu local fue editado.' }
        format.json { render :show, status: :ok, location: @local }
      else
        format.html { render :edit }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locals/1
  # DELETE /locals/1.json
  def destroy
    @local.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Se ha eliminado tu Local.' }
      format.json { head :no_content }
    end
  end

  def enviar_aceptar_local #indica al model aceptar el local
    @local.aceptar_local
    respond_to do |format|
      format.html { redirect_to locals_solicitudes_path, notice: 'Se ha aceptado el local.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_local
    @local = Local.find(params[:id])
  end

  def set_comunas
    @comunas = Comuna.all
  end

  # Only allow a list of trusted parameters through.
  def local_params
    params.require(:local).permit(:nombre, :comuna_id, :direccion, :descripcion, :imagen)
  end
end
