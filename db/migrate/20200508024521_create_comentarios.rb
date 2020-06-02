class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.belongs_to  :matcher
      t.belongs_to :local
      t.integer :valoracion
      t.text :contenido
      t.datetime :created_at

      t.timestamps
    end
  end
end
