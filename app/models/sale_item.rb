class SaleItem < ActiveRecord::Base
  belongs_to :sellable, polymorphic: true
  belongs_to :cart
end
