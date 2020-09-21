class VentureCapitalist
  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select {|v_capitalist| v_capitalist.total_worth > 1000000000}
  end

  def offer_contract(startup, investment_type, amount)
    FundingRound.new(startup, self, investment_type, amount)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.venture_capitalist == self}.length
  end

  def portfolio
    portfolio = []
    FundingRound.all.each do |round|
      if round.venture_capitalist == self
        portfolio << round.startup
      end
    end
    portfolio.uniq
  end

  def biggest_investment
    investments = [].sort
    FundingRound.all.each do |round|
      if round.venture_capitalist == self
        investments << round.investment
      end
    end
    investments[0]
  end

  def invested(domain)
    amt_invested = 0
    FundingRound.all.each do |round|
      if round.startup.domain == domain
        amt_invested += round.investment
      end
    end
    amt_invested
  end

end
