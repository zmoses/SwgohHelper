class AddTypeToUnit < ActiveRecord::Migration[8.0]
  def change
    add_column :units, :type, :string
  end
end
