require_relative '../../db/config'

class Legislator < ActiveRecord::Base
	attr_reader :firstname, :middlename, :lastname, :phone, :name_suffix, :party, :state, :in_office, :gender

	def self.state(state)
		self.where(state: state)
	end

	def self.title(title)
		self.where(title: title)
	end

	def self.party(party)
		self.where(party: party)
	end

	def self.gender(gender)
		self.where(gender: gender)
	end

end
