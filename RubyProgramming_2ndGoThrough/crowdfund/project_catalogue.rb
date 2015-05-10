require_relative 'project'
require_relative 'die'
require_relative 'funding_round'
require_relative 'pledge_pool'

class ProjectCatalogue
  attr_reader :catalogue_name,:projects

  def initialize(catalogue_name)
    @catalogue_name = catalogue_name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def fully_funded(project)

  end

  def request_funding (rounds_of_funding)
    puts %Q$The number of projects is #{projects.size}!$

    pledges = PledgePool::PLEDGES

    puts "There are #{pledges.size} pledge amounts:\n"

    pledges.each do |pledge|
      puts "A #{pledge.name} pledge is worth $#{pledge.amount}."
    end


    1.upto(rounds_of_funding)do |round|
      puts "\nRound of Funding - #{round} :"
      @projects.each do |project|
        FundingRound.fund_round(project)
        puts project
      end
    end

    print_stats
  end


  def print_stats
    puts "#{catalogue_name} Statistics:\n"

    fully_funded_projects , under_funded_projects = @projects.partition { |project| project.fully_funded? }

    puts "\n#{fully_funded_projects.size} Fully Funded Projects:\n"

    fully_funded_projects.each do |project|
      print_project_and_funding(project)
    end

    puts "\n#{under_funded_projects.size} Under Funded Projects:\n"

    under_funded_projects.each do |project|
      print_project_and_funding(project)
    end


    puts "\nProjects still needing funding:\n"
    under_funded_projects.sort.each do |project|
      puts "#{project.name.ljust(20,'.')} #{project.shortfall_funding}"
    end

  end
  def print_project_and_funding(project)
    puts "#{project.name} (#{project.total_funding})"
  end

end
