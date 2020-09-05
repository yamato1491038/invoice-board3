class CreateRegularContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :regular_contracts do |t|
      t.references :regular, foreign_key:true
      t.references :contract, foreign_key:true
      t.timestamps
    end
  end
end
