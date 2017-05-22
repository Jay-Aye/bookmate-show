class AddAudiobookIdToPage < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :audiobook_id, :reference
  end
end
