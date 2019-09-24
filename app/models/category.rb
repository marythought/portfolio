class Category < ApplicationRecord
  has_and_belongs_to_many :commonplaces
  validates_uniqueness_of :name, case_sensitive: false
end
