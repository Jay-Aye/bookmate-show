class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.integer :page_no
      t.text :text

      t.timestamps
    end
  end
end
