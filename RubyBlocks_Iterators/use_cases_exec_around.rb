require 'benchmark'

def generate_tag tag_name
  result = yield
  "<#{tag_name}>#{result}</#{tag_name}>"
end

puts generate_tag(:h1) {"Breaking News!"}
puts generate_tag(:h2) { "Massive Ruby Discovered!" }

generate_tag(:ul) do
  generate_tag(:li) { "It sparkles!"}
  generate_tag(:li) { "It shines!"}
  generate_tag(:li) { "It mesmerizes!"}
end


def with_debugging()
  puts 'Started Debugging!'
  result = yield
  puts "Result was #{result}!"

end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end

def with_expectation(expected_value)
  puts 'Running Test...'
  result = (yield == expected_value) ? "Passed." : "Failed! \nExpected #{expected_value} but got #{yield}"
  puts "#{result}"
end

with_expectation(5) { 2 + 2 }

def time_it(whats_being_timed)
  puts "#{whats_being_timed}"
  time = Benchmark.realtime do
    yield
  end
  puts "It took #{time} for #{whats_being_timed} to run!"
end

time_it("Sleepy code") do
  # run some code
  sleep(1)
end
