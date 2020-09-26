class AddSettlerToSettlements < ActiveRecord::Migration[6.0]
  def change
    add_column :settlements, :settler, :integer, null:false
  end
end
