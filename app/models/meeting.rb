class Meeting < ApplicationRecord
  belongs_to :local
  belongs_to :match

  def aceptar_por_matcher current_matcher
    if current_matcher == self.match.matcher1
      self.update_attributes(:aceptado_1 => true)
    else
      self.update_attributes(:aceptado_2 => true)
    end
  end
end
