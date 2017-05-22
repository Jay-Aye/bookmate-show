class AddAttachmentPdfToAudiobooks < ActiveRecord::Migration[5.1]
  def self.up
    change_table :audiobooks do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :audiobooks, :pdf
  end
end
