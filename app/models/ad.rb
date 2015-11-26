class Ad
  include Mongoid::Document
  include Sunspot::Mongo #for searching

  #fields of Mongo document
  field :title, :type => String
  field :description, :type => String
  field :metro_station, :type => String
  field :rooms, :type => Integer


  searchable do #making listed fields searchable for sunspot
    text :description
    text :metro_station
  end

  #validation of fields: we want all of the fields to be filled and title, description and metro_station must have certain length
  #otherwise creating will fail and user will get some error messages

  validates :title, :presence => true, :length => { :minimum => 5, :allow_blank => false}
  validates :description, :presence => true, :length => { :minimum => 10, :allow_blank => false}
  validates :metro_station, :presence => true, :length => { :minimum => 3, :allow_blank => false}
  validates :rooms, :presence => true

  mount_uploader :image, ImageUploader #uploader for carrierwave

end
