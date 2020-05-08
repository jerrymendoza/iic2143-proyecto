class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :matcher_1
      t.string :matcher_2
      t.boolean :match

      t.timestamps
    end
  end
end
