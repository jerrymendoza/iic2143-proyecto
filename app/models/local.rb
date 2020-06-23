class Local < ApplicationRecord
  has_one_attached :imagen
  belongs_to :comuna
  belongs_to :propietario_local
  has_many :comentarios
  has_many :meetings
  before_destroy :eliminar_relaciones

  def eliminar_relaciones
  	self.comentarios.destroy_all
  	#self.meetings.destroy_all
  end
end
