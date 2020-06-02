class CreateLocals < ActiveRecord::Migration[5.2]
  def change
    create_table :locals do |t|
      t.string :nombre
      t.belongs_to  :propietario_local
      t.text :descripcion
      t.boolean :aceptado
      t.belongs_to  :comuna
      t.string :direccion
      t.timestamps
    end
  end
end
