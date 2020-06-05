class Local < ApplicationRecord
  has_one_attached :imagen
  belongs_to :comuna
  belongs_to :propietario_local
  has_many :comentarios
  has_many :meetings

end
