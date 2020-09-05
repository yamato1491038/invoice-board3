class AddKindToContract < ActiveRecord::Migration[6.0]
  def change
    add_column :contracts, :kind, :integer, null:false
    add_column :contracts, :active, :boolean, default: false
  end
end
