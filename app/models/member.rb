class Member < ActiveRecord::Base
  belongs_to :membership_types
  has_many :memberships
  accepts_nested_attributes_for :memberships
end
