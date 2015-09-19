class AddArticleIDtoComments < ActiveRecord::Migration
  def change
    add_reference :comments, :article, index: true, foreign_key: true
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end
end
