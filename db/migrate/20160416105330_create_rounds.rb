class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :deck, index: true
      t.belongs_to :user, index: true
      t.integer :correct, default: 0
      t.integer :total

      t.timestamps null: false
    end
  end
end
