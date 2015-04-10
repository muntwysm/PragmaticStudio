Snack = Struct.new(:name,:carbs)

module SnackBar

  SNACKS = [
    Snack.new(:popcorn,20),
    Snack.new(:candy,15),
    Snack.new(:nachos,40),
    Snack.new(:pretzel,10),
    Snack.new(:soda,5)
  ]

  def self.random
    SNACKS.sample
  end


end

#puts Snackbar::SNACKS
#snack = Snackbar.random

#puts "enjoy your #{snack.name} #{snack.carbs} carbs "
