class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group
  enum status: [ :active, :unactive, :banned], _default: 'unactive'
end
