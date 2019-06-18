class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :wrestler_one_id
      t.integer :wrestler_two_id
      t.integer :show_id
    end
  end
end