class Ad
  include Mongoid::Document
  include Sunspot::Mongo

  field :title, :type => String
  field :description, :type => String
  field :metro_station, :type => String
  field :rooms, :type => Integer


  searchable do
    text :description
    text :metro_station
  end

  validates :title, :presence => true, :length => { :minimum => 5, :allow_blank => false}
  validates :description, :presence => true, :length => { :minimum => 10, :allow_blank => false}
  validates :metro_station, :presence => true, :length => { :minimum => 3, :allow_blank => false}
  validates :rooms, :presence => true

  mount_uploader :image, ImageUploader


end
