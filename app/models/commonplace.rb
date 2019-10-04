class Commonplace < ApplicationRecord
  has_and_belongs_to_many :categories
  validates_presence_of :quote

  scope :unpublished, -> { where(published_at: nil) }
  scope :published, -> { where('published_at IS NOT NULL') }

  def category_names
    categories.map(&:name).join(';')
  end

  def add_category(name)
    return nil unless name.present?

    cat = Category.where('lower(name) = ?', name.downcase).first_or_create!(name: name)
    categories << cat unless categories.include?(cat)
    cat
  end
end
