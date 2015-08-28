class SaleItem < ActiveRecord::Base
  belongs_to :sellable, polymorphic: true
  belongs_to :cart

  validates :cart_id, presence: true
end
