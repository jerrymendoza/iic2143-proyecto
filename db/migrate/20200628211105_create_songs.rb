class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :uri
      t.references :matcher, foreign_key: true

      t.timestamps
    end
  end
end
