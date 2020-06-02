class Matcher < ApplicationRecord
  belongs_to :comuna, optional: true
  has_many :comentarios
  has_and_belongs_to_many :gustos
  has_many :matcher1_likes, class_name: "Like", foreign_key: "matcher1_id"
  has_many :matcher2_likes, class_name: "Like", foreign_key: "matcher2_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
