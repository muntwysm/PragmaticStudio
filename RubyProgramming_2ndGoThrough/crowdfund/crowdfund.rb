class Project

  attr_reader :funding,:target_funding
  attr_accessor :name


  def initialize(name, funding = 0, target_funding = 1000.00)
    @name = name.upcase
    @funding = funding
    @target_funding = target_funding
  end

  def total_funding_still_needed
    target_funding - funding
  end

  def to_s
    "Project #{@name} has a funding of $#{@funding} and a target of $#{target_funding}."
  end

  def add_funds(funds_added = 100)
    @funding += funds_added
    puts "Project #{@name} has added some funds!"
    ###{funds_added }in funding towards a goal of $#{@funding}"
  end

  def remove_funds(funds_removed = 100)
    @funding -= funds_removed
    puts "Project #{@name} has lost some funds!"
  end
end


project_PC_Upgrades = Project.new('PCUpgrades',500,65000)
project_Office_Additions = Project.new('office additions',500,40000)
puts project_Office_Additions
puts project_PC_Upgrades
project_PC_Upgrades.remove_funds(100)
project_Office_Additions.add_funds(15)
puts project_PC_Upgrades
puts project_Office_Additions



project_chris_house = Project.new('Christopher House', 0, 2_000_000)
puts project_chris_house.name
puts project_chris_house.total_funding_still_needed
puts project_chris_house.target_funding
project_chris_house.name = 'Christopher\' House at Bottom Of Place'
puts project_chris_house.name


projects = [project_chris_house,project_Office_Additions,project_PC_Upgrades]

puts %Q$The number of projects is #{projects.size}!$

projects.each do |project| puts project end

projects.each do |project|
  project.add_funds
  project.remove_funds
  project.add_funds
  puts project
end

project_del = projects.delete_at(1)

p project_del

p projects
