class Comentario < ApplicationRecord
    belongs_to :local
    belongs_to :matcher
end
