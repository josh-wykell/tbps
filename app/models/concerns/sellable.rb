module Sellable
  extend ActiveSupport::Concern

  included do 
    has_many :sales, :as => :Sellable
  end

end