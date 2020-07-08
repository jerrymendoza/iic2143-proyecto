class PropietarioLocal < ApplicationRecord
  has_many :locals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_destroy :eliminar_relaciones

  def eliminar_relaciones
    locals.destroy_all
  end
end
