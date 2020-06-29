class AddTokenToMatchers < ActiveRecord::Migration[5.2]
  def change
    add_column :matchers, :access_token, :string
    add_column :matchers, :refresh_token, :string
  end
end
