class CreateAudiobooks < ActiveRecord::Migration[5.1]
  def change
    create_table :audiobooks do |t|
      t.string :title
      t.string :author
      t.string :pdf

      t.timestamps
    end
  end
end
