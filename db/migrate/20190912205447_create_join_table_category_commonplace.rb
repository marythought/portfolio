class CreateJoinTableCategoryCommonplace < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :commonplaces do |t|
      t.index [:category_id, :commonplace_id], unique: true
    end
  end
end
