class Project

  attr_reader :funding,:target_funding,:pledges_received
  attr_accessor :name


  def initialize(name, funding = 0, target_funding = 1000.00)
    @name = name.upcase
    @funding = funding
    @target_funding = target_funding
    @pledges_received = Hash.new(0)
  end

  def shortfall_funding
    target_funding - total_funding
  end

  def total_funding
    @funding + @pledges_received.values.reduce(0,:+)
  end

  def each_recieved_pledge
    @pledges_received.each do |name,amount|
      yield(Pledge.new(name,amount))
    end
  end


  def <=>(other_project)
    other_project.shortfall_funding <=> shortfall_funding
  end

  def total_funding_still_needed
    target_funding - total_funding
  end

  def to_s
    "Project #{@name} has a funding of $#{total_funding} and a target of $#{target_funding}."
  end

  def receive_pledge (pledge)
    @pledges_received[pledge.name] += pledge.amount
    puts "#{name} has gotten a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "#{name}'s pledges: #{@pledges_received}"
  end

  def add_funds(funds_added = 25)
    if fully_funded?
      puts "#{name} is fully funded so cannot accept more funds!"
    else
      @funding += funds_added
      puts "Project #{@name} has added some funds!"
      ###{funds_added }in funding towards a goal of $#{@funding}"
    end
  end

  def remove_funds(funds_removed = 10)
    @funding -= funds_removed
    puts "Project #{@name} has lost some funds!"
  end

  def fully_funded?
    total_funding >= target_funding
  end
end
