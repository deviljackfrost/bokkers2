class CreateTableUser < ActiveRecord::Migration[6.1]
  def change
    create_table :table_users do |t|
      t.string :name
      t.string :introduction
     
    end
  end
end
