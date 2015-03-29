class Event < ActiveRecord::Base
  
  validates :name, :description,:location, presence: true
  validates :description, length: {minimum: 25}
  validates :price , numericality: {greater_than_or_equal_to: 0}
  validates :capacity, numericality: {only_integer: true, greater_than: 0}
  validates :image_file_name,allow_blank: true, format:{
  	with: /\w+\.(gif|jpg|png)\z/i,
  	message: "must be an image file"
  }

  def self.upcoming
    where('starts_at >= ?', Time.now).order(:starts_at)
  end
  
  def self.inexpensive
    where('price <= 15').order('price DESC')
  end
    
  def free?
    price.blank? || price.zero?
  end  

end
