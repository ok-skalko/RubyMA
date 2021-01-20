class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships, dependent: :destroy
  has_many :images, as: :imageable

  enum status: [:active, :archived, :removed, :permanently_removed], _default: 'active'

  validates :name, uniqueness: true
  validates :name, :group_type, :status, presence: true
end
