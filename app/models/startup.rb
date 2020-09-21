require 'pry'
class Startup
  attr_accessor :name, :domain
  attr_reader :founder

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    self.class.all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find {|startup| startup.founder == founder}
  end

  def self.domains
    self.all.select {|startup| startup.domain}
  end

  def sign_contract(venture_capitalist, investment_type, amount)
    FundingRound.new(self, venture_capitalist, investment_type, amount)
  end

  def num_funding_rounds
    FundingRound.all.select {|round| round.startup == self}.length
  end
 
  def investors
    investors = []
    FundingRound.all.each do |round|
      if round.startup == self
        investors << round.venture_capitalist
      end
    end
    investors.uniq
  end

  def big_investors
    big_investors = []
    self.investors.each do |investor|
      if VentureCapitalist.tres_commas_club.include? investor
        big_investors << investor
      end
    end
    big_investors.uniq
  end

end
