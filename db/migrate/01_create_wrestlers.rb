class CreateWrestlers < ActiveRecord::Migration[5.2]
  def change
    create_table :wrestlers do |t|
    t.string :name
    end
  end
end