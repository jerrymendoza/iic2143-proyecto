class CreateGustosMatchers < ActiveRecord::Migration[5.2]
  def change
    create_table :gustos_matchers do |t|
      t.references :gusto, foreign_key: true
      t.references :matcher, foreign_key: true

      t.timestamps
    end
  end
end
