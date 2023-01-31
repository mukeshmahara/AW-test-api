class AddLocationColumnInProjectTable < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :location, :string
  end
end
