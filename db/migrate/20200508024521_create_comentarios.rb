class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.string :matcher
      t.string :local
      t.integer :valoracion
      t.text :contenido
      t.datetime :created_at

      t.timestamps
    end
  end
end
