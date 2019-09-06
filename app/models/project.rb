class Project < ActiveRecord::Base
  has_one_attached :image
  validates :name, presence: true
end
