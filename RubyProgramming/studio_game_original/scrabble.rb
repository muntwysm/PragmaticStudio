letters_score = {'c' => 3, 'e' => 1, 'l'=>1,'n'=>1,'t'=>1,'x'=>8,'y'=>4}



letters_hash = Hash.new(0)

'excellently'.each_char do |letter|
  puts letters_hash[letter] += letters_score[letter]
end

puts letters_hash.values.reduce(0,:+)
