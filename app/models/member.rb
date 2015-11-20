class Member < ActiveRecord::Base
  has_many :memberships
  accepts_nested_attributes_for :memberships

  validates :member_last_name,      presence: true
  validates :member_first_name,     presence: true
  validates :office_address_street, presence: true
  validates :office_address_city,   presence: true
  validates :office_address_state,  presence: true
  validates :office_address_zip,    presence: true
  validates :email,                 presence: true
  validates :office_phone,          presence: true
  validates :liscense,              presence: true
  validates :membership_type,       presence: true
end
