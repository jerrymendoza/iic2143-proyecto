class Matcher < ApplicationRecord
  #validates :nombre, :edad, :rut, :imagen, :telefono, :comuna, :descripcion, presence: true
  has_one_attached :imagen
  belongs_to :comuna, optional: true
  has_many :comentarios
  has_and_belongs_to_many :gustos
  has_many :matcher1_likes, class_name: 'Like', foreign_key: 'matcher1_id'
  has_many :matcher2_likes, class_name: 'Like', foreign_key: 'matcher2_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :guardar_gustos

  attr_writer :gustos_ids

  private

  def guardar_gustos
    @gustos_ids.each do |gusto_id|
      GustosMatchers.create(gusto_id: gusto_id, matcher_id: id)
    end
  end
end
