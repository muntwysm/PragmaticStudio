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

  def add_funds(funds_added = 25)
    @funding += funds_added
    puts "Project #{@name} has added some funds!"
    ###{funds_added }in funding towards a goal of $#{@funding}"
  end

  def remove_funds(funds_removed = 10)
    @funding -= funds_removed
    puts "Project #{@name} has lost some funds!"
  end

  def fully_funded?
    funding == target_funding
  end
end
