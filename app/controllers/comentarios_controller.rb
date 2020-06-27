class ComentariosController < ApplicationController
  before_action :set_comentario, only: %i[edit show update destroy]
  before_action :set_local
  before_action :authenticate_matcher!

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = current_matcher.comentarios.new(comentario_params)
    @comentario.local = @local

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @local, notice: 'Comentario creado.' }
        format.json { render :show, status: :created, location: @local }
      else
        format.html { render :new }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to @local, notice: 'Comentario fue editado.' }
        format.json { render :show, status: :ok, location: @local }
      else
        format.html { render :edit }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario.destroy
    respond_to do |format|
      format.html { redirect_to @local, notice: 'Tu comentario fue desrtuido.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comentario
    @comentario = Comentario.find(params[:id])
  end

  def set_local
    @local = Local.find(params[:local_id])
  end

  # Only allow a list of trusted parameters through.
  def comentario_params
    params.require(:comentario).permit(:valoracion, :contenido)
  end
end
