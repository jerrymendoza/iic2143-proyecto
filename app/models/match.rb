class Match < ApplicationRecord
  has_one :meeting
  belongs_to :matcher1, class_name: 'Matcher'
  belongs_to :matcher2, class_name: 'Matcher'
end
