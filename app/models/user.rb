class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :images, as: :imageable
  has_many :memberships
  has_many :groups, through: :memberships

  validates :email, :personal_data, uniqueness: true
  validates :password, :length => { :minimum => 8 }
  validates :personal_data, :email, :password, presence: true

  scope :adults, -> { where('birthday <= ?', 18.years.ago) }

  def full_name
    "User name is: #{last_name} #{first_name}"
  end
end
