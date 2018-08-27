class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  scope :published, -> { where("published_at IS NOT NULL").where("published_at <= ?", Time.now) }
  scope :draft, -> { where("published_at IS NULL OR published_at > ?", Time.now) }

  def should_generate_new_friendly_id?
    slug_changed? || super
  end

  def published?
    Post.all.published.exists? self.id
  end
end
