class CreateSettlements < ActiveRecord::Migration[6.0]
  def change
    create_table :settlements do |t|
      t.date :dating, null:false
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
