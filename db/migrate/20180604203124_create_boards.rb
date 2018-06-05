class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :priority
      t.string :color

      t.timestamps
    end
  end
end
