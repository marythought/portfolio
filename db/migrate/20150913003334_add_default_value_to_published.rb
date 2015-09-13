class AddDefaultValueToPublished < ActiveRecord::Migration
  def up
    change_column :blogs, :published, :boolean, :default => false
  end

  def down
    change_column :blogs, :published, :boolean, :default => nil
  end
end
