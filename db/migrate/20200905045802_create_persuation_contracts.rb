class CreatePersuationContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :persuation_contracts do |t|
      t.references :persuation, foreign_key:true
      t.references :contract, foreign_key:true
      t.timestamps
    end
  end
end
