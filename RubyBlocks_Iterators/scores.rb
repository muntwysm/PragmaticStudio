scores = [83, 71, 92, 64, 98, 87, 75, 69]

scores_over_80 = scores.select {|score| score >= 80}
p scores_over_80

scores_under_80 = scores.reject {|score| score >= 80}
p scores_under_80

scores_under_70 = scores.select{|score| score < 70}
p scores_under_70

puts scores.detect {|score| score < 70}

#scores.select! {|score| score >= 70 }
#p scores

#scores.reject! {|score| score.even? }
#p scores

scores_doubled = scores.map {|score| score * 2}
p scores_doubled

sum = scores.reduce {|total,score| total + score}
p sum

sum1 = scores.reduce(0, :+)
p sum1

sum2 = scores.reduce(0) {|sum,total| sum + total}
p sum2

evens,odds = scores.partition {|score| score.even? }
p evens
p odds
