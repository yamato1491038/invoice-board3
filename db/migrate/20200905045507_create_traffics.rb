class CreateTraffics < ActiveRecord::Migration[6.0]
  def change
    create_table :traffics do |t|
      t.date :dating, null:false
      t.integer :hno, null:false
      t.references :user, foreign_key:true
      t.string :field
      t.integer :distance
      t.integer :fee
      t.string :content
      t.timestamps
    end
  end
end
