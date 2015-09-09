class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :technologies_used, presence: true
end
