class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.string :name, null:false, unique: true
      t.integer :money, null:false
      t.timestamps
    end
  end
end
