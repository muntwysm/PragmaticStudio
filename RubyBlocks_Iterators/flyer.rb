class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

#flyers = []
1.upto 5 do |number|
  flyer = Flyer.new("Flyer #{number}","Flyer#{number}@example.com",number * 1000)
  flyers.push(flyer)
end

puts flyers

flyers.each { |flyer| puts "#{flyer.name} - #{flyer.miles_flown} miles" }


sum = 0
flyers.each {|flyer| sum += flyer.miles_flown}
puts "Total miles flown: #{sum}"


promotions ={United: 1.5,Delta: 2.0, Lufthansa: 2.5}

promotions.each {|airline,bonus| puts "Earn #{bonus}x miles by flying #{airline}"}

desserts = {:Chocolate => 1.00,:vanilla => 0.75, :cinnamon => 1.25}

desserts.each {|dessert,price| puts "$#{price * 2} for a cup of #{dessert}."}

flyers.each do |flyer|
  promotions.each {|airline,value|puts "#{flyer.name} could earn #{flyer.miles_flown * value} by flying #{airline}!"}
end
