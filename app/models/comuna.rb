class Comuna < ApplicationRecord
  has_many :locals
  has_many :matchers
end
