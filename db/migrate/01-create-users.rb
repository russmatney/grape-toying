class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.column :name, :string
      table.column :email, :string

      table.timestamps
    end
  end
end

