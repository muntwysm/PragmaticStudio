require_relative 'project'

class MatchingFundsProject < Project


  def add_funds (funds_added = 25)
    super(funds_added)

    if half_of_target_met?
      super (target_funding - funding)
      puts "#{name} has reached half its target. So matching funds will be contributed!"
    end
  end


  def half_of_target_met?
    funding / target_funding >= 0.5
  end

end
