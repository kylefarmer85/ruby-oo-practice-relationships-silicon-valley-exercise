require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

tom = VentureCapitalist.new("Tom", 60000000.00)
elon = VentureCapitalist.new("Elon", 93000000000.00)
mark = VentureCapitalist.new("Mark", 99000000000.00)
jeff = VentureCapitalist.new("Jeff", 184000000000.00)

myspace = Startup.new("MySpace", "Tom", "myspace.com")
paypal = Startup.new("PayPal", "Elon", "paypal.com")
facebook = Startup.new("Facebook", "Mark", "facebook.com")
amazon = Startup.new("Amazon", "Jeff", "amazon.com")

funding_myspace = FundingRound.new(myspace, tom, "Angel", 50000000.00)
funding_paypal = FundingRound.new(paypal, elon, "Series A", 10000000.00)
funding_facebook = FundingRound.new(facebook, mark, "Series B", 20000000.00)
funding_amazon = FundingRound.new(amazon, jeff, "Series C", 1000000000.00)


# // TESTS // 
Startup.find_by_founder("Elon")
Startup.domains
VentureCapitalist.tres_commas_club
funding_amazon.startup
funding_myspace.type
funding_paypal.investment
funding_facebook.venture_capitalist

# // Associations and Aggregate Methods TESTS //

facebook.num_funding_rounds
myspace.investors
amazon.big_investors

mark.funding_rounds
tom.portfolio
elon.biggest_investment
jeff.invested("amazon.com")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line