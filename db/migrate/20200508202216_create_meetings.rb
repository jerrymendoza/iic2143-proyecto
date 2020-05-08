class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :matcher_1
      t.string :matcher_2
      t.string :local
      t.time :fecha
      t.date :hora
      t.boolean :match

      t.timestamps
    end
  end
end
