def deal (number)
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]




  if block_given?
    1.upto number do
      random_face = faces.sample
      random_suit = suits.sample
      score = yield random_face, random_suit
      puts "You scored a #{score}!"
    end
  else
    puts "No deal!"
  end


end

deal(5) { |face, suit| face.size + suit.size }#puts "Dealt a #{face} of #{suit}"}

def progress
  0.step(100,10) do |percent|
    yield (percent)
  end
end

progress { |percent| puts percent }

def greet
  yield
