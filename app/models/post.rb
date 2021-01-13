class Post < ApplicationRecord
  has_many :images, :as => :imageable
  belongs_to :user
  scope :published, -> { where.not(published_at: nil) }
end
