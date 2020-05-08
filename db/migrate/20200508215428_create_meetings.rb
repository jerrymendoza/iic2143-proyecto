class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :local
      t.integer :like
      t.date :fecha
      t.time :hora

      t.timestamps
    end
  end
end
