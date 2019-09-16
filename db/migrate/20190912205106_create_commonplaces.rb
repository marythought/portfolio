class CreateCommonplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :commonplaces do |t|
      t.string :source
      t.string :notes
      t.text :quote
      t.string :url
      t.datetime :published_at

      t.timestamps
    end
  end
end
