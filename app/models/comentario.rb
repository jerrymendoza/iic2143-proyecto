class Comentario < ApplicationRecord
  belongs_to :local
  belongs_to :matcher

  validates :valoracion, numericality: { greater_than: 0, less_than: 6 }
end
