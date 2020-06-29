class Gusto < ApplicationRecord
  has_and_belongs_to_many :matchers
  belongs_to :category
end
