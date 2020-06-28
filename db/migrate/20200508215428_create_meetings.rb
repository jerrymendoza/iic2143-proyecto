class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.belongs_to :local
      t.belongs_to :match, dependent: :destroy
      t.date :fecha
      t.time :hora

      t.timestamps
    end
  end
end
