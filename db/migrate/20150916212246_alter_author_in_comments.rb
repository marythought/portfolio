class AlterAuthorInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :author, :user
  end
end
