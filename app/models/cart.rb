class Cart < ActiveRecord::Base
  has_many :sales
  has_many :sold_speakers, :through => :sales, :source => :sellable, :source_type => 'Speaker'
end
