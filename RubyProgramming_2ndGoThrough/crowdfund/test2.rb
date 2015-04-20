project1_name = "N.A.S PC"
project1_funding = 100000
project2_name = "Main PC Upgrades"
project2_funding = 1000.00
project3_name = "Bathroom Fix Up!"
project3_funding = 1000.00

puts "#{project1_name} has a $#{project1_funding} in funding."

puts "Projects:\n\t#{project1_name}\n\t#{project2_name}\n\t#{project3_name}"

puts "now is #{ def the(a)
    'the ' + a
    end
    the( 'time' )
} for all bad coders..."


puts "#{project1_name.ljust(30,'.')} $#{project1_funding.to_s}"

puts "#{project2_name.ljust(30,'.')} $#{project2_funding.to_s}"

puts "#{project3_name.ljust(30,'.')} $#{project3_funding.to_s}"

def project_status(project_name, project_funding = 0)
  puts "#{project_name.capitalize} has a funding of $#{project_funding}."
end

project_status(project1_name,project1_funding)

project_status(project2_name,project2_funding)

project_status(project3_name,project3_funding)
