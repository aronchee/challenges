# Place your solutions here
class BankAccount
	attr_reader :customer_name, :type, :acct_number

	def initialize(customer_name,type,acct_number)
		@customer_name = customer_name
		@type = type
		@acct_number = acct_number
	end

	def to_s
		hidden
		return "#{@customer_name}: #{@type} xxxxx#{@acct_number}"
	end

	def hidden
		@acct_number = acct_number.delete("-").slice(5..9) #remove the "-" in the number and slice off to print 5 to 9 digit
	end

end

my_acct = BankAccount.new("Junipero Serra", "Checking", "347-923-239")

str = "My account information is #{my_acct}"

p str
