class Ad
  include Mongoid::Document
  field :title, :type => String
  field :text, :type => String
  validates :title, :presence => true, :length => { :minimum => 5, :allow_blank => false}
  validates :text, :presence => true, :length => { :minimum => 1, :allow_blank => false}
end
