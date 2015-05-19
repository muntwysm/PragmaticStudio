require_relative 'grant_project'
require_relative 'matching_funds_project'
require_relative 'project_catalogue'





project_Catalogue_Chris = ProjectCatalogue.new ('chris projects')

project_chris_house = Project.new('Christopher House', 0, 500)
project_PC_Upgrades = Project.new('PCUpgrades',500,1000)
project_Office_Additions = Project.new('office additions',500,2000)
project_bathroom = GrantProject.new('Chris Bathroom', 500,4000)
project_funds = MatchingFundsProject.new('Chris House', 500,4000)



project_Catalogue_Chris.add_project(project_chris_house)
project_Catalogue_Chris.add_project(project_PC_Upgrades)
project_Catalogue_Chris.add_project(project_Office_Additions)
project_Catalogue_Chris.add_project(project_bathroom)
project_Catalogue_Chris.add_project(project_funds)
#project_Catalogue_Chris.load_projects('projects.csv')
##project_Catalogue_Chris.request_funding(3)

loop do
  puts 'Enter the number of rounds to play. "quit" to exit'
  number_of_rounds = gets.chomp

  case number_of_rounds

  when /^\d+$/
    project_Catalogue_Chris.request_funding(number_of_rounds.to_i)
  when 'quit','exit'
    project_Catalogue_Chris.print_stats
    break
  else
    'Please enter a number?'
  end
end
