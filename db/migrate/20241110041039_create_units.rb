class CreateUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :units do |t|
      t.timestamps
      t.column :name, :string
      t.column :name_text, :string
    end
  end
end
