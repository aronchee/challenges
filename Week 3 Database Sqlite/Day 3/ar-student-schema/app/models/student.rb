require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
	validates :email, format: { with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
	validates :email, uniqueness: true
	validates :age, numericality: {greater_than_or_equal_to: 5} 
	validates :phone, format: {with: /.*\d.*\d.*\d.*\d.*\d.*\d.*\d.*\d.*\d.*\d/}

		def name
			name = "#{self.first_name} #{self.last_name}"
		end

		def age
			now = Date.today
			age = now.year - self.birthday.year
		end

end