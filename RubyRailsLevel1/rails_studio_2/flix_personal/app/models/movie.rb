class Movie < ActiveRecord::Base

  def flop?
    total_gross < 20000000
  end

  def self.released
    where('released_on <= ?',Time.now).order(:released_on)
  end

  def self.hits
    where('total_gross >= 300000000').order(total_gross: :desc)
  end

  def self.flops
    where('total_gross < 50000000').order(total_gross: :asc)
  end

  def self.recently_added
    order('created_at desc').limit(3)
  end


end
