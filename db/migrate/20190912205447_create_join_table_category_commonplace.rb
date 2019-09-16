class CreateJoinTableCategoryCommonplace < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :commonplaces do |t|
      # t.index [:category_id, :commonplace_id]
      # t.index [:commonplace_id, :category_id]
    end
  end
end
