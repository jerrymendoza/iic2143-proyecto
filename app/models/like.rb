class Like < ApplicationRecord
  belongs_to :matcher1, class_name: 'Matcher'
  belongs_to :matcher2, class_name: 'Matcher'
  before_destroy :eliminar_match

  def eliminar_match
    match_de_like = Match.where(matcher1: [matcher1, matcher2]).or(Match.where(matcher2: [matcher2, matcher1]))
    match_de_like.destroy_all
  end
end
