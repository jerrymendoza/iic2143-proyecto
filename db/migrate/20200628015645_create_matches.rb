class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :matcher1, foreign_key: { to_table: 'matchers' }, dependent: :destroy
      t.references :matcher2, foreign_key: { to_table: 'matchers' }, dependent: :destroy
      t.timestamps
    end
  end
end
