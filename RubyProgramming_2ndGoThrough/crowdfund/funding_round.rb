require_relative 'die'
require_relative 'project'

module FundingRound

  def self.fund_round(project)
    die = Die.new
    number_rolled = die.roll

    case number_rolled

    when 1..2
      project.remove_funds
    when 3..4
      puts 'project was skipped'
    else
      project.add_funds
    end

  end

end
