class Category < ApplicationRecord
  has_many :gustos
  before_destroy :eliminar_relaciones

  def eliminar_relaciones
    gustos.destroy_all
  end
end
