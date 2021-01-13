class User < ApplicationRecord
  has_many :posts
  has_many :images, :as => :imageable

  validates :email, :username, :uniqueness => true
  validates :password, :length => { :minimum => 8 }
  validates :username, :email, :password, :presence => true

  scope :adults, -> { where('birthday <= ?', 18.years.ago) }

  def full_name
    "User name is: #{last_name} #{first_name}"
  end
end
