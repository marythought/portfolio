class Commonplace < ApplicationRecord
  has_and_belongs_to_many :categories
  validates_presence_of :quote

  scope :unpublished, -> { where(published_at: nil) }
  scope :published, -> { where('published_at IS NOT NULL') }

  def category_names
    categories.map(&:name)
  end
end
