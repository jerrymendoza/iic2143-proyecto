class Like < ApplicationRecord
  belongs_to :matcher1, class_name: 'Matcher'
  belongs_to :matcher2, class_name: 'Matcher'
  has_one :meeting
end
