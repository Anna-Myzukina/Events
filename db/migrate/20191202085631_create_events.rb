class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :location
      t.date :date

      t.timestamps
    end
    add_index :events, :creator_id
  end
end
