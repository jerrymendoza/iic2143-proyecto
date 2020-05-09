class CreateLocals < ActiveRecord::Migration[5.2]
  def change
    create_table :locals do |t|
      t.string :nombre
      t.string :dueno
      t.string :comuna
      t.text :descripcion
      t.boolean :aceptado

      t.timestamps
    end
  end
end
