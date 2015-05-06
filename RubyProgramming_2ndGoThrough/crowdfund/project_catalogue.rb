require_relative 'project'
require_relative 'die'
require_relative 'funding_round'

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

  def request_funding

    puts %Q$The number of projects is #{projects.size}!$

    @projects.each do |project|

      FundingRound.fund_round(project)
      puts project

    end
  end


end
