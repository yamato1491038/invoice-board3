class CreateCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :costs do |t|
      t.date :dating, null:false
      t.integer :hno, null:false
      t.references :user, foreign_key:true
      t.integer :parking
      t.integer :fee
      t.string :content
      t.timestamps
    end
  end
end
