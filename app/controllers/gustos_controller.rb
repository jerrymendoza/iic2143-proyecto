class GustosController < ApplicationController
  before_action :authenticate_admin!, only: %i[new edit create update destroy]
  before_action :set_categories, onle: %i[create new edit]

  def new
    @gusto = Gusto.new
  end

  def index
    @gusto = Gusto.all
  end

  def create
    gusto_params = params.require(:gusto).permit(:titulo, :descripcion, :category_id)
    @gusto = Gusto.create(gusto_params)

    if @gusto.save
      redirect_to gustos_new_path, notice: 'Gusto creado exitosamente'
    else
      redirect_to gustos_new_path, notice: 'Error creando gusto'
    end
  end

  def show
    @gusto = Gusto.find(params[:id])
  end

  def edit
    @gusto = Gusto.find(params[:id])
  end

  def update
    gusto_params = params.require(:gusto).permit(:titulo, :descripcion, :category_id)
    @gusto = Gusto.find(params[:id])
    if @gusto.update(gusto_params)
      redirect_to gustos_path(@gusto.id), notice: 'Gusto editado exitosamente'
    else
      redirect_to gustos_path(@gusto.id), notice: 'Error editando gusto'
    end
  end

  def destroy
    @gusto = Gusto.find(params[:id])
    @gusto.destroy
    redirect_to gustos_path, notice: 'Gusto eliminado con exito'
  end

  def set_categories
    @categories = Category.all
  end
end
