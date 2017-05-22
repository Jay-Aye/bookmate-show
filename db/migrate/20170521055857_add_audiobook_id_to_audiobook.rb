class AddAudiobookIdToAudiobook < ActiveRecord::Migration[5.1]
  def change
    add_column :audiobooks, :audiobook_id, :reference
  end
end
