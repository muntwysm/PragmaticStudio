
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

frequent_flyers = flyers.select {|flyer| flyer.miles_flown >= 3000}
puts frequent_flyers

flyers_incentives = flyers.select { |flyer| flyer.miles_flown < 3000 }
puts flyers_incentives

platinum_flyers = flyers.select {|flyer| flyer.status == :platinum}
puts platinum_flyers

first_bronze_flyer = flyers.detect {|flyer| flyer.status == :bronze}
puts first_bronze_flyer

platinum_people,other_people = flyers.partition {|flyer| flyer.status == :platinum}
puts "-- platinum"
puts platinum_people

puts "-- other people"
puts other_people


flyers_name_and_status = flyers.map {|flyer| "#{flyer.name} (#{flyer.status.upcase})" }
puts flyers_name_and_status

flyers_name_kilomters = flyers.map {|flyer| "#{flyer.name} #{flyer.miles_flown * 1.6} km flown"}
p flyers_name_kilomters

total_kilometers_flown = flyers.map {|flyer| flyer.miles_flown}.reduce(0,:+)
puts "Total Kilometers Flown: #{total_kilometers_flown}"

total_kilometers_flown_by_bronze_flyers = flyers.reduce(0) {|sum,flyer| sum + (flyer.miles_flown * 1.6)}
total_kilometers_flown_by_bronze_flyers_2 = flyers.map{|flyer| flyer.miles_flown}.reduce(0) {|sum,miles_flown| sum + (miles_flown * 1.6)}

puts total_kilometers_flown_by_bronze_flyers
puts total_kilometers_flown_by_bronze_flyers_2

flyer_most_miles = flyers.max_by {|flyer| flyer.miles_flown}
puts flyer_most_miles
